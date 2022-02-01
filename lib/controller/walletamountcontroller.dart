import 'package:cells_and_cell/allpackages.dart';
import 'package:cells_and_cell/model/walletamount.dart';
import 'package:cells_and_cell/service/APIService.dart';

class WalletController extends GetxController {
  var WalletInfo = <WalletAmount>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() async{
    FetchProfileInfo();
    super.onInit();
  }

  void FetchProfileInfo() async{
    var walletInfo = await APIService().fetchWalletAmount();
    if(walletInfo != null) {
      WalletInfo.assign(walletInfo);
    }
    else{
      return null;
    }
  }

}