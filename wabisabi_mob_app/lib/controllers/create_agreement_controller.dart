import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAgreementController extends GetxController {
  //revenue share controller
  TextEditingController revenueShareTitleController = TextEditingController();
  TextEditingController revenueSharePaymentTrigger = TextEditingController();
  TextEditingController revenueSharePercentageController =
      TextEditingController(text: 10.toString());
  TextEditingController revenueShareNotesController = TextEditingController();

//Performance-Based controller
  TextEditingController performanceTitleController = TextEditingController();
  TextEditingController performanceDueDateController = TextEditingController();
  TextEditingController performanceCriteriaController = TextEditingController();
  TextEditingController performanceBonusAmountController =
      TextEditingController();
  TextEditingController performanceNotesController = TextEditingController();

  // Fields & their controllers
  RxList<String> fields = <String>[].obs;
  RxMap<int, TextEditingController> fieldControllers =
      <int, TextEditingController>{}.obs;
  // Milestones & their controllers
  RxList<int> milestones = <int>[].obs;
  RxMap<int, Map<String, TextEditingController>> milestoneControllers =
      <int, Map<String, TextEditingController>>{}.obs;

  RxInt extCount = 01.obs;
  RxBool isDialogOpen = false.obs;
  // Text Controllers for main fields
  TextEditingController agreementTypeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  //Add Fields
  void addField(String fieldName) {
    fields.add(fieldName);
    int index = fields.length - 1;
    fieldControllers[index] = TextEditingController();
  }

  // Add Milestone
  void addMilestone() {
    int index = milestones.length + 1;
    milestones.add(index);
    milestoneControllers[index] = {
      "title": TextEditingController(),
      "dueDate": TextEditingController(),
      "paymentAmount": TextEditingController(),
      "notes": TextEditingController(),
    };
  }

  void increment() {
    extCount++;
  }

  void decrement() {
    if (extCount > 1) {
      extCount--;
    }
  }

  void openDialog() {
    isDialogOpen.value = true;
  }

  void closeDialog() {
    isDialogOpen.value = false;
  }

  RxBool showFixedFields = true.obs;
  RxBool showVariableFields = false.obs;
  RxBool showRevenueShareFields = false.obs;
  RxBool showCommissionBaseFields = false.obs;
  RxBool showSubscriptionBasedFields = false.obs;
  RxBool showPerformanceBasedFields = false.obs;

  // Agreement Type
  RxString selectedAgreementType = ''.obs; // Default value
  List<String> agreementTypes = ['Fixed Price', 'Variable Price'];
  void setAgreementType(String newValue) {
    selectedAgreementType.value = newValue;
    if (newValue == 'Fixed Price') {
      showFixedFields.value = true;
      showVariableFields.value = false;
    } else {
      showFixedFields.value = false;
      showVariableFields.value = true;
    }
  }

  //Revenue Share
  RxString selectedComissiontType = ''.obs; // Default value
  List<String> commissionTypes = [
    'Revenue Share',
    'Commission-Based',
    'Subscription-Based',
    'Performance-Based'
  ];
  void setCommissionType(String newValue) {
    selectedComissiontType.value = newValue;
    if (newValue == 'Revenue Share') {
      showRevenueShareFields.value = true;
      showCommissionBaseFields.value = false;
      showPerformanceBasedFields.value = false;
      showSubscriptionBasedFields.value = false;
    } else if (newValue == 'Subscription-Based') {
      showSubscriptionBasedFields.value = true;
      showRevenueShareFields.value = false;
      showCommissionBaseFields.value = false;
      showPerformanceBasedFields.value = false;
    } else if (newValue == 'Performance-Based') {
      showPerformanceBasedFields.value = true;
      showRevenueShareFields.value = false;
      showSubscriptionBasedFields.value = false;
      showCommissionBaseFields.value = false;
    } else if (newValue == 'Commission-Based') {
      showCommissionBaseFields.value = true;
      showPerformanceBasedFields.value = false;
      showRevenueShareFields.value = false;
      showSubscriptionBasedFields.value = false;
    } else {
      showRevenueShareFields.value = false;
      showCommissionBaseFields.value = false;
      showPerformanceBasedFields.value = false;
      showSubscriptionBasedFields.value = false;
    }
  }

  // subscription due date
  RxString selectedDueDate = ''.obs; // Default value
  List<String> dueDates = [
    '1st of every month',
    '10th of every month',
  ];
  void setDueDate(String newValue) {
    selectedDueDate.value = newValue;
  }

  // performance due date
  RxString selectedPerformanceDueDate = ''.obs; // Default value
  List<String> performanceDueDates = [
    'Weekly',
    'Monthly',
    'Quarterly',
    'Yearly',
    'By Yearly',
  ];
  void setPerformanceDueDate(String newValue) {
    selectedPerformanceDueDate.value = newValue;
  }

  //biling cycle
  RxString selectedBillingCycle = ''.obs; // Default value
  List<String> billingCycle = [
    'Weekly',
    'Monthly',
    'Quarterly',
    'Yearly',
    'By Yearly',
  ];
  void setBillingCycle(String newValue) {
    selectedBillingCycle.value = newValue;
  }

  // SALE
  RxString selectedSaleType = ''.obs; // Default value
  List<String> saleTypes = ['Per Sale', 'Per Event', 'Per Transaction'];
  void setSaleType(String newValue) {
    selectedSaleType.value = newValue;
  }

  // duration
  RxString selectedDurationType = ''.obs; // Default value
  List<String> durationTypes = [
    'Every Week',
    'Every 5 Days',
    'Every 10 Days',
    'Every 20 Days',
    'Every Month'
  ];
  void setDurationType(String newValue) {
    selectedDurationType.value = newValue;
  }

  // payment trigger
  RxString selectedPaymentTrigger = ''.obs; // Default value
  List<String> paymentTrigger = [
    'Weekly',
    'Monthly',
    'Quarterly',
    'Yearly',
    'By Yearly',
  ];
  void setPaymentTrigger(String newValue) {
    selectedPaymentTrigger.value = newValue;
  }

  @override
  void onClose() {
    agreementTypeController.dispose();
    descriptionController.dispose();
    for (var controller in fieldControllers.values) {
      controller.dispose();
    }
    for (var controllers in milestoneControllers.values) {
      for (var controller in controllers.values) {
        controller.dispose();
      }
    }
    super.onClose();
  }
}
