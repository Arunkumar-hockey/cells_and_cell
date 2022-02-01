import 'dart:convert';

import 'package:cells_and_cell/allpackages.dart';
import 'package:cells_and_cell/model/qrgenerate.dart';
import 'package:cells_and_cell/service/APIService.dart';

class QRGenerateController extends GetxController {
  final box = GetStorage();
  var QRInfo = <ViewQrCode>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchQRInfo();
    super.onInit();
  }

  void fetchQRInfo() async{
    try {
      isLoading(true);
      var qrInfo = await APIService().FetchQRCode();
      if (qrInfo != null) {
        QRInfo.assign(qrInfo);
      }
    } finally {
      isLoading(false);
    }
  }


}