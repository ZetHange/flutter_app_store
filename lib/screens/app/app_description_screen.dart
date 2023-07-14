import 'package:flutter/material.dart';
import 'package:swn_play/api/models/apps.dart';
import 'package:swn_play/studies/markdown.dart';

class AppDescriptionScreen extends StatelessWidget {
  final App app;
  final String installedPackageVersion;

  const AppDescriptionScreen({
    super.key,
    required this.app,
    required this.installedPackageVersion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Описание"),
      ),
      body: Container(
        margin: const EdgeInsets.only(right: 10, left: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              if (app.whatsNew.isNotEmpty)
                const Text(
                "Что нового:",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (app.whatsNew.isNotEmpty)
                MyMarkdownWidget(app.whatsNew),
              const SizedBox(height: 10),
              const Text(
                "Описание:",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              MyMarkdownWidget(app.descriptionFull),
              const Divider(color: Colors.grey),
              Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Имя пакета:"),
                        Text(app.packageName)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Версия:"),
                        Text(app.latestVersion)
                      ],
                    ),
                    if (installedPackageVersion.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Установленная версия:"),
                          Text(installedPackageVersion),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Разработчик:"),
                        Text(app.developer)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Дата выпуска:"),
                        Text(app.info.customCreatedAt)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Дата обновления:"),
                        Text(app.info.customUpdatedAt)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Количество просмотров:"),
                        Text(app.viewedQuantity.toString())
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Количество скачиваний:"),
                        Text(app.downloadedQuantity.toString())
                      ],
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
