import 'package:cells_and_cell/allpackages.dart';
import 'package:cells_and_cell/controller/qrgeneratecontroller.dart';
import 'package:cells_and_cell/controller/walletamountcontroller.dart';

class ViewQRCode extends GetView<WalletController> {
  ViewQRCode({Key? key}) : super(key: key);

  final controller = Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: buildBody());
  }

  buildAppBar() {
    return AppBar(
      title: const Text(
        'Read QR',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
      ),
      centerTitle: true,
      backgroundColor: const Color(0xff9c2d93),
    );
  }

  buildBody() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.black,
        ));
      } else if (controller.WalletInfo.length == 0) {
        return const Center(child: Text("No records found"));
      }
      return Center(
        child: buildQRImage(),
      );
    });
  }

  buildQRImage() {
    return SizedBox(
      width: 400,
      height: 400,
      child: QrImage(
        data: controller.WalletInfo[0].walletAmount.toString(),
        version: QrVersions.auto,
        size: 200.0,
      ),
    );
  }
}
