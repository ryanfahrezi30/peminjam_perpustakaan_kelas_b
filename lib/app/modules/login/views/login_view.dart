import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body:Center(
          child: Form(
            key: controller.formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(hintText: "masukkan username"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "username tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(hintText: "masukkan password"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                Obx(() => controller.loading.value?
                CircularProgressIndicator():ElevatedButton(onPressed: (){
                  controller.login();
                },child: Text("Login"))
                ),
                ElevatedButton(onPressed: () => Get.toNamed(Routes.REGISTER),
                child: const Text("Register"))
              ],
            ),
          )
      ),
    );
  }
}