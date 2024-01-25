import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pinjam Buku ${Get.parameters['judul'].toString()}'),
          centerTitle: true,
        ),
        body: Center(
            child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Container(
                      child: Column(children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: Text(
                                  'Tanggal Pinjam',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xFF61677D),
                                    letterSpacing: -0.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: TextFormField(
                                  controller:
                                      controller.tanggalPinjamController,
                                  decoration: InputDecoration(
                                    hintText: 'Masukan Tanggal Pinjam',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Tanggal Pinjam tidak boleh kosong!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: Text(
                                  'Tanggal Kembali',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xFF61677D),
                                    letterSpacing: -0.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: TextFormField(
                                  controller:
                                      controller.tanggalKembaliController,
                                  decoration: InputDecoration(
                                    hintText: 'Masukan Tanggal Kembali',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Tanggal Kembali tidak boleh kosong!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          child: Column(
                            children: [
                              Obx(() => controller.loadingpinjam.value?
                              CircularProgressIndicator():
                              SizedBox(
                                width: double.infinity,
                                height: 50.0,
                                child: ElevatedButton(
                                  onPressed: (){
                                    controller.postPinjam();
                                  },
                                  child: Text(
                                    'Pinjam',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18.0
                                    ),
                                  ),

                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF080ba1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              )
                              )
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ],
                ))));
  }
}
