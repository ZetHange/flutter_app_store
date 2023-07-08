class App {
  final int id;
  final String title;
  final String type;
  final String developer;
  final String logo;
  final String downloadLink;
  final List<String> screenshots;
  final String description;
  final String descriptionFull;
  final String latestVersion;
  final String packageName;
  final int downloadedQuantity;
  final int viewedQuantity;
  final bool isPublished;
  final AppInfo info;
  final DateTime createdAt;
  final DateTime updatedAt;

  App({
    required this.id,
    required this.title,
    required this.type,
    required this.developer,
    required this.logo,
    required this.downloadLink,
    required this.screenshots,
    required this.description,
    required this.descriptionFull,
    required this.latestVersion,
    required this.packageName,
    required this.downloadedQuantity,
    required this.viewedQuantity,
    required this.isPublished,
    required this.info,
    required this.createdAt,
    required this.updatedAt,
  });

  factory App.fromJson(Map<String, dynamic> json) {
    return App(
      id: json['id'] as int,
      title: json['title'] as String,
      type: json['type'] as String,
      developer: json['developer'] as String,
      logo: json['logo'] as String,
      downloadLink: json['downloadLink'] as String,
      screenshots: List<String>.from(json['screenshots'] as List),
      description: json['description'] as String,
      descriptionFull: json['descriptionFull'] as String,
      latestVersion: json['latestVersion'] as String,
      packageName: json['packageName'] as String,
      downloadedQuantity: json['downloadedQuantity'] as int,
      viewedQuantity: json['viewedQuantity'] as int,
      isPublished: json['isPublished'] as bool,
      info: AppInfo.fromJson(json['info'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}

class AppInfo {
  final String ageLimit;
  final String typeFile;
  final String customUpdatedAt;
  final String customCreatedAt;

  AppInfo({
    required this.ageLimit,
    required this.typeFile,
    required this.customUpdatedAt,
    required this.customCreatedAt,
  });

  factory AppInfo.fromJson(Map<String, dynamic> json) {
    return AppInfo(
      ageLimit: json['ageLimit'] as String,
      typeFile: json['typeFile'] as String,
      customUpdatedAt: json['customUpdatedAt'] as String,
      customCreatedAt: json['customCreatedAt'] as String,
    );
  }
}

class AppSummary {
  final int id;
  final String title;
  final String developer;
  final String logo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int downloadedQuantity;
  final int viewedQuantity;
  final bool isPublished;

  AppSummary({
    required this.id,
    required this.title,
    required this.developer,
    required this.logo,
    required this.createdAt,
    required this.updatedAt,
    required this.downloadedQuantity,
    required this.viewedQuantity,
    required this.isPublished,
  });

  factory AppSummary.fromJson(Map<String, dynamic> json) {
    return AppSummary(
      id: json['id'] as int,
      title: json['title'] as String,
      developer: json['developer'] as String,
      logo: json['logo'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      downloadedQuantity: json['downloadedQuantity'] as int,
      viewedQuantity: json['viewedQuantity'] as int,
      isPublished: json['isPublished'] as bool,
    );
  }
}

class AppSuggested {
  final App app;
  final List<App> apps;


  AppSuggested({
    required this.app,
    required this.apps,
  });

  factory AppSuggested.fromJson(Map<String, dynamic> json) {
    final appsList = json['apps'] as List<dynamic>;
    final apps = appsList.map((item) => App.fromJson(item)).toList();

    return AppSuggested(
      app: App.fromJson(json['app']),
      apps: apps,
    );
  }
}

class Package {
  String packageName;
  String version;

  Package({required this.packageName, required this.version});

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      packageName: json['packageName'],
      version: json['version'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'packageName': packageName,
      'version': version,
    };
  }
}
