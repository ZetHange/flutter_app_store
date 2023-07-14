import 'package:flutter/material.dart';
import 'package:swn_play/api/models/apps.dart';
import 'package:swn_play/studies/markdown.dart';

class WhatsNewWidget extends StatelessWidget {
  final App app;

  const WhatsNewWidget({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Что нового:",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                "Последнее обновление: ${app.info.customUpdatedAt}",
                style: const TextStyle(fontSize: 10, color: Colors.black45),
              ),
              const SizedBox(height: 5),
              app.whatsNew.length >= 99
                  ? MyMarkdownWidget("${app.whatsNew.substring(0, 99)}...")
                  : MyMarkdownWidget(app.whatsNew),
            ],
          ),
        ),
      ],
    );
  }
}
