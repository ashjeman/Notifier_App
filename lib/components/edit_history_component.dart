import 'package:flutter/material.dart';
import 'package:notifier_app/components/text_bold_grey.dart';
import 'package:notifier_app/components/text_grey.dart';

class EditHistoryComponent extends StatelessWidget {
  const EditHistoryComponent({super.key});

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
                'assets/images/desktop.png',
                width: 70,
                height: 70,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                        Icons.calendar_month,
                      color: Color(0xFF616260),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBoldGrey(boldText: 'Inspection Date'),
                        TextGrey(textDetails: '1/8/2024')
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Color(0xFF616260),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBoldGrey(boldText: 'Inspector'),
                        TextGrey(textDetails: 'Azmina')
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Color(0xFF616260),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBoldGrey(boldText: 'Location'),
                        TextGrey(textDetails: 'Lobby')
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.comment,
                      color: Color(0xFF616260),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBoldGrey(boldText: 'Comment'),
                        TextGrey(textDetails: '"Update the expiry date"')
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        )
    );
  }
}
