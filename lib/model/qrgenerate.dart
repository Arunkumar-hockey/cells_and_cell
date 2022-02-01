// To parse this JSON data, do
//
//     final viewQrCode = viewQrCodeFromJson(jsonString);

import 'dart:convert';

ViewQrCode viewQrCodeFromJson(String str) => ViewQrCode.fromJson(json.decode(str));

String viewQrCodeToJson(ViewQrCode data) => json.encode(data.toJson());

class ViewQrCode {
  ViewQrCode({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  Data data;

  factory ViewQrCode.fromJson(Map<String, dynamic> json) => ViewQrCode(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.qr,
  });

  String qr;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    qr: json["qr"],
  );

  Map<String, dynamic> toJson() => {
    "qr": qr,
  };
}
