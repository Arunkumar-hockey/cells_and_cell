import 'dart:convert';
import 'package:cells_and_cell/allpackages.dart';
import 'package:cells_and_cell/constants/apiconstants.dart';
import 'package:cells_and_cell/model/profile_edit.dart';
import 'package:cells_and_cell/model/profileview.dart';
import 'package:cells_and_cell/model/qrgenerate.dart';
import 'package:cells_and_cell/model/transactions.dart';
import 'package:cells_and_cell/model/walletamount.dart';
import 'package:http/http.dart' as http;

class APIService {

  final box = GetStorage();


  Future getUserLogin(String email, String password) async {
    String completeUrl = APIConstants.BaseUrl + APIConstants.KLogin;
    var uri = Uri.parse(completeUrl);

    var response = await http.post(uri,
        headers: {"Accept": "Application/json"},
        body: {"email": email, "password": password});
    var convertedDataToJson = jsonDecode(response.body);
    print(convertedDataToJson);
    return convertedDataToJson;
  }

  Future<ProfileModel?> FetchProfile() async {
    String token = box.read("token");
    String completeUrl = APIConstants.BaseUrl + APIConstants.KProfile;
    var url = Uri.parse(completeUrl);

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      print('Token : $token');
      print("====Map====${response.body.toString()}");
      if (response.statusCode == 200) {
        ProfileModel profileModel =
            ProfileModel.fromJson(json.decode(response.body));
        return profileModel;
      } else {
        return null;
      }
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<ProfileEdit?> FetchProfileEdit() async {
    String token = box.read("token");
    String completeUrl = APIConstants.BaseUrl + APIConstants.KProfileEdit;
    var url = Uri.parse(completeUrl);

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      print("====Map====${response.body.toString()}");
      if (response.statusCode == 200) {
        var profileEdit = ProfileEdit.fromJson(json.decode(response.body));
        return profileEdit;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future ProfileUpdate(String name, String phoneNo) async {
    String token = box.read("token");
    String completeUrl = APIConstants.BaseUrl + APIConstants.KProfileUpdate;
    var url = Uri.parse(completeUrl);

    var response = await http.post(url,
        headers: {'Authorization': 'Bearer $token'},
        body: {"name": name, "phone": phoneNo});

    var convertedDataToJson = json.decode(response.body);
    print(convertedDataToJson);
    return convertedDataToJson;
  }

  Future<ViewQrCode?> FetchQRCode() async {
    String token = box.read("token");
    String completeUrl = APIConstants.BaseUrl + APIConstants.KQRGenerate;
    var url = Uri.parse(completeUrl);

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      print('Token : $token');
      print("====Map====${response.body.toString()}");
      if (response.statusCode == 200) {
        var viewQRCode = ViewQrCode.fromJson(json.decode(response.body));
        return viewQRCode;
      } else {
        return null;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> checkQRCode(String qrCode) async {
    String token = box.read("token");
    String completeUrl = APIConstants.BaseUrl + APIConstants.KQRCheck;
    var url = Uri.parse(completeUrl);

    try {
      final response = await http.post(url,
          headers: {'Authorization': 'Bearer $token'}, body: {"qr": qrCode});
      print("====Map====${response.body.toString()}");

      if (response.statusCode == 200) {
      } else {
        return;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Transactions?> fetchTransactions() async {
    String token = box.read("token");
    String completeUrl = APIConstants.BaseUrl + APIConstants.KTransactions;
    var url = Uri.parse(completeUrl);

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      print('Token : $token');
      print("====Map====${response.body.toString()}");
      if (response.statusCode == 200) {
        var transactionDetails =
            Transactions.fromJson(json.decode(response.body));
        return transactionDetails;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  Future<WalletAmount?> fetchWalletAmount() async {
    String token = box.read("token");
    String completeUrl = APIConstants.BaseUrl + APIConstants.KWalletAmount;
    var url = Uri.parse(completeUrl);

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      print('Token : $token');
      print("====Map====${response.body.toString()}");
      if (response.statusCode == 200) {
        var walletAmount = WalletAmount.fromJson(json.decode(response.body));
        return walletAmount;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  Future SignOut() async {
    String token = box.read("token");
    String completeUrl = APIConstants.BaseUrl + APIConstants.KSignOut;
    var url = Uri.parse(completeUrl);

    try {
      var response = await http.post(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        var convertedDataToJson = json.decode(response.body);
        return convertedDataToJson;
      }
      return null;
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

}
