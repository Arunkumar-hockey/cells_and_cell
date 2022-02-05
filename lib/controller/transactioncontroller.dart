import 'package:cells_and_cell/allpackages.dart';
import 'package:cells_and_cell/model/transactions.dart';
import 'package:cells_and_cell/service/APIService.dart';

class TransactionsController extends GetxController {
  var TransactionsInfo = <Transactions>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() async {
    FetchTransactionInfo();
    super.onInit();
  }

  void FetchTransactionInfo() async {
    try {
      isLoading(true);
      var transactionsInfo = await APIService().fetchTransactions();
      if (transactionsInfo != null) {
        TransactionsInfo.assign(transactionsInfo);
      }
      return null;
    } finally {
      isLoading(false);
    }
  }

}
