import 'package:flexdrive/main.dart';
import 'package:flexdrive/services/api_base_helper.dart';
import 'package:flexdrive/utills/enums.dart';
import 'package:flexdrive/view_models/exception_handling.dart';
import 'package:flexdrive/view_models/home_veiw_model.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class MyBookingServices {
  final context = navigatorKey.currentContext!;
  ApiBaseHelper httpService = ApiBaseHelper();

  int limmit = 5;

  Future<Response?> getMyBookingApi() async {
    try {
      var bookingValue = context.read<HomeVeiwModel>().getMyBooking;
      if (!context.read<ExceptionHandling>().listOfAPi.contains(bookingValue)) {
        context.read<ExceptionHandling>().listOfAPi.add(bookingValue);
      }
      Response response = await httpService.httpRequest(
          endpoint: EndPoints.getMyBooking,
          requestType: "GET",
          params: "?page=${context.read<HomeVeiwModel>().page}&limit=$limmit");

      if (response.statusCode == 200) {
        context.read<ExceptionHandling>().listOfAPi.remove(bookingValue);
        return response;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<Response?> getBookingDetail(int bookingID) async {
    try {
      var myBookingDetail = context.read<HomeVeiwModel>().getBookDetail;
      if (!context
          .read<ExceptionHandling>()
          .listOfAPi
          .contains(myBookingDetail)) {
        context.read<ExceptionHandling>().listOfAPi.add(myBookingDetail);
      }
      Response response = await httpService.httpRequest(
          endpoint: EndPoints.getBookingDetail,
          requestType: "GET",
          params: "$bookingID",
          requestBody: {});
      if (response.statusCode == 200) {
        context.read<ExceptionHandling>().listOfAPi.remove(myBookingDetail);
        return response;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
