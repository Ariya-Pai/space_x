import 'dart:convert';

LaunchPadModel launchPadModelFromJson(String str) =>
    LaunchPadModel.fromJson(json.decode(str));

String launchPadModelToJson(LaunchPadModel data) => json.encode(data.toJson());
List<LaunchPadModel> launchPadModelListFromJson(dynamic jsonData) {
  final list = jsonData as List<dynamic>;
  return list
      .map((e) => LaunchPadModel.fromJson(e as Map<String, dynamic>))
      .toList();
}

class LaunchPadModel {
  final List<String>? images;
  final String? name;
  final String? fullName;
  final String? locality;
  final String? region;
  final double? latitude;
  final double? longitude;
  final int? launchAttempts;
  final int? launchSuccesses;
  final List<String>? rockets;
  final String? timezone;
  final List<dynamic>? launches;
  final String? status;
  final String? details;
  final String? id;

  LaunchPadModel({
    this.images,
    this.name,
    this.fullName,
    this.locality,
    this.region,
    this.latitude,
    this.longitude,
    this.launchAttempts,
    this.launchSuccesses,
    this.rockets,
    this.timezone,
    this.launches,
    this.status,
    this.details,
    this.id,
  });

  factory LaunchPadModel.fromJson(Map<String, dynamic> json) => LaunchPadModel(
    images: List<String>.from(json["images"]["large"]),
    name: json["name"],
    fullName: json["full_name"],
    locality: json["locality"],
    region: json["region"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    launchAttempts: json["launch_attempts"],
    launchSuccesses: json["launch_successes"],
    rockets: List<String>.from(json["rockets"]),
    timezone: json["timezone"],
    launches: json["launches"],
    status: json["status"],
    details: json["details"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "images": {"large": images},
    "name": name,
    "full_name": fullName,
    "locality": locality,
    "region": region,
    "latitude": latitude,
    "longitude": longitude,
    "launch_attempts": launchAttempts,
    "launch_successes": launchSuccesses,
    "rockets": rockets,
    "timezone": timezone,
    "launches": launches,
    "status": status,
    "details": details,
    "id": id,
  };
}
