import 'package:get/get.dart';

class ChatController extends GetxController{

  RxBool isChecked = false.obs;

  void toggleCheckbox(){
    isChecked.value = !isChecked.value;
  } 
}