import "package:fluentui_system_icons/fluentui_system_icons.dart";
import "package:flutter/material.dart";
import "package:weather_app/helper/global_constants.dart";

class HeaderWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  const HeaderWidget({super.key, required this.title, required this.subtitle});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          FluentIcons.location_12_filled,
          size: mq.height * 0.04,
        ),
        SizedBox(
          width: mq.width * 0.03,
        ),
        Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: mq.height * 0.04, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.subtitle,
              style: TextStyle(fontSize: mq.height * 0.015),
            )
          ],
        ),
      ],
    );
  }
}
