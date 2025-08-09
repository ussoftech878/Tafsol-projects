import 'dart:convert';
import 'package:flexdrive/models/response/get_my_booking_model.dart';
import 'package:flexdrive/models/response/booking_detail_model.dart';
import 'package:flexdrive/services/api_base_helper.dart';
import 'package:flexdrive/services/booking_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeVeiwModel extends ChangeNotifier {
  GetMyBookingModel _getMyBookingResponse = GetMyBookingModel();
  ApiBaseHelper httpService = ApiBaseHelper();
  GetMyBookingModel get getMyBookingResponse => _getMyBookingResponse;
  List<MyBookingData> myBookingList = [];
  BookingDetail _bookingDetail = BookingDetail();
  BookingDetail get bookingDetailResponse => _bookingDetail;
  MyBookingServices bookingServices = MyBookingServices();
  ScrollController controller = ScrollController();
  bool get getIsloading => isLoading;
  bool get getIsloadingDetail => isLoadingDetail;
  bool isLoading = false;
  bool isLoadingDetail = false;
  bool hasMoreData = true;
  bool isPageLoading = false;
  int page = 1;

  // void setAuthResponse(GetMyBookingModel value) {
  //   _getMyBookingResponse = value;
  //   notifyListeners();
  // }
  HomeVeiwModel() {
    controller.addListener(scrollController);
  }

  scrollController() async {
    if (controller.position.pixels == controller.position.maxScrollExtent &&
        hasMoreData) {
      setIsPageLoading(true);
      page++;
      await getMyBooking(callFirstTime: false);
    }
  }

  void setHasMore(bool bool) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      hasMoreData = bool;
      notifyListeners();
    });
  }

  void setIsPageLoading(bool bool) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isPageLoading = bool;
      notifyListeners();
    });
  }

  void setIsloading(bool bool) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isLoading = bool;
      notifyListeners();
    });
  }

  void setIsLoadDetail(bool bool) {
    isLoadingDetail = bool;
    notifyListeners();
  }

  @override
  void dispose() {
    controller.removeListener(scrollController);
    controller.dispose();
    super.dispose();
  }

  Future<bool> getMyBooking({required bool callFirstTime}) async {
    if (callFirstTime) {
      page = 1;
      setIsloading(true);
      setHasMore(true);
      setIsPageLoading(false);
      myBookingList.clear();
    }
    Response? response = await bookingServices.getMyBookingApi();
    if (response!.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      _getMyBookingResponse = GetMyBookingModel.fromJson(parsed);
      if (_getMyBookingResponse.data!.isEmpty) {
        setHasMore(false);
        setIsPageLoading(false);
      } else {
        var data = _getMyBookingResponse.data;
        myBookingList.addAll(data!);
        setIsPageLoading(false);
      }
      setIsloading(false);
      return true;
    } else {
      setIsloading(false);
      return false;
    }
  }

  Future<bool> getBookDetail(int bookingID) async {
    setIsLoadDetail(true);

    Response? response = await bookingServices.getBookingDetail(bookingID);

    if (response!.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      _bookingDetail = BookingDetail.fromJson(parsed);
      setIsLoadDetail(false);
      return true;
    } else {
      setIsLoadDetail(false);
      return false;
    }
  }
}
