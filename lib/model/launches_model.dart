// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators, prefer_if_null_operators

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.data,
  });

  final Data? data;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data?.toJson(),
      };
}

class Data {
  Data({
    this.launches,
  });

  final List<Launch>? launches;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        launches: json["launches"] == null
            ? null
            : List<Launch>.from(
                json["launches"].map((x) => Launch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "launches": launches == null
            ? null
            : List<dynamic>.from(launches!.map((x) => x.toJson())),
      };
}

class Launch {
  Launch({
    this.missionName,
    this.missionId,
    this.rocket,
    this.launchSite,
    this.launchDateLocal,
  });

  final String? missionName;
  final List<String>? missionId;
  final LaunchRocket? rocket;
  final LaunchSite? launchSite;
  final String? launchDateLocal;

  factory Launch.fromJson(Map<String, dynamic> json) => Launch(
        missionName: json["mission_name"] == null ? null : json["mission_name"],
        missionId: json["mission_id"] == null
            ? null
            : List<String>.from(json["mission_id"].map((x) => x)),
        rocket: json["rocket"] == null
            ? null
            : LaunchRocket.fromJson(json["rocket"]),
        launchSite: json["launch_site"] == null
            ? null
            : LaunchSite.fromJson(json["launch_site"]),
        launchDateLocal: json["launch_date_local"] == null
            ? null
            : json["launch_date_local"],
      );

  Map<String, dynamic> toJson() => {
        "mission_name": missionName == null ? null : missionName,
        "mission_id": missionId == null
            ? null
            : List<dynamic>.from(missionId!.map((x) => x)),
        "rocket": rocket == null ? null : rocket?.toJson(),
        "launch_site": launchSite == null ? null : launchSite?.toJson(),
        "launch_date_local": launchDateLocal == null ? null : launchDateLocal,
      };
}

class LaunchSite {
  LaunchSite({
    this.siteName,
  });

  final String? siteName;

  factory LaunchSite.fromJson(Map<String, dynamic> json) => LaunchSite(
        siteName: json["site_name"] == null ? null : json["site_name"],
      );

  Map<String, dynamic> toJson() => {
        "site_name": siteName == null ? null : siteName,
      };
}

class LaunchRocket {
  LaunchRocket({
    this.rocketName,
    this.rocket,
  });

  final String? rocketName;
  final RocketRocket? rocket;

  factory LaunchRocket.fromJson(Map<String, dynamic> json) => LaunchRocket(
        rocketName: json["rocket_name"] == null ? null : json["rocket_name"],
        rocket: json["rocket"] == null
            ? null
            : RocketRocket.fromJson(json["rocket"]),
      );

  Map<String, dynamic> toJson() => {
        "rocket_name": rocketName == null ? null : rocketName,
        "rocket": rocket == null ? null : rocket?.toJson(),
      };
}

class RocketRocket {
  RocketRocket({
    this.company,
    this.name,
    this.mass,
  });

  final String? company;
  final String? name;
  final Mass? mass;

  factory RocketRocket.fromJson(Map<String, dynamic> json) => RocketRocket(
        company: json["company"] == null ? null : json["company"],
        name: json["name"] == null ? null : json["name"],
        mass: json["mass"] == null ? null : Mass.fromJson(json["mass"]),
      );

  Map<String, dynamic> toJson() => {
        "company": company == null ? null : company,
        "name": name == null ? null : name,
        "mass": mass == null ? null : mass?.toJson(),
      };
}

class Mass {
  Mass({
    this.kg,
  });

  final int? kg;

  factory Mass.fromJson(Map<String, dynamic> json) => Mass(
        kg: json["kg"] == null ? null : json["kg"],
      );

  Map<String, dynamic> toJson() => {
        "kg": kg == null ? null : kg,
      };
}
