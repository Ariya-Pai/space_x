import 'dart:convert';

CrewModel crewModelFromJson(String str) => CrewModel.fromJson(json.decode(str));

String crewModelToJson(CrewModel data) => json.encode(data.toJson());

class CrewModel {
  final String? name;
  final String? agency;
  final String? image;
  final String? wikipedia;
  final List<String>? launches;
  final String? status;
  final String? id;

  CrewModel({
    this.name,
    this.agency,
    this.image,
    this.wikipedia,
    this.launches,
    this.status,
    this.id,
  });

  factory CrewModel.fromJson(Map<String, dynamic> json) => CrewModel(
    name: json["name"],
    agency: json["agency"],
    image: json["image"],
    wikipedia: json["wikipedia"],
    launches:
        json["launches"] == null ? [] : List<String>.from(json["launches"]),
    status: json["status"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "agency": agency,
    "image": image,
    "wikipedia": wikipedia,
    "launches": launches,
    "status": status,
    "id": id,
  };
}
