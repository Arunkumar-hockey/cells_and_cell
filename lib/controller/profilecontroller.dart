import 'package:cells_and_cell/allpackages.dart';
import 'package:cells_and_cell/model/profileview.dart';
import 'package:cells_and_cell/service/APIService.dart';


class ProfileController extends GetxController {
  var ProfileInfo = <ProfileModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() async{
    FetchProfileInfo();
    super.onInit();
  }

  void FetchProfileInfo() async{
    var profileInfo = await APIService().FetchProfile();
    if(profileInfo != null) {
      ProfileInfo.assign(profileInfo);
    }
    else{
      return null;
    }
  }

}