import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Task 1: Call the function to navigate to the "Buku" page
                controller.buku();
              },
              child: Text("Buku"),
            ),
            ElevatedButton(
              onPressed: () {
                // Task 2: Call the function to navigate to the "Peminjaman" page
                controller.peminjaman();
              },
              child: Text("Peminjaman"),
            ),
          ],
        ),
      ),
    );
  }
}
