import 'package:flutter/material.dart';
import 'package:swn_play/api/models/pagination.dart';

import '../api/repository/apps_repository.dart';
import '../studies/app.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  late Future<Pagination> _futureApps;

  @override
  void initState() {
    super.initState();
    _futureApps = fetchApps();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
        child: FutureBuilder<Pagination>(
          future: _futureApps,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.content.length,
                itemBuilder: (context, index) {
                  final post = snapshot.data!.content[index];
                  return AppListWidget(
                    id: post.id,
                    title: post.title,
                    logo: post.logo,
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}