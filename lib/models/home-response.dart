// To parse this JSON data, do
//
//     final homeResponModel = homeResponModelFromJson(jsonString);

import 'dart:convert';

HomeResponModel homeResponModelFromJson(String str) =>
    HomeResponModel.fromJson(json.decode(str));

String homeResponModelToJson(HomeResponModel data) =>
    json.encode(data.toJson());

class HomeResponModel {
  bool success;
  String message;
  List<Datum> data;

  HomeResponModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory HomeResponModel.fromJson(Map<String, dynamic> json) =>
      HomeResponModel(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  int userId;
  String latitude;
  String longitude;
  String tanggal;
  String masuk;
  String pulang;
  DateTime createdAt;
  DateTime updatedAt;
  bool isHariIni;

  Datum({
    required this.id,
    required this.userId,
    required this.latitude,
    required this.longitude,
    required this.tanggal,
    required this.masuk,
    required this.pulang,
    required this.createdAt,
    required this.updatedAt,
    required this.isHariIni,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        tanggal: json["tanggal"],
        masuk: json["masuk"],
        pulang: json["pulang"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isHariIni: json["is_hari_ini"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "latitude": latitude,
        "longitude": longitude,
        "tanggal": tanggal,
        "masuk": masuk,
        "pulang": pulang,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_hari_ini": isHariIni,
      };
}
