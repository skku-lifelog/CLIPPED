import 'dart:ffi';

import 'package:flutter/material.dart';

final pageWidth =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
final pageHeight =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;

class OutlineText extends StatelessWidget {
  final Text child;
  final double strokeWidth;
  final Color? strokeColor;
  final TextOverflow? overflow;

  const OutlineText(
    this.child, {
    super.key,
    // 기본 테두리 두께 설정
    this.strokeWidth = 2,
    this.strokeColor,
    this.overflow,
  });

  // 선택사항: 전역 플래그 적용
  // 예) 상태관리 값에 따라 애플리케이션 전반에 걸쳐 처리 가능
  // final backgroundProvider = ref.watch(backgroundSelectProvider);
  // if (backgroundProvider.imagePath.isEmpty) {
  //   return child;
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 테두리 효과
        Text(
          // 디바이스의 글자 스케일 등을 처리할 때 이용
          textScaleFactor: child.textScaleFactor,
          child.data!,
          style: TextStyle(
            fontSize: child.style?.fontSize,
            fontWeight: child.style?.fontWeight,
            foreground: Paint()
              ..color = strokeColor ?? Theme.of(context).shadowColor
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth,
          ),
          // 텍스트의 오버플로우 처리가 있을 경우 동시에 적용
          overflow: overflow,
        ),
        // 원본 텍스트
        child
      ],
    );
  }
}

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
          child: my_page(),
        ),
      ),
    );
  }
}

class my_page extends StatefulWidget {
  @override
  _myPageState createState() => _myPageState();
}

class _myPageState extends State<my_page> {
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
                  //'https://dthezntil550i.cloudfront.net/z7/latest/z71605062138483150000789979/1280_960/316b390d-7a9f-481e-8965-3ad3b74cec53.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter, // 아랫쪽으로 맞춤
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  isExpanded
                      ? Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0X40515050),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0X40515050),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.settings,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0X40515050),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: PopupMenuButton<int>(
                                          color: Color(0XCC515050),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.0),
                                            ),
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.all(10.0),
                                            child: Icon(
                                              Icons.more_vert,
                                              color: Colors.white,
                                            ),
                                          ),
                                          itemBuilder: (BuildContext context) =>
                                              [
                                            PopupMenuItem(
                                              height: pageHeight / 40,
                                              value: 1,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0X40515050),
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.share,
                                                      color: Colors.white,
                                                      size: 12.0,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      '프로필 공유',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              height: pageHeight / 40,
                                              value: 2,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.warning,
                                                      color: Colors.white,
                                                      size: 12.0,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      '신고',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              height: pageHeight / 40,
                                              value: 3,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.block,
                                                      size: 12.0,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      '차단',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                          onSelected: (int v) {
                                            // 선택된 항목에 대한 동작 수행
                                            // 여기에 원하는 동작을 추가하세요.
                                          },
                                          offset: Offset(0, 40),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  Container(
                    padding: EdgeInsets.only(
                      left: pageHeight / 30,
                      right: pageHeight / 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isExpanded
                            ? Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0X40515050),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        '고윤진',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0X40515050),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        '@goyoonjin',
                                        style:
                                            TextStyle(color: Color(0XffA8A7A7)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0X40515050),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        '(소속) ・(직업)',
                                        style: TextStyle(
                                            color: Color(0XffA8A7A7),
                                            fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0X40515050),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        'Que sera sera',
                                        style: TextStyle(
                                            color: Color(0XffA8A7A7),
                                            fontSize: 12),
                                      ),
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
                                            color: Color(0X40515050),
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
                                            color: Color(0X40515050),
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
                                            color: Color(0X40515050),
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
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0X40515050),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        '고윤진',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0X40515050),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        '@goyoonjin',
                                        style:
                                            TextStyle(color: Color(0XffA8A7A7)),
                                      ),
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
                                            color: Color(0X40515050),
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
                                            onPressed: () {}, // 페이퍼 이동
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
                                            color: Color(0X40515050),
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          child: TextButton(
                                            onPressed: () {}, // 팔로잉 페이지 이동
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
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0X40515050),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: IconButton(
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
        alignment: Alignment.topCenter,
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 1, // 페이지 수
            itemBuilder: (context, index) {
              return buildPage(index, context);
            },
          ),
          Container(
            height: pageHeight * 1 / 23,
            width: pageWidth * 19 / 20,
            decoration: BoxDecoration(
              color: Color(0xB0515050),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              children: [
                Container(
                  width: pageWidth * 16.6 / 20,
                  child: ListView.builder(
                    padding: EdgeInsets.all(7),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10, // 페이지 수
                    itemBuilder: (context, index) {
                      return buildTag(index, context);
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 19,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage(int pageIndex, BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double leafHeight = screenHeight / 6;

    // 여기서 백엔드에서 개수(n)를 받아야 됨

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: leafHeight * 5.5 +
                  screenHeight * 1 / 23, // n + 1 / 2 * (박스 하나 높이)로 해야 됨.
              child: buildLeftElements(screenWidth, leafHeight),
            ),
          ),
          Container(
            height: leafHeight * 5.5 + screenHeight * 1 / 23,
            width: 1.5, // 가운데 줄의 너비
            color: Color(0xff515050),
          ),
          Expanded(
            child: Container(
              height: leafHeight * 5.5 +
                  screenHeight * 1 / 23, // n + 1 / 2 * (박스 하나 높이)로 해야 됨.
              child: buildRightElements(screenWidth, leafHeight),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLeftElements(double screenWidth, double leafHeight) {
    List<Widget> elements = [];

    elements.add(
      Container(
        height: leafHeight * 6 / 23,
      ),
    );

    // 반복문을 사용하여 요소 생성 및 추가
    for (int i = 0; i < 5; i++) {
      elements.add(
        Container(
          height: leafHeight,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildleaves(screenWidth, leafHeight),
                Container(
                  height: 1.0,
                  width: 20.0,
                  color: Color(0xff515050),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: elements,
    );
  }

  Widget buildRightElements(double screenWidth, double leafHeight) {
    List<Widget> elements = [];
    elements.add(
      Container(
        height: leafHeight / 2 + leafHeight * 6 / 23,
      ),
    );

    // 반복문을 사용하여 요소 생성 및 추가
    for (int i = 0; i < 5; i++) {
      elements.add(
        Container(
          height: leafHeight,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 1.0,
                  width: 20.0,
                  color: Color(0xff515050),
                ),
                buildleaves(screenWidth, leafHeight),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: elements,
    );
  }

  Widget buildleaves(double screenWidth, double leafHeight) {
    return GestureDetector(
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
          backgroundColor: Colors.white.withOpacity(0.0),
          child: Container(
            height: leafHeight * 6 * 6 / 8,
            decoration: BoxDecoration(
              color: Color(0xff515050),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.close_fullscreen,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        SizedBox(
                          width: 20,
                        ),
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
                    height: leafHeight * 6 * 4.4 / 8,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: leafHeight * 6 * 1.8 / 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '창업 프로젝트',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                '2023.10.1~2023.12.10',
                                style: TextStyle(
                                  color: Color(0xFFA8A7A7),
                                  fontSize: 10.0,
                                ),
                              ),
                              Text(
                                '창업 동아리에서 진행한 프로젝트에 참여했습니다. 동문 서비스를 주제로 모바일 앱을 개발했습니다. 프론트엔드 개발자로 참여했습니다. 플러터를 사용해서 구현 했습니다. ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: leafHeight * 6 * 1.8 / 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '관련 페이퍼 (4)',
                                style: TextStyle(
                                  color: Color(0xFFA8A7A7),
                                  fontSize: 10.0,
                                ),
                              ),
                              Container(
                                height: leafHeight * 2.6 / 8,
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Color(0x4D000000),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '기획 단계에서 해야 될 일',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.north_east,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: leafHeight * 2.6 / 8,
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Color(0x4D000000),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '기획 단계에서 해야 될 일',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.north_east,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: leafHeight * 2.6 / 8,
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Color(0x4D000000),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '기획 단계에서 해야 될 일',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.north_east,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: leafHeight * 6 * 0.6 / 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '관련 링크 (2)',
                                style: TextStyle(
                                  color: Color(0xFFA8A7A7),
                                  fontSize: 10.0,
                                ),
                              ),
                              Container(
                                height: leafHeight * 2.6 / 8,
                                child: Row(
                                  children: [
                                    Container(
                                      height: leafHeight * 2.6 / 8,
                                      width: leafHeight * 2.6 / 8,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              'https://cdn-icons-png.flaticon.com/512/25/25231.png'),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Container(
                                      height: leafHeight * 2.6 / 8,
                                      width: leafHeight * 2.6 / 8,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              'https://upload.wikimedia.org/wikipedia/commons/4/45/Notion_app_logo.png'),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Container(
                      alignment: Alignment.center,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Color(0XCCAEAEAE),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            20.0,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25.0,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                size: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            '112',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      child: Container(
        width: screenWidth / 2.4,
        height: leafHeight * 11 / 15,
        decoration: BoxDecoration(
          color: Color(0xff515050),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: buildLeaf(),
      ),
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
                child: buildMore(),
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

  Widget buildMore() {
    return PopupMenuButton<int>(
      color: Color(0XCC515050),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Icon(
          Icons.more_vert,
          size: 15.0,
          color: Colors.white,
        ),
      ),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          height: pageHeight / 40,
          value: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0X40515050),
              border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 12.0,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '수정',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ),
        PopupMenuItem(
          height: pageHeight / 40,
          value: 2,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 12.0,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '삭제',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ),
        PopupMenuItem(
          height: pageHeight / 40,
          value: 3,
          child: Container(
            child: Row(
              children: [
                Icon(
                  Icons.share,
                  size: 12.0,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '공유',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
      onSelected: (int v) {
        // 선택된 항목에 대한 동작 수행
        // 여기에 원하는 동작을 추가하세요.
      },
      offset: Offset(0, 30),
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
