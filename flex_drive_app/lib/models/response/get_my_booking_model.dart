import 'package:flexdrive/models/response/base_response_model.dart';

class GetMyBookingModel extends BaseResponseModel {
  List<MyBookingData>? data;
  int? results;
  int? totalRecords;

  GetMyBookingModel(
      {super.status,
      super.message,
      this.data,
      this.results,
      this.totalRecords});

  GetMyBookingModel.fromJson(Map<String, dynamic> json) {
    BaseResponseModel base = BaseResponseModel.fromJson(json);
    status = base.status;
    message = base.message;
    if (json['data'] != null) {
      data = <MyBookingData>[];
      json['data'].forEach((v) {
        data!.add(new MyBookingData.fromJson(v));
      });
    } else {
      data = [];
    }
    results = json['results'];
    totalRecords = json['totalRecords'];
  }
}

class MyBookingData {
  String? sId;
  int? bookingId;
  int? attemptNumber;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? status;
  String? subscriptionId;
  String? bookingEndDate;
  int? bookingPrice;
  String? bookingStartDate;
  Car? car;
  Package? package;
  int? remainingKilometers;
  int? totalKilometers;
  String? user;
  int? tollStationsCrossed;

  MyBookingData(
      {this.sId,
      this.bookingId,
      this.attemptNumber,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.status,
      this.subscriptionId,
      this.bookingEndDate,
      this.bookingPrice,
      this.bookingStartDate,
      this.car,
      this.package,
      this.remainingKilometers,
      this.totalKilometers,
      this.user,
      this.tollStationsCrossed});

  MyBookingData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    bookingId = json['bookingId'];
    attemptNumber = json['attemptNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    status = json['status'];
    subscriptionId = json['subscriptionId'];
    bookingEndDate = json['bookingEndDate'];
    bookingPrice = json['bookingPrice'];
    bookingStartDate = json['bookingStartDate'];
    car = json['car'] != null ? new Car.fromJson(json['car']) : null;
    package =
        json['package'] != null ? new Package.fromJson(json['package']) : null;
    remainingKilometers = json['remainingKilometers'];
    totalKilometers = json['totalKilometers'];
    user = json['user'];
    tollStationsCrossed = json['tollStationsCrossed'];
  }
}

class Car {
  String? sId;
  String? make;
  String? model;
  String? slug;

  Car({this.sId, this.make, this.model, this.slug});

  Car.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    make = json['make'];
    model = json['model'];
    slug = json['slug'];
  }
}

class Package {
  String? sId;
  String? packageType;

  Package({this.sId, this.packageType});

  Package.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    packageType = json['packageType'];
  }
}
