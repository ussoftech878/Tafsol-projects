import 'package:get/get.dart';

class ItemModel2 {
  String name;
  String image;
  String price;
  String discountedPrice;
  RxInt count;

  ItemModel2(
      {required this.name,
      required this.image,
      required this.price,
      required this.discountedPrice,
      required this.count});
}

// RxList<ItemModel2> itemsList2 = [
//   ItemModel2(
//       name: "Pastries Bag",
//       image: imageAssets.pastry,
//       price: 'BHD 1.99',
//       discountedPrice: 'BHD 1.99',
//       count: 0.obs),
// ].obs;
