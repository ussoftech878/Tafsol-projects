import 'package:get/get.dart';
import 'package:wabisabi_mob_app/controllers/chat_controller.dart';

class ChatBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
