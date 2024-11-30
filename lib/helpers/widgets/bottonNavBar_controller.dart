import 'package:get/get.dart';

class BottomNavController extends GetxController {
  // Reactive selected index
  var selectedIndex = 0.obs;

  // Method to update index
  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}
