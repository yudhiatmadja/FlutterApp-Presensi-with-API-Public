// To parse this JSON data, do
//
//     final savePresensiResponModel = savePresensiResponModelFromJson(jsonString);

import 'dart:convert';

SavePresensiResponModel savePresensiResponModelFromJson(String str) =>
    SavePresensiResponModel.fromJson(json.decode(str));

String savePresensiResponModelToJson(SavePresensiResponModel data) =>
    json.encode(data.toJson());

class SavePresensiResponModel {
  bool success;
  String message;
  Data data;

  SavePresensiResponModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SavePresensiResponModel.fromJson(Map<String, dynamic> json) =>
      SavePresensiResponModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  int id;
  int userId;
  String latitude;
  String longitude;
  DateTime tanggal;
  String masuk;
  String pulang;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.id,
    required this.userId,
    required this.latitude,
    required this.longitude,
    required this.tanggal,
    required this.masuk,
    required this.pulang,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        tanggal: DateTime.parse(json["tanggal"]),
        masuk: json["masuk"],
        pulang: json["pulang"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "latitude": latitude,
        "longitude": longitude,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "masuk": masuk,
        "pulang": pulang,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
