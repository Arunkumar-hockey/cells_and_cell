import 'package:cells_and_cell/allpackages.dart';
import 'package:cells_and_cell/controller/walletamountcontroller.dart';

class Wallet extends GetView<WalletController> {
  Wallet({Key? key}) : super(key: key);

  final controller = Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffE9D6F4),
        appBar: AppBar(
          title: const Text(
            'Wallet',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff9c2d93),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Total Wallet Amount',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
              Text(
                //'Rs 100',
                'Rs ${controller.WalletInfo[0].walletAmount}',
                style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            title: Text('Item $index'),
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          );
        }));
  }
}
