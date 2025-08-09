import 'package:get/get.dart';
import 'package:wajba_mobile_app/models/itemListModel.dart';
import 'package:wajba_mobile_app/models/itemListModel2.dart';

import '../constants/assets.dart';

class CartController extends GetxController {
  // final RxInt count = 0.obs;

  RxList<ItemModel> itemsList = [
    ItemModel(
        name: "Pastries Bag",
        image: imageAssets.pastry,
        price: 'BHD 1.99',
        discountedPrice: 'BHD 1.99',
        count: 0.obs),
    ItemModel(
        name: "Pastries Bag",
        image: imageAssets.pastry,
        price: 'BHD 1.99',
        discountedPrice: 'BHD 1.99',
        count: 0.obs),
  ].obs;
  RxList<ItemModel2> itemsList2 = [
    ItemModel2(
        name: "Pastries Bag",
        image: imageAssets.pastry,
        price: 'BHD 1.99',
        discountedPrice: 'BHD 1.99',
        count: 0.obs),
  ].obs;

  void increment({required int itemIndex}) {
    itemsList[itemIndex].count.value++;
  }

  void decrement({required int itemIndex}) {
    if (itemsList[itemIndex].count > 0) {
      itemsList[itemIndex].count--;
    }
  }

  void increment2({required int itemIndex}) {
    itemsList[itemIndex].count.value++;
  }

  void decrement2({required int itemIndex}) {
    if (itemsList[itemIndex].count > 0) {
      itemsList[itemIndex].count--;
    }
  }
}
