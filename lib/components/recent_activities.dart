import 'package:flutter/material.dart';

class RecentActivities extends StatelessWidget {
  final String imageIcon;
  final String activityTitle;
  final String activitySite;
  final double currentProgress;

  const RecentActivities({
    super.key,
    required this.imageIcon,
    required this.activityTitle,
    required this.activitySite,
    required this.currentProgress
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: const Color(0xFFE9E9E9),
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    imageIcon,
                    height: 35,
                    width: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          activityTitle,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          activitySite,
                          style: const TextStyle(
                            fontSize: 11,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(child: LinearProgressIndicator(
                      backgroundColor: const Color(0xFF8D97A5),
                      value: currentProgress,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF355992),
                    ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      '30%',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        )
    );
  }
}
