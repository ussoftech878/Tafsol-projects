import 'package:get/get.dart';

class FinancialAndProffessionalInfoController extends GetxController {
  //dropdown
  var selectedValue = Rxn<String>();
  final List<String> items = [
    'Occupation / economic activity',
    'option 2',
    'option 3',
    'option 4'
  ];

  void updateSelectedValue(String? value) {
    selectedValue.value = value;
  }
}
