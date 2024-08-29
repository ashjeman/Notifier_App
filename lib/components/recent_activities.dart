import 'package:flutter/material.dart';

class RecentActivities extends StatefulWidget {
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
  State<RecentActivities> createState() => _RecentActivitiesState();
}

class _RecentActivitiesState extends State<RecentActivities> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      color: const Color(0xFFE9E9E9),
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  widget.imageIcon,
                  height: 35,
                  width: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.activityTitle,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.activitySite,
                        style: const TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      backgroundColor: const Color(0xFF8D97A5),
                      value: widget.currentProgress,
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
                        fontWeight: FontWeight.bold, fontSize: 12),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

