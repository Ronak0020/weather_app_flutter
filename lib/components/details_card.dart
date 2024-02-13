import "package:fluentui_system_icons/fluentui_system_icons.dart";
import "package:flutter/material.dart";

class DetailCard extends StatefulWidget {
  final String detail;
  final Widget? child;
  const DetailCard({super.key, required this.detail, this.child});

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            color: Colors.grey.shade300,
          ),
          child: widget.child ?? const Icon(FluentIcons.temperature_16_filled),
        ),
        Text(widget.detail)
      ],
    );
  }
}
