import 'package:flutter/material.dart';
import 'package:notifier_app/components/text_bold_grey.dart';
import 'package:notifier_app/components/text_grey.dart';

class ChatHistoryComponent extends StatelessWidget {
  const ChatHistoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: const Color(0xFFE9E9E9),
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Row(
          children: [
            Container(
              child: Image.asset(
                'assets/images/profile.png',
                width: 80,
                height: 80,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBoldGrey(boldText: 'Car parking violation'),
                TextGrey(textDetails: 'Alert for parking'),
                TextGrey(textDetails: '12:09 PM')
                
              ],
            ),
            Row(

              children: [
                const SizedBox(width: 66 ),
                PopupMenuButton(
                  onSelected: (action) => selectAction(context, action),
                  iconColor: const Color(0xFF747474),
                  itemBuilder: (context) =>
                  [
                    const PopupMenuItem(
                      value: 'Check List',
                      child: ListTile(
                        title: Text('Check List'),
                        leading: Icon(Icons.checklist),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'Users List',
                      child: ListTile(
                        title: Text('Users List'),
                        leading: Icon(Icons.people),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        )
    );
  }

  void selectAction(BuildContext context, String action) {
    if (action == 'Users List') {
      //Navigate to Users List
    } else if (action == 'Check List') {
      //Navigate to CheckList
    }
  }
}
