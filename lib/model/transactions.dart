// To parse this JSON data, do
//
//     final transactions = transactionsFromJson(jsonString);

import 'dart:convert';

Transactions transactionsFromJson(String str) => Transactions.fromJson(json.decode(str));

String transactionsToJson(Transactions data) => json.encode(data.toJson());

class Transactions {
  Transactions({
    required this.status,
    required this.userDetails,
  });

  int status;
  List<UserDetail> userDetails;

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
    status: json["status"],
    userDetails: List<UserDetail>.from(json["userDetails"].map((x) => UserDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "userDetails": List<dynamic>.from(userDetails.map((x) => x.toJson())),
  };
}

class UserDetail {
  UserDetail({
    required this.id,
    required this.name,
    this.address,
    required this.phone,
    required this.image,
    required this.branchId,
    required this.currentPosition,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.transactions,
  });

  int id;
  String name;
  dynamic address;
  String phone;
  String image;
  int branchId;
  String currentPosition;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Transaction> transactions;

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    phone: json["phone"],
    image: json["image"],
    branchId: json["branch_id"],
    currentPosition: json["current_position"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    transactions: List<Transaction>.from(json["transactions"].map((x) => Transaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "phone": phone,
    "image": image,
    "branch_id": branchId,
    "current_position": currentPosition,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
  };
}

class Transaction {
  Transaction({
    required this.id,
    required this.profileId,
    required this.details,
    required this.amount,
    this.fromTo,
    required this.cdStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int profileId;
  String details;
  String amount;
  dynamic fromTo;
  String cdStatus;
  DateTime createdAt;
  DateTime updatedAt;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json["id"],
    profileId: json["profile_id"],
    details: json["details"],
    amount: json["amount"],
    fromTo: json["from_to"],
    cdStatus: json["cd_status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profile_id": profileId,
    "details": details,
    "amount": amount,
    "from_to": fromTo,
    "cd_status": cdStatus,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
