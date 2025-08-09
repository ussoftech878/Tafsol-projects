import 'package:get/get.dart';
import 'package:wabisabi_mob_app/controllers/create_agreement_controller.dart';

class CreateAgreementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAgreementController>(() => CreateAgreementController());
  }
}
