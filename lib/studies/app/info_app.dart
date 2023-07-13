import 'package:flutter/material.dart';
import 'package:swn_play/api/models/apps.dart';

class InfoAppWidget extends StatelessWidget {
  final App app;

  const InfoAppWidget({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          children: [
            const Icon(Icons.file_copy),
            Text("Тип: ${app.info.typeFile}"),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            const Icon(Icons.swap_vertical_circle),
            Text("Версия: ${app.latestVersion}"),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            const Icon(Icons.file_download_outlined),
            Text("Размер файла: ${app.fileWeight}"),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            const Icon(Icons.verified_user_rounded),
            Text(app.info.ageLimit),
          ],
        )
      ]),
    );
  }
}
