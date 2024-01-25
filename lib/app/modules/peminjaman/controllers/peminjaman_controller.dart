import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/storage_provider.dart';

import '../../../data/constant/end point.dart';
import '../../../data/model/respone_pinjam.dart';
import '../../../data/provider/api_provider.dart';

class PeminjamanController extends GetxController with StateMixin<List<DataPinjam>>{

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.pinjam+ "/${StorageProvider.read(StorageKey.idUser)}");
      if (response.statusCode == 200) {
        final ResponePinjam responsePinjam = ResponePinjam.fromJson(
            response.data);
        if (responsePinjam.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responsePinjam.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal menambil data"));
      }

    } on DioException catch (e) {
      if (e.response != null){
        if (e.response?.data!= null){
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
