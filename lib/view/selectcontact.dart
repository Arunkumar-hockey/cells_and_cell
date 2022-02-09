import 'dart:ui';

import 'package:cells_and_cell/allpackages.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9D6F4),
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  Column buildBody() {
    return Column(
      children: [
        buildSearch(),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: ListView.builder(
              itemCount: 100,
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
  }

  Container buildSearch() {
    return Container(
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: TextField(
          style: const TextStyle(color: Colors.black, fontSize: 20),
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            fillColor: Colors.grey.shade100,
            filled: true,
            hintText: "Enter a Phone Number or Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),
      );
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: const Color(0xff9c2d93),
        title: const Text(
          'Select Contact',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
        ),
        centerTitle: true);
  }
}
