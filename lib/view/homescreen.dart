import 'package:cells_and_cell/allpackages.dart';
import 'package:cells_and_cell/service/APIService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  final imagesList = [
    'assets/images/carousel1.jpeg',
    'assets/images/carousel2.jpg',
    'assets/images/carousel3.jpg',
  ];

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9D6F4),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xff9c2d93),
        title: const Text(
          'Cell\'s And Cell',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        leading: IconButton(
            //color: Colors.white,
            onPressed: () {
              Get.to(Profile());
            },
            icon: const Icon(
              Icons.account_circle_outlined,
              //color: Colors.white,
              size: 60,
            )),
        actions: [
          TextButton(
            onPressed: () {
              box.remove("token");
              APIService().SignOut();
              Get.offAll(LoginScreen());
            },
          child: Text("Log Out", style: TextStyle(fontSize: 20, color: Colors.white),),
          ),
          IconButton(
            onPressed: () {
              Get.to(Wallet());
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Wallet()));
            },
            icon: const Icon(Icons.account_balance_wallet),
            iconSize: 30,
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Transfer Money',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          ),
          Container(
            width: 500,
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff9c2d93),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Get.to(ScanQr());
                            },
                            icon: const Icon(Icons.qr_code_scanner_rounded),
                            iconSize: 70,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Scan QR',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff9c2d93),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Get.to(ViewQRCode());
                            },
                            icon: const Icon(Icons.qr_code_2_rounded),
                            iconSize: 70,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'View QR',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff9c2d93),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Get.to(MobileNumber());
                            },
                            icon: const Icon(Icons.account_circle_rounded),
                            iconSize: 70,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Mobile Number',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff9c2d93),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Get.to(TransferHistory());
                            },
                            icon: const Icon(Icons.account_balance_rounded),
                            iconSize: 70,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Transfer History',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          CarouselSlider.builder(
              itemCount: imagesList.length,
              itemBuilder: (context, index, realIndex) {
                final images = imagesList[index];
                return buildImage(images, index);
              },
              options: CarouselOptions(
                height: 250,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 2),
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
              )),
        ],
      ),
    );
  }

  Widget buildImage(String images, int index) => Container(
        color: Colors.grey,
        child: Image.asset(
          images,
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
      );
}
