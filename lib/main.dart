import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//getting images in assets folder
List<String> img = [
  for (int i = 1; i <= 40; i++) 'assets/img/$i.jpg',
];

Color white = Colors.white;
Color blue = Colors.blue;

String select = '1';

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 55, 16, 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appbar(),
                  tabbar(),
                ],
              ),
            ),
          ),
          grid(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.green,
                  size: 30,
                ),
                Icon(
                  Icons.photo_outlined,
                  color: Colors.pink,
                  size: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: blue,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Icon(
                  CupertinoIcons.compass,
                  color: Colors.amber,
                  size: 30,
                ),
                Icon(
                  Icons.note_outlined,
                  color: Colors.purple,
                  size: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row tabbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              select = '1';
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: select == '1' ? white : blue,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Icon(
                  Icons.photo_outlined,
                  color: select == '1' ? blue : white,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              select = '2';
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: select == '2' ? white : blue,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Icon(
                  CupertinoIcons.compass,
                  color: select == '2' ? blue : white,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              select = '3';
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: select == '3' ? white : blue,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Icon(
                  Icons.note_outlined,
                  color: select == '3' ? blue : white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class appbar extends StatelessWidget {
  const appbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.settings_outlined,
          color: Colors.white,
        ),
        Text(
          "Photos",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Icon(
          Icons.search,
          color: Colors.white,
        ),
      ],
    );
  }
}

class grid extends StatelessWidget {
  const grid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: List<Widget>.generate(
                  img.length,
                  (index) => Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: Image.asset(
                            img[index],
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        child: Center(
                          child: Text(
                            'Flower ${index + 1}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
