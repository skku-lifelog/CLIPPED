import 'dart:ffi';

import 'package:flutter/material.dart';

final pageWidth =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
final pageHeight =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;

class MypageData {
  String name;
  String id;
  String affiliation;
  String job;
  String introduce;
  List<String>? tag;
  int numLog;
  int numPage;
  int numFollow;

  MypageData({
    required this.name,
    required this.id,
    this.affiliation = '',
    this.job = '',
    this.introduce = '',
    this.tag,
    required this.numLog,
    required this.numPage,
    required this.numFollow,
  });
}

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyFollowList(),
        ),
      ),
    );
  }
}

class MyFollowList extends StatefulWidget {
  @override
  _MyFollowListState createState() => _MyFollowListState();
}

class _MyFollowListState extends State<MyFollowList> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    double pageTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: isExpanded
                ? null
                : () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
            // 확장 패널
            child: AnimatedContainer(
              width: pageWidth,
              duration: Duration(milliseconds: 70),
              height: isExpanded ? pageHeight / 3 : pageHeight / 10,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://w0.peakpx.com/wallpaper/609/647/HD-wallpaper-penguin-moon-night-penguin-artist-artwork-digital-art.jpg'), // 이미지 경로 설정
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter, // 아랫쪽으로 맞춤
                ),
              ),
              padding: EdgeInsets.only(
                left: pageHeight / 30,
                right: pageHeight / 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isExpanded
                          ? Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '고윤진',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '@goyoonjin',
                                    style: TextStyle(color: Color(0XffA8A7A7)),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    '(소속) ・(직업)',
                                    style: TextStyle(
                                        color: Color(0XffA8A7A7), fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    'Que sera sera',
                                    style: TextStyle(
                                        color: Color(0XffA8A7A7), fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 60.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 1.0, // 테두리 두께
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: Text(
                                          '#직장인',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 60.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 1.0, // 테두리 두께
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: Text(
                                          '#디자인',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 40,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 1.0, // 테두리 두께
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: Text(
                                          '#UX',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          : Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '고윤진',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '@goyoonjin',
                                    style: TextStyle(color: Color(0XffA8A7A7)),
                                  ),
                                ],
                              ),
                            ),
                      isExpanded
                          ? Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.all(0.0),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            '93 페이퍼',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        child: TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.all(0.0),
                                          ),
                                          child: Text(
                                            '1225 팔로잉',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff515050),
                                        padding: EdgeInsets.only(
                                          top: 15,
                                          bottom: 15,
                                          left: 30,
                                          right: 30,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.edit,
                                            size: 20,
                                          ),
                                          SizedBox(width: 7.0),
                                          Text('프로필 편집'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '라이프 로그(12)',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    icon: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TreeWidget(title: '플립 라인(10)'),
          ),
        ],
      ),
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
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 50,
        title: Text(
          '라이프 로그(10)',
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
            top: 0.0,
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
