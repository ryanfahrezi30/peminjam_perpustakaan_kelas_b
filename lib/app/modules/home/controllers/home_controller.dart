import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  // Task 1: Add a function to navigate to the "Buku" page
  void goToBukuPage() {
    Get.toNamed('/buku');
  }

  // Task 2: Add a function to navigate to the "Peminjaman" page
  void goToPeminjamanPage() {
    Get.toNamed('/peminjaman');
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void buku(){
    Get.toNamed(Routes.BOOK);
  }
  void peminjaman(){
    Get.toNamed(Routes.PEMINJAMAN);
  }
}
