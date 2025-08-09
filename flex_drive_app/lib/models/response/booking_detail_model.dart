class BookingDetail {
  String? status;
  String? message;
  Data? data;

  BookingDetail({this.status, this.message, this.data});

  BookingDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  // int? totalAddonKilometers;
  // int? remainingAddonKilometers;
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

  Data(
      {
      // this.totalAddonKilometers,
      // this.remainingAddonKilometers,
      this.sId,
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

  Data.fromJson(Map<String, dynamic> json) {
    // totalAddonKilometers = json['totalAddonKilometers'];
    // remainingAddonKilometers = json['remainingAddonKilometers'];
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
  String? thumbnail;
  String? make;
  String? model;

  Car({this.sId, this.thumbnail, this.make, this.model});

  Car.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    thumbnail = json['thumbnail'];
    make = json['make'];
    model = json['model'];
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
