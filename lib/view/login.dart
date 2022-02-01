import 'package:cells_and_cell/allpackages.dart';
import 'package:cells_and_cell/service/APIService.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final username = TextEditingController();
  final password = TextEditingController();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 90),
                width: 150,
                height: 150,
                decoration: const BoxDecoration(shape: BoxShape.circle),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 35, top: 350),
              child: const Text(
                'Sign in',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: username,
                            onSaved: (value) {},
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Enter User Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: password,
                            onSaved: (value) {},
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Enter your PIN",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff9c2d93)),
                              onPressed: () async{
                                var data = await APIService().getUserLogin(username.text, password.text);
                                if(data["status"] == 1) {
                                  box.write("token", data["token"]);
                                  // print("true...");
                                  // print(data["token"]);
                                  Get.to(HomeScreen());
                                } else {
                                 // print("false...");
                                }
                              },
                              child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  child: const Center(
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 25,
                                      ),
                                    ),
                                  ))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
