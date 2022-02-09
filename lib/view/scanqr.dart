import 'dart:io';
import 'package:cells_and_cell/allpackages.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({Key? key}) : super(key: key);

  @override
  _ScanQrState createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  buildBody() {
    return Stack(
      alignment: Alignment.center,
      children: [
        buildQRScan(),
        Positioned(
            bottom: 20,
            child: Text(
              barcode != null ? 'Result : ${barcode?.code}' : 'Scan a code',
              style: const TextStyle(fontSize: 25, color: Colors.white),
              maxLines: 3,
            ))
      ],
    );
  }

   buildAppBar() {
    return AppBar(
      title: Text("Scan"),
      centerTitle: true,
      backgroundColor: const Color(0xff9c2d93),
    );
  }

  buildQRScan() {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderWidth: 10,
          borderRadius: 10,
          borderColor: const Color(0xff9c2d93),
          cutOutSize: MediaQuery.of(context).size.width * 0.8),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
      controller.scannedDataStream.listen((barcode) {
        setState(() {
          this.barcode = barcode;
        });
      });
    });
  }
}
