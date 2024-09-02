import 'package:flutter/material.dart';

class TaskComponent extends StatefulWidget {
  final String imageIcon;
  final String activityTitle;
  final String activitySite;
  final double currentProgress;
  final VoidCallback callback;

  const TaskComponent({
    super.key,
    required this.imageIcon,
    required this.activityTitle,
    required this.activitySite,
    required this.currentProgress,
    required this.callback,
  });

  @override
  State<TaskComponent> createState() => _TaskComponentState();
}

class _TaskComponentState extends State<TaskComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callback,  // Use the callback on tap
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE9E9E9),
          borderRadius: BorderRadius.circular(10)
        ),
        margin: const EdgeInsets.only(top: 10),
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
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.activitySite,
                          style: const TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
