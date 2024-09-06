import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:notifier_app/components/alarm_components/alarm_component.dart';
import 'package:notifier_app/components/background_container.dart';
import 'package:notifier_app/components/header.dart';
import 'package:notifier_app/components/search_field.dart';
import 'package:notifier_app/models/allAlarm.dart';
import 'package:notifier_app/services/alarm_service.dart';

import '../../components/custom_app_bar.dart';
import '../../components/nav_bar.dart';
import '../../models/allSite.dart';
import '../../services/asset_location_service.dart';

class AlarmListPage extends StatefulWidget {
  const AlarmListPage({super.key});

  @override
  State<AlarmListPage> createState() => _AlarmListPageState();
}

class _AlarmListPageState extends State<AlarmListPage> {

  List<AllAlarm>? allAlarm;
  List<AllAlarm>? foundAlarm = [];
  List<AllSite>? allSites;
  TextEditingController controller = TextEditingController();
  var isLoaded = false;
  int? _sliding = 0;
  String alarmSort = 'Date';
  int _value = 1;

    @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async{
    allAlarm = await AlarmService().getAllAlarm();
    allSites = await AssetLocationService().getAllSite();

    if(allAlarm != null){
      setState(() {
        isLoaded = true;
        foundAlarm = allAlarm;
      });
    }
  }

  void runFilter(String userInput) {
    List<AllAlarm>? results = [];

    if (userInput.isEmpty) {
      results = allAlarm; // Use the original list if no input is provided
    } else if (allAlarm != null) {
      results = allAlarm!.where((alarm) =>
          alarm.message!.toLowerCase().contains(userInput.toLowerCase())).toList();
    }

    if (userInput == '0'){
      results = allAlarm!.where((alarm) => alarm.escalationState == EscalationState.PENDING).toList();
      print("slide 0");
    }else if(userInput == '1'){
      results = allAlarm!.where((alarm) => alarm.escalationState == EscalationState.CLOSED).toList();
      print("slide 1");
    }

    setState(() {
      foundAlarm = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
              appBarTitle: 'Alarm'
          )
      ),
      bottomNavigationBar: NavBar(currentPageIndex: 2),
      body: Container(
        padding: const EdgeInsets.only(top: 70),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/app-bg.png'),
            fit: BoxFit.cover, // This makes sure the image covers the entire background
          ),
      ),
      child: BackgroundContainer(
          boxHeight: 800,
          bgChild: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ContainerHeader(headerTitle: 'Alarms List'),
                  GestureDetector(
                    onTap: () {
                      _siteOption(context);
                    } ,
                    child: const ImageIcon(AssetImage('assets/icons/sort-icon.png'), color: Color(0xFF070458)),
                  )
                ],
              ),
              const SizedBox(height: 10),
              SearchField(controller: controller, onChanged: (userInput) => runFilter(userInput)),
              const SizedBox(height: 10),
              CupertinoSlidingSegmentedControl(
                children: const {
                  0: Text('Pending'),
                  1: Text('Closed'),
                },
                groupValue: _sliding,
                onValueChanged: (int? newValue) {
                  setState(() {
                    _sliding = newValue;
                    runFilter(_sliding.toString());
                    //print("Slide $_sliding");
                  });
                },
                backgroundColor: const Color(0xFFD9D9D9),
                thumbColor: const Color(0xFFADA1F8),
              ),
              const SizedBox(height: 10),
              Expanded(
                  child: isLoaded
                      ? ListView.builder(
                      padding: const EdgeInsets.only(top: 0.0),
                      itemCount: foundAlarm?.length,
                      itemBuilder: (context, index) {
                        return AlarmComponent(
                          alarmTitle: foundAlarm![index].message,
                          alarmGroup: foundAlarm![index].alarmGroupName.toString(),
                          dateTime: foundAlarm![index].submissionDateTime,
                          mediaLink: '${foundAlarm![index].url}',);
                      })
                      : const Center(child: CircularProgressIndicator())
              ),
            ],
          )
      ),
    )
    );
  }

  Future _siteOption(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(15),
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ContainerHeader(headerTitle: 'Site option'),
            const SizedBox(height: 10),
            const Text(
              'Choose site',
              style: TextStyle(
                color: Color(0xFF070458),
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 10),
            DropdownButton(
                value: _value,
                items: allSites?.map((e) {
                  return DropdownMenuItem(
                    value: e.id,
                    child: Text("${e.siteName}"),
                  );
                }).toList(),
                onChanged: (v) {
                  setState(() {
                    _value = v as int;
                  });
                }),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF355992),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
