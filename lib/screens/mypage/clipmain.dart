import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TreeWidget(title: 'Flutter Demo tree Page'),
    );
  }
}

class TreeWidget extends StatefulWidget {
  const TreeWidget({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<TreeWidget> createState() => _TreeWidgetState();
}

class _TreeWidgetState extends State<TreeWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
        title: Text(
          '플립 라인(10)',
          style: TextStyle(fontSize: 15, color: Color(0xB0515050)),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 1, // 페이지 수
            itemBuilder: (context, index) {
              return buildPage(index, context);
            },
          ),
          Positioned(
            top: 30.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                color: Color(0xB0515050),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ListView.builder(
                padding: EdgeInsets.all(7),
                scrollDirection: Axis.horizontal,
                itemCount: 10, // 페이지 수
                itemBuilder: (context, index) {
                  return buildTag(index, context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage(int pageIndex, BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 150.0 * 5,
              child: buildLeftElements(screenWidth),
            ),
          ),
          Container(
            height: screenHeight - 50,
            width: 1.5, // 줄의 너비
            color: Color(0xff515050),
          ),
          Expanded(
            child: Container(
              height: 150.0 * 6,
              child: buildRightElements(screenWidth),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLeftElements(double screenWidth) {
    List<Widget> elements = [];

    // 반복문을 사용하여 요소 생성 및 추가
    for (int i = 0; i < 5; i++) {
      elements.add(
        Expanded(
          child: Container(
            height: 150.0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: screenWidth / 2.4,
                    height: 110.0,
                    decoration: BoxDecoration(
                      color: Color(0xff515050),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: buildLeaf(),
                  ),
                  Container(
                    height: 1.0,
                    width: 20.0,
                    color: Color(0xff515050),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: elements,
    );
  }

  Widget buildRightElements(double screenWidth) {
    List<Widget> elements = [];
    elements.add(
      Expanded(
        child: Container(
          height: 150.0,
          child: Center(
              child: Container(
            height: 75.0,
          )),
        ),
      ),
    );

    // 반복문을 사용하여 요소 생성 및 추가
    for (int i = 0; i < 5; i++) {
      elements.add(
        Expanded(
          child: Container(
            height: 150.0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 1.0,
                    width: 20.0,
                    color: Color(0xff515050),
                  ),
                  Container(
                    width: screenWidth / 2.4,
                    height: 110.0,
                    decoration: BoxDecoration(
                      color: Color(0xff515050),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: buildLeaf(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: elements,
    );
  }

  Widget buildTag(int pageIndex, BuildContext context) {
    return Row(
      children: [
        Container(
          width: 6.0,
        ),
        Container(
          width: 50.0,
          height: 20.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 0.5, // 테두리 두께
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Color.fromARGB(255, 170, 77, 77),
                ),
              ),
              Container(
                width: 7.0,
              ),
              Text(
                '학업',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 6.0,
        ),
      ],
    );
  }

  Widget buildTag2(int pageIndex, BuildContext context) {
    return Row(
      children: [
        Container(
          width: 37.0,
          height: 20.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Color.fromARGB(255, 170, 77, 77),
                ),
              ),
              Container(
                width: 2.0,
              ),
              Text(
                '학업',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildLeaf() {
    return Column(
      children: [
        Container(
          height: 6,
        ),
        Row(
          children: [
            Container(
              width: 10,
            ),
            Container(
              height: 15,
              width: 125,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3, // 페이지 수
                itemBuilder: (context, index) {
                  return buildTag2(index, context);
                },
              ),
            ),
            Container(
              child: SizedBox(
                width: 30,
                height: 30,
                child: IconButton(
                  onPressed: () {},
                  iconSize: 15,
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Container(
              width: 10,
            ),
            Container(
              height: 40,
              width: 110,
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                  ),
                  Text(
                    '성균관대 입학',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '2022.03.01 ~ 진행중',
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                  width: 40,
                  child: IconButton(
                    onPressed: () {},
                    iconSize: 12,
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  '248',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class tree_leaf {
  String title;
  String date;
  List<List<String>> tag;
  int likeNum;
  String content;
  List<List<String>> connectContent;
  String link;

// constructor 생성 : class 가 처음 선언이 되었을때 원하는 변수를 class 안에 집어 넣을 수 있는 기능
  tree_leaf(
    String title,
    String date,
    List<List<String>> tag,
    int likeNum,
    String content,
    List<List<String>> connectContent,
    String link,
  )   : this.title = title,
        this.date = date,
        this.tag = tag,
        this.likeNum = likeNum,
        this.content = content,
        this.connectContent = connectContent,
        this.link = link;
}
