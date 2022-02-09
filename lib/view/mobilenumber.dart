import 'package:cells_and_cell/allpackages.dart';

class MobileNumber extends StatefulWidget {
  const MobileNumber({Key? key}) : super(key: key);

  @override
  _MobileNumberState createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9D6F4),
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildFABButton(),
    );
  }

   buildFABButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SelectContact()));
      },
      backgroundColor: const Color(0xff9c2d93),
      child: const Icon(
        Icons.add,
        size: 30,
      ),
    );
  }

  buildBody() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      child: buildTextField(),
    );
  }

  buildTextField() {
    return TextField(
      style: const TextStyle(color: Colors.black, fontSize: 20),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
          size: 30,
        ),
        fillColor: Colors.grey.shade100,
        filled: true,
        hintText: "Enter a Phone Number",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
        backgroundColor: const Color(0xff9c2d93),
        title: const Text(
          'Send Money',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
        ),
        centerTitle: true);
  }
}
