import 'package:flutter/material.dart';
import 'package:lifelog/screens/home.dart';

///home.dart';
import 'package:lifelog/widgets/clip/tagbubble.dart';

void main() => runApp(const ClipEdit());
/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}*/

//void main() => runApp(const HomePage());

class ClipEdit extends StatefulWidget {
  const ClipEdit({Key? key}) : super(key: key);

  @override
  State<ClipEdit> createState() => _ClipEditState();
}

class _ClipEditState extends State<ClipEdit> {
  final TextEditingController _tc = TextEditingController();
  final TextEditingController _ec = TextEditingController();
  int num = 0;
  int exnum = 0;
  List<Map<Color, String>> tags = [
    {const Color.fromRGBO(242, 198, 251, 1.0): "학업"},
    {const Color.fromRGBO(228, 123, 248, 1.0): "일상"},
    {const Color.fromRGBO(204, 253, 250, 1.0): "뉴비"},
    {const Color.fromRGBO(138, 252, 244, 1.0): "전공"},
    {Colors.black: "새 태그 추가"}
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 0),
          child: Column(
            children: [
              Transform.translate(
                  offset: const Offset(-160, 0),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.arrow_back))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250,
                    child: TextField(
                      onChanged: (keyword) {
                        setState(() {
                          num = keyword.length;
                        });
                      },
                      keyboardType: TextInputType.text,
                      controller: _tc,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "제목을 입력해주세요",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Text("($num/20)"),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Text(
                    "태그",
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 7.0,
                    runSpacing: 5.0,
                    children: tags.where((tagMap) {
                      String keyword = tagMap.values.first;
                      return keyword != "새 태그 추가";
                    }).map((tagMap) {
                      Color color = tagMap.keys.first;
                      String keyword = tagMap.values.first;
                      return TagBubble(
                        keyword: keyword,
                        type: color == Colors.black ? 1 : 0,
                        color: color,
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     // builder: (context) => const ColorSheetScreen(), HomePage
                          //     builder: (context) => const HomePage(),
                          //   ),
                          // );
                        },
                      );
                    }).toList(),
                  ),
                  BottomSheetExample(nTags: tags)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "기간",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "시작  |  ",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text("2023.8.2"),
                  Text("  -  ",
                      style: TextStyle(
                        color: Colors.grey,
                      )),
                  Text(
                    "종료  |  ",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text("2023.10.16"),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  Text(
                    "요약",
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 290,
                    height: 150,
                    child: TextField(
                      onChanged: (keyword) {
                        setState(() {
                          exnum = keyword.length;
                        });
                      },
                      keyboardType: TextInputType.text,
                      controller: _ec,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "클립에 대한 간략한 설명을 작성해주세요",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("($exnum/100)"),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  Text("관련 페이퍼"),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const RelatedPaper(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  Text("페이퍼 추가"),
                ],
              ),
              const Row(
                children: [
                  Text("링크 삽입"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(120, 50),
                      backgroundColor: const Color.fromRGBO(168, 167, 167, 1),
                    ),
                    child: const Text(
                      '임시저장',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(120, 50),
                        backgroundColor: const Color.fromRGBO(81, 80, 80, 1),
                      ),
                      child: const Text(
                        '발행하기',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RelatedPaper extends StatelessWidget {
  const RelatedPaper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        width: 270,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 199, 199, 199),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Transform.translate(
              offset: const Offset(20, 0),
              child: const Text(
                "기획 단계에서 해야할 일...",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.clear,
                size: 15,
              ),
            )
          ],
        ));
  }
}

class BottomSheetExample extends StatefulWidget {
  List<Map<Color, String>> nTags;
  BottomSheetExample({required this.nTags, Key? key}) : super(key: key);

  @override
  State<BottomSheetExample> createState() =>
      _BottomSheetExampleState(nTags: nTags);
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  bool editing = false;
  List<Map<Color, String>> nTags;

  _BottomSheetExampleState({required this.nTags});
  final TextEditingController tc = TextEditingController();
  List<Color> colors = [
    const Color.fromRGBO(214, 254, 218, 1.0),
    const Color.fromRGBO(204, 253, 250, 1.0),
    const Color.fromRGBO(225, 213, 252, 1.0),
    const Color.fromRGBO(214, 217, 252, 1.0),
    const Color.fromRGBO(242, 198, 251, 1.0),
    const Color.fromRGBO(162, 252, 166, 1.0),
    const Color.fromRGBO(138, 252, 244, 1.0),
    const Color.fromRGBO(186, 155, 248, 1.0),
    const Color.fromRGBO(124, 154, 248, 1.0),
    const Color.fromRGBO(228, 123, 248, 1.0),
    const Color.fromRGBO(148, 194, 151, 1.0),
    const Color.fromRGBO(129, 198, 194, 1.0),
    const Color.fromRGBO(134, 107, 187, 1.0),
    const Color.fromRGBO(89, 114, 192, 1.0),
    const Color.fromRGBO(179, 121, 192, 1.0),
  ];

  void _onTagBubblePressed(int type, Color color) {
    setState(() {
      editing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.edit,
        size: 15,
      ),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 250,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      "태그 수정",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                      ),
                      child: SizedBox(
                          height: 80,
                          width: 180,
                          child: editing
                              ? Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          "태그명",
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 70,
                                          height: 25,
                                          child: TextField(
                                            keyboardType: TextInputType.text,
                                            controller: tc,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "태그색",
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 70,
                                          height: 45,
                                          child: GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 5,
                                              mainAxisSpacing: 3.0,
                                              crossAxisSpacing: 3.0,
                                            ),
                                            itemBuilder: (context, index) {
                                              Color mcolor = colors[index];
                                              bool colorUsedInNTags = nTags.any(
                                                  (tagMap) =>
                                                      tagMap.keys.first ==
                                                      mcolor);

                                              if (colorUsedInNTags) {
                                                return ContainerWithCheckIcon(
                                                    color: mcolor);
                                              } else {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                      color: mcolor),
                                                );
                                              }
                                            },
                                            itemCount: 15,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              : Wrap(
                                  alignment: WrapAlignment.start,
                                  spacing: 5.0,
                                  runSpacing: 5.0,
                                  children: widget.nTags.map((tagMap) {
                                    Color color = tagMap.keys.first;
                                    String keyword = tagMap.values.first;
                                    return TagBubble(
                                      keyword: keyword,
                                      type: color == Colors.black ? 1 : 0,
                                      color: color,
                                      onPressed: () {
                                        _onTagBubblePressed(
                                            color == Colors.black ? 1 : 0,
                                            color);
                                      },
                                    );
                                  }).toList(),
                                )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 50),
                            backgroundColor:
                                const Color.fromRGBO(168, 167, 167, 1),
                          ),
                          child: const Text(
                            '취소',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(100, 50),
                              backgroundColor:
                                  const Color.fromRGBO(81, 80, 80, 1),
                            ),
                            child: editing
                                ? const Text('저장',
                                    style: TextStyle(color: Colors.white))
                                : const Text(
                                    '완료',
                                    style: TextStyle(color: Colors.white),
                                  ),
                            onPressed: () {
                              if (editing) {
                                setState(() {
                                  editing = !editing;
                                });
                              } else {
                                Navigator.pop(context);
                              }
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class ContainerWithCheckIcon extends StatelessWidget {
  final Color color;

  const ContainerWithCheckIcon({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black),
      ),
      child: const Stack(
        children: [
          Center(
            child: Icon(
              Icons.check,
              size: 10,
            ),
          ),
        ],
      ),
    );
  }
}
