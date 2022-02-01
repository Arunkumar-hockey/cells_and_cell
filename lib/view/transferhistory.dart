import 'package:cells_and_cell/allpackages.dart';
import 'package:cells_and_cell/controller/transactioncontroller.dart';

class TransferHistory extends GetView<TransactionsController> {
  TransferHistory({Key? key}) : super(key: key);

  final controller = Get.put(TransactionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9D6F4),
      appBar: AppBar(
        title: const Text(
          'Transfer History',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff9c2d93),
      ),
      body: Obx(() {
        if(controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: Colors.black,));
        }
        return Container(
          margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: ListView.builder(
            itemCount: controller.TransactionsInfo[0].userDetails[0]
                .transactions[0].amount.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                        '${controller.TransactionsInfo[0].userDetails[0].transactions[0].amount}'),
                  ),
                  const Divider(),
                ],
              );
            },
          ),
        );
      })
    );
  }
}