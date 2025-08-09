import 'package:get/get.dart';

class ItemModel {
  String name;
  String image;
  String price;
  String discountedPrice;
  RxInt count;

  ItemModel(
      {required this.name,
      required this.image,
      required this.price,
      required this.discountedPrice,
      required this.count});
}

// final List<ItemModel> cartItems = [
//   ItemModel(
//       name: "Pastries Bag",
//       image: imageAssets.pastry,
//       price: 'BHD 1.99',
//       discountedPrice: 'BHD 1.99',
//       count: 0.obs),
// ];
// final List<ItemModel> cartItems2 = [
//   ItemModel(
//       name: "Pastries Bag",
//       image: imageAssets.pastry,
//       price: 'BHD 1.99',
//       discountedPrice: 'BHD 1.99',
//       count: 0.obs),
// ];
