import 'package:cells_and_cell/allpackages.dart';
import 'package:cells_and_cell/controller/qrgeneratecontroller.dart';

class ViewQRCode extends GetView<QRGenerateController> {
  ViewQRCode({Key? key}) : super(key: key);

  final controller = Get.put(QRGenerateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: buildBody());
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
    return Center(
        child: buildQRImage(),
      );
  }

    buildQRImage() {
     return SizedBox(
        width: 400,
        height: 400,
        child: QrImage(
          data: "1234567890",
          version: QrVersions.auto,
          size: 200.0,
        ),
      );
   }
}
