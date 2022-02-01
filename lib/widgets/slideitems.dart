import 'package:cells_and_cell/allpackages.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                slideList[index].imageUrl,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
          child: Text(
            slideList[index].title,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
          child: Text(
            slideList[index].description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 35,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
