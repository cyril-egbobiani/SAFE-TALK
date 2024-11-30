import 'package:get/get.dart';
import 'package:safetalk/helpers/functions/navigation.dart';
import 'package:safetalk/helpers/services/storage_service.dart';

class WrapperController extends GetxController {
  final StorageService _storageService = StorageService();

  Future<bool> onWillPop() async {
    return false;
  }

  Future<void> checkExpectedPage() async {
    final isAuthenticated = await _storageService.getBoolean('isLoggedIn');

    if (!isAuthenticated) {
      _storageService.clearOldData();
      pushReplacement(page: '/Signup');
    } else {
      pushReplacement(page: '/BottomNavBar');
    }
  }

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 2000), checkExpectedPage);
    super.onReady();
  }

  @override
  void onClose() {
    Get.delete<WrapperController>();
    super.onClose();
  }
}
