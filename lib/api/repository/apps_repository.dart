import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:swn_play/api/api.dart';
import 'package:swn_play/api/models/apps.dart';
import 'package:swn_play/api/models/pagination.dart';

Future<Pagination> fetchApps(
    {int page = 1, int pageSize = 150, String type = "", String q = ""}) async {
  final response = await http.get(Uri.parse(
      '${Api.apiUrl}/apps?q=${q}&type=${type}&page=${page}&pageSize=${pageSize}'));

  if (response.statusCode == 200) {
    debugPrint(response.body);
    final jsonMap = jsonDecode(utf8.decode(response.bodyBytes));
    final Pagination pagination = Pagination.fromJson(jsonMap);
    return pagination;
  } else {
    throw Exception('Failed to load apps: ${response.statusCode}');
  }
}

Future<AppSuggested> fetchAppById(int id) async {
  final response = await http.get(Uri.parse('${Api.apiUrl}/apps/$id'));

  if (response.statusCode == 200) {
    final app = AppSuggested.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    return app;
  } else {
    throw Exception('Failed to load app with id $id: ${response.statusCode}');
  }
}

Future<App> downloadAppById(int id) async {
  final response =
      await http.post(Uri.parse('${Api.apiUrl}/apps/download/$id'));

  if (response.statusCode == 200) {
    final app = App.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    return app;
  } else {
    throw Exception(
        'Failed to download app with id $id: ${response.statusCode}');
  }
}

Future<App> viewAppById(int id) async {
  final response = await http.post(Uri.parse('${Api.apiUrl}/apps/view/$id'));

  if (response.statusCode == 200) {
    final app = App.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    return app;
  } else {
    throw Exception('Failed to view app with id $id: ${response.statusCode}');
  }
}

Future<List<AppSummary>> getUpdateApps(List<Package> packages) async {
  String packagesJson =
      jsonEncode(packages.map((package) => package.toJson()).toList());
  final response = await http.post(Uri.parse('${Api.apiUrl}/apps/getUpdates'),
      body: packagesJson, headers: {'Content-Type': 'application/json'});

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(utf8.decode(response.bodyBytes));
    final app = jsonList.map((json) => AppSummary.fromJson(json)).toList();
    return app;
  } else {
    throw Exception('Failed to get updates: ${response.statusCode}');
  }
}
