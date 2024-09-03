import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:notifier_app/components/tasks_components/scanned_items_component.dart';
import '../../components/background_container.dart';
import '../../components/custom_app_bar.dart';
import '../../components/header.dart';
import '../../components/nav_bar.dart';
import '../../components/search_field.dart';

class ScannedItemsPage extends StatefulWidget {
  const ScannedItemsPage({super.key});

  @override
  State<ScannedItemsPage> createState() => _ScannedItemsPageState();
}

class _ScannedItemsPageState extends State<ScannedItemsPage> {
  String scanResult = '';

  Future<void> scanQR() async {
    String qrResult;

    try{
      qrResult = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.QR);
    } on PlatformException{
      qrResult = "Failed to scan";
    }

    setState(() {
      scanResult = qrResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : true,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomAppBar(
                appBarTitle: 'Items List'
            )
        ),
        bottomNavigationBar: NavBar(currentPageIndex: 0),
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
                      const ContainerHeader(headerTitle: 'Scanned Items'),
                      GestureDetector(
                        onTap: () {
                          scanQR();
                        },
                        child: const ImageIcon(AssetImage('assets/icons/scan-qr-icon.png'), color: Color(0xFF2B5EA8),size: 33,),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const SearchField(),
                  const SizedBox(height: 10),
                  const Column(
                    children: [
                      ScannedItemsComponent()
                    ],
                  )
                ],
              )
          ),
        )
    );
  }
}
