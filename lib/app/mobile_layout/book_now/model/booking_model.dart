import 'dart:convert';

BookingModel bookingModelFromJson(String str) =>
    BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
  BookingModel({
    this.status,
    required this.data,
  });

  bool? status;
  List<bookingData> data;

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        status: json["status"],
        data: List<bookingData>.from(json["data"].map((x) => bookingData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class bookingData {
  bookingData({
    this.id,
    this.bookingDate,
    this.turfId,
    required this.timeSlot,
  });

  String? id;
  String? bookingDate;
  String? turfId;
  List<int> timeSlot;

  factory bookingData.fromJson(Map<String, dynamic> json) => bookingData(
        id: json["_id"],
        bookingDate: json["booking_date"],
        turfId: json["turf_id"],
        timeSlot: List<int>.from(json["time_slot"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "booking_date": bookingDate,
        "turf_id": turfId,
        "time_slot": List<dynamic>.from(timeSlot.map((x) => x)),
      };
}
