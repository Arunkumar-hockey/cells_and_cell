import 'package:cells_and_cell/allpackages.dart';
import 'package:cells_and_cell/model/profile_edit.dart';
import 'package:cells_and_cell/service/APIService.dart';

class ProfileEditController extends GetxController {
  var ProfileEditInfo = <ProfileEdit>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    FetchProfileEditInfo();
    super.onInit();
  }

  void FetchProfileEditInfo () async{
    try {
      isLoading(true);
      var profileEditInfo = await APIService().FetchProfileEdit();
      if (profileEditInfo != null) {
        ProfileEditInfo.assign(profileEditInfo);
      }
      return null;
    } finally {
      isLoading(false);
    }
  }
}