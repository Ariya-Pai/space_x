import 'dart:convert';

LaunchesModel launchesModelFromJson(String str) =>
    LaunchesModel.fromJson(json.decode(str));

String launchesModelToJson(LaunchesModel data) => json.encode(data.toJson());

List<LaunchesModel> launchesModelListFromJson(dynamic jsonData) {
  final list = jsonData as List<dynamic>;
  return list
      .map((e) => LaunchesModel.fromJson(e as Map<String, dynamic>))
      .toList();
}

class LaunchesModel {
  final String? id;
  final String? name;
  final int? flightNumber;
  final String? rocket;
  final String? launchpad;
  final List<String>? payloads;
  final DateTime? dateUtc;
  final String? dateLocal;
  final String? datePrecision;
  final bool? upcoming;
  final bool? success;
  final String? details;
  final List<Failure>? failures;
  final List<Core>? cores;
  final Links? links;
  final Fairings? fairings;
  final List<String>? crew;
  final List<String>? ships;
  final List<String>? capsules;

  LaunchesModel({
    this.id,
    this.name,
    this.flightNumber,
    this.rocket,
    this.launchpad,
    this.payloads,
    this.dateUtc,
    this.dateLocal,
    this.datePrecision,
    this.upcoming,
    this.success,
    this.details,
    this.failures,
    this.cores,
    this.links,
    this.fairings,
    this.crew,
    this.ships,
    this.capsules,
  });

  factory LaunchesModel.fromJson(Map<String, dynamic> json) => LaunchesModel(
    id: json["id"],
    name: json["name"],
    flightNumber: json["flight_number"],
    rocket: json["rocket"],
    launchpad: json["launchpad"],
    payloads:
        json["payloads"] == null ? [] : List<String>.from(json["payloads"]),
    dateUtc: json["date_utc"] == null ? null : DateTime.parse(json["date_utc"]),
    dateLocal: json["date_local"],
    datePrecision: json["date_precision"],
    upcoming: json["upcoming"],
    success: json["success"],
    details: json["details"],
    failures:
        json["failures"] == null
            ? []
            : (json["failures"] as List)
                .map((e) => Failure.fromJson(e))
                .toList(),
    cores:
        json["cores"] == null
            ? []
            : (json["cores"] as List).map((e) => Core.fromJson(e)).toList(),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    fairings:
        json["fairings"] == null ? null : Fairings.fromJson(json["fairings"]),
    crew: json["crew"] == null ? [] : List<String>.from(json["crew"]),
    ships: json["ships"] == null ? [] : List<String>.from(json["ships"]),
    capsules:
        json["capsules"] == null ? [] : List<String>.from(json["capsules"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "flight_number": flightNumber,
    "rocket": rocket,
    "launchpad": launchpad,
    "payloads": payloads,
    "date_utc": dateUtc?.toIso8601String(),
    "date_local": dateLocal,
    "date_precision": datePrecision,
    "upcoming": upcoming,
    "success": success,
    "details": details,
    "failures": failures?.map((e) => e.toJson()).toList(),
    "cores": cores?.map((e) => e.toJson()).toList(),
    "links": links?.toJson(),
    "fairings": fairings?.toJson(),
    "crew": crew,
    "ships": ships,
    "capsules": capsules,
  };
}

class Failure {
  final int? time;
  final int? altitude;
  final String? reason;

  Failure({this.time, this.altitude, this.reason});

  factory Failure.fromJson(Map<String, dynamic> json) => Failure(
    time: json["time"],
    altitude: json["altitude"],
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "altitude": altitude,
    "reason": reason,
  };
}

class Core {
  final String? core;
  final int? flight;
  final bool? reused;
  final bool? gridfins;
  final bool? legs;
  final bool? landingAttempt;
  final bool? landingSuccess;
  final String? landingType;
  final String? landpad;

  Core({
    this.core,
    this.flight,
    this.reused,
    this.gridfins,
    this.legs,
    this.landingAttempt,
    this.landingSuccess,
    this.landingType,
    this.landpad,
  });

  factory Core.fromJson(Map<String, dynamic> json) => Core(
    core: json["core"],
    flight: json["flight"],
    reused: json["reused"],
    gridfins: json["gridfins"],
    legs: json["legs"],
    landingAttempt: json["landing_attempt"],
    landingSuccess: json["landing_success"],
    landingType: json["landing_type"],
    landpad: json["landpad"],
  );

  Map<String, dynamic> toJson() => {
    "core": core,
    "flight": flight,
    "reused": reused,
    "gridfins": gridfins,
    "legs": legs,
    "landing_attempt": landingAttempt,
    "landing_success": landingSuccess,
    "landing_type": landingType,
    "landpad": landpad,
  };
}

class Links {
  final Patch? patch;
  final Reddit? reddit;
  final Flickr? flickr;
  final String? presskit;
  final String? webcast;
  final String? youtubeId;
  final String? article;
  final String? wikipedia;

  Links({
    this.patch,
    this.reddit,
    this.flickr,
    this.presskit,
    this.webcast,
    this.youtubeId,
    this.article,
    this.wikipedia,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    patch: json["patch"] == null ? null : Patch.fromJson(json["patch"]),
    reddit: json["reddit"] == null ? null : Reddit.fromJson(json["reddit"]),
    flickr: json["flickr"] == null ? null : Flickr.fromJson(json["flickr"]),
    presskit: json["presskit"],
    webcast: json["webcast"],
    youtubeId: json["youtube_id"],
    article: json["article"],
    wikipedia: json["wikipedia"],
  );

  Map<String, dynamic> toJson() => {
    "patch": patch?.toJson(),
    "reddit": reddit?.toJson(),
    "flickr": flickr?.toJson(),
    "presskit": presskit,
    "webcast": webcast,
    "youtube_id": youtubeId,
    "article": article,
    "wikipedia": wikipedia,
  };
}

class Patch {
  final String? small;
  final String? large;

  Patch({this.small, this.large});

  factory Patch.fromJson(Map<String, dynamic> json) =>
      Patch(small: json["small"], large: json["large"]);

  Map<String, dynamic> toJson() => {"small": small, "large": large};
}

class Reddit {
  final String? campaign;
  final String? launch;
  final String? media;
  final String? recovery;

  Reddit({this.campaign, this.launch, this.media, this.recovery});

  factory Reddit.fromJson(Map<String, dynamic> json) => Reddit(
    campaign: json["campaign"],
    launch: json["launch"],
    media: json["media"],
    recovery: json["recovery"],
  );

  Map<String, dynamic> toJson() => {
    "campaign": campaign,
    "launch": launch,
    "media": media,
    "recovery": recovery,
  };
}

class Flickr {
  final List<String>? small;
  final List<String>? original;

  Flickr({this.small, this.original});

  factory Flickr.fromJson(Map<String, dynamic> json) => Flickr(
    small:
        json["small"] == null
            ? []
            : List<String>.from(json["small"].map((x) => x)),
    original:
        json["original"] == null
            ? []
            : List<String>.from(json["original"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {"small": small, "original": original};
}

class Fairings {
  final bool? reused;
  final bool? recoveryAttempt;
  final bool? recovered;
  final List<String>? ships;

  Fairings({this.reused, this.recoveryAttempt, this.recovered, this.ships});

  factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
    reused: json["reused"],
    recoveryAttempt: json["recovery_attempt"],
    recovered: json["recovered"],
    ships: json["ships"] == null ? [] : List<String>.from(json["ships"]),
  );

  Map<String, dynamic> toJson() => {
    "reused": reused,
    "recovery_attempt": recoveryAttempt,
    "recovered": recovered,
    "ships": ships,
  };
}
