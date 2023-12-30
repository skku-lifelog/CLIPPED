import 'package:flutter/material.dart';
import 'package:lifelog/screens/home.dart';

///home.dart';
import 'package:lifelog/widgets/clip/tagbubble.dart';
import 'package:lifelog/screens/mypage/clipaddpaper.dart';
import 'package:lifelog/widgets/clip/linkbubble.dart';

// void main() => runApp(const ClipEdit());
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
  final TextEditingController _lc = TextEditingController();
  final TextEditingController tc = TextEditingController();
  int num = 0;
  int exnum = 0;
  List<Map<Color, String>> tags = [
    {const Color.fromRGBO(253, 203, 110, 1.0): "학업"},
    {const Color.fromRGBO(225, 112, 85, 1.0): "일상"},
    {const Color.fromRGBO(214, 49, 49, 1.0): "뉴비"},
    {const Color.fromRGBO(232, 68, 147, 1.0): "전공"},
    {Colors.black: "새 태그 추가"}
  ];

  List<Map<Color, String>> checkedTags = [];

  List<Color> colors = [
    const Color.fromRGBO(253, 203, 110, 1.0),
    const Color.fromRGBO(225, 112, 85, 1.0),
    const Color.fromRGBO(214, 49, 49, 1.0),
    const Color.fromRGBO(232, 68, 147, 1.0),
    const Color.fromRGBO(255, 234, 167, 1.0),
    const Color.fromRGBO(250, 177, 160, 1.0),
    const Color.fromRGBO(255, 118, 118, 1.0),
    const Color.fromRGBO(253, 121, 168, 1.0),
    const Color.fromRGBO(85, 239, 196, 1.0),
    const Color.fromRGBO(129, 236, 236, 1.0),
    const Color.fromRGBO(116, 185, 255, 1.0),
    const Color.fromRGBO(162, 155, 254, 1.0),
    const Color.fromRGBO(0, 184, 148, 1.0),
    const Color.fromRGBO(0, 206, 201, 1.0),
    const Color.fromRGBO(9, 132, 227, 1.0),
    const Color.fromRGBO(108, 92, 231, 1.0),
  ];

  List<String> relatedPapers = [];
  List<String> links = [];

  Color? selectedColor;

  String tagKeyword = "";
  Color tagColor = Colors.black;
  bool editTags = false;
  bool addTags = false;
  bool addTagType = false;

  void removeKeyword(String keyword) {
    setState(() {
      links.remove(keyword);
    });
  }

  void removePaper(String title) {
    setState(() {
      relatedPapers.remove(title);
    });
  }

  void _handleSubmitted(String text) {
    setState(() {
      links.add(text);
      _lc.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(241, 241, 241, 1),
        body: SingleChildScrollView(
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 0),
              child: Column(
                children: [
                  Transform.translate(offset: const Offset(-160, 0), child: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back))),
                  Text(
                    "로그 작성",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          maxLength: 20,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "제목을 입력해주세요",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            counterText: '',
                          ),
                        ),
                      ),
                      Text(
                        "($num/20)",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
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
                            onPressed: () {},
                          );
                        }).toList(),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              editTags = true;
                            });
                          },
                          icon: Icon(
                            Icons.edit,
                            size: 15,
                          ))
                    ],
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
                    height: 25,
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
                        height: 130,
                        child: TextField(
                          onChanged: (keyword) {
                            setState(() {
                              exnum = keyword.length;
                            });
                          },
                          keyboardType: TextInputType.text,
                          controller: _ec,
                          maxLines: 4,
                          maxLength: 100,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "클립에 대한 간략한 설명을 작성해주세요",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                            counterText: '',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "($exnum/100)",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text("관련 페이퍼"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: relatedPapers.map((paperText) {
                      return Column(
                        children: [
                          RelatedPaper(
                            paperText: paperText,
                            onRemove: () {
                              removePaper(paperText);
                            },
                          ),
                          SizedBox(height: 4), // Adjust the height as needed
                        ],
                      );
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final result = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ClipAddPaper(
                                initialClickedPapers: relatedPapers,
                              ),
                            ),
                          );

                          if (result != null) {
                            setState(() {
                              relatedPapers = List<String>.from(result);
                            });
                          }
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 20,
                            ),
                            Text(
                              "페이퍼 추가",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text("링크 삽입"),
                    ],
                  ),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 240,
                            child: TextField(
                              onChanged: (keyword) {
                                setState(() {
                                  num = keyword.length;
                                });
                              },
                              onSubmitted: (keyword) {
                                if (keyword.isNotEmpty) {
                                  _handleSubmitted(keyword);
                                }
                              },
                              keyboardType: TextInputType.text,
                              controller: _lc,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "링크를 입력하세요",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: -15,
                            bottom: 0,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                // Check if the keyword is not empty before submitting
                                if (_lc.text.isNotEmpty) {
                                  _handleSubmitted(_lc.text);
                                }
                              },
                              icon: Icon(
                                Icons.add,
                                size: 20,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 7,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 1, // Adjust the height of the underline as needed
                              color: Colors.grey, // Set the color of the underline
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: links.map((keyword) {
                          return LinkBubble(
                            keyword: keyword,
                            onRemove: () {
                              removeKeyword(keyword);
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
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
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const ConfirmPublish(),
                              ),
                            );
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            if (editTags)
              addTags
                  ? Positioned(
                      bottom: 0,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              )),
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
                            Transform.scale(
                              scale: 1.3, // Adjust the scale factor as needed
                              child: Icon(
                                Icons.horizontal_rule,
                                color: Colors.grey,
                                size: 40,
                              ),
                            ),
                            Text(
                              "태그 수정",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    Transform.translate(
                                      offset: Offset(0, -2),
                                      child: SizedBox(
                                        width: 70,
                                        height: 25,
                                        child: TextField(
                                          keyboardType: TextInputType.text,
                                          controller: tc,
                                          style: TextStyle(fontSize: 13),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 90,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    Transform.translate(
                                      offset: Offset(0, -20),
                                      child: SizedBox(
                                        width: 70,
                                        height: 100,
                                        child: GridView.builder(
                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            mainAxisSpacing: 4.0,
                                            crossAxisSpacing: 2.0,
                                          ),
                                          itemBuilder: (context, index) {
                                            Color mcolor = colors[index];
                                            bool colorUsedInNTags = tags.any((tagMap) => tagMap.keys.first == mcolor);
                                            return ContainerWithCheckIcon(
                                                color: mcolor,
                                                type: mcolor != tagColor &&
                                                    tags.any(
                                                      (tagMap) => tagMap.keys.first == mcolor,
                                                    ),
                                                isSelected: colorUsedInNTags,
                                                onTap: () {});
                                          },
                                          itemCount: 16,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 90,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(120, 50),
                                          backgroundColor: const Color.fromRGBO(168, 167, 167, 1),
                                        ),
                                        child: const Text(
                                          '취소',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            // 숨기기
                                            selectedColor = null;
                                            addTags = false;
                                          });
                                        },
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
                                            '저장',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              print(selectedColor);
                                              print(tc.text);
                                              if (selectedColor != null && tc.text.isNotEmpty == true) {
                                                checkedTags.add({selectedColor!: tc.text});
                                              }
                                              print(checkedTags);
                                              selectedColor = null;
                                              addTags = false;
                                              // editTags = false;
                                            });
                                            // 바뀐거 적용하고 숨기기
                                          }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ]))))
                  : Positioned(
                      bottom: 0,
                      child: Container(
                        height: 255,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Transform.scale(
                                scale: 1.3, // Adjust the scale factor as needed
                                child: Icon(
                                  Icons.maximize,
                                  color: Colors.grey,
                                  size: 35,
                                ),
                              ),
                              Text(
                                "태그 수정",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                    top: 25,
                                  ),
                                  child: SizedBox(
                                    height: 80,
                                    width: 180,
                                    child: Wrap(
                                      alignment: WrapAlignment.start,
                                      spacing: 5.0,
                                      runSpacing: 5.0,
                                      children: tags.map((tagMap) {
                                        Color color = tagMap.keys.first;
                                        String keyword = tagMap.values.first;
                                        return TagBubble(
                                          keyword: keyword,
                                          type: color == Colors.black ? 1 : 0,
                                          color: color,
                                          onPressed: () {
                                            setState(() {
                                              addTags = true;
                                              addTagType = color == Colors.black ? true : false;
                                              tagKeyword = color == Colors.black ? "" : keyword;
                                              tc.text = tagKeyword;
                                              tagColor = color;
                                              checkedTags.clear();
                                              checkedTags.addAll(tags);
                                            });
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(120, 50),
                                      backgroundColor: const Color.fromRGBO(168, 167, 167, 1),
                                    ),
                                    child: const Text(
                                      '취소',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        checkedTags.clear();
                                        // 숨기기
                                        editTags = false;
                                      });
                                    },
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
                                        '완료',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          // CheckedTags 적용하고 숨기기.
                                          tags.clear();
                                          tags.addAll(checkedTags);
                                          checkedTags.clear();
                                          editTags = false;
                                        });
                                        // 바뀐거 적용하고 숨기기
                                      }),
                                ],
                              ),
                              SizedBox(height: 10)
                            ],
                          ),
                        ),
                      ))
          ]),
        ),
      ),
    );
  }
}

class ContainerWithCheckIcon extends StatefulWidget {
  final Color color;
  bool isSelected;
  final bool type;
  final VoidCallback onTap;

  ContainerWithCheckIcon({Key? key, required this.type, required this.color, required this.isSelected, required this.onTap}) : super(key: key);

  @override
  State<ContainerWithCheckIcon> createState() => _ContainerWithCheckIconState();
}

class _ContainerWithCheckIconState extends State<ContainerWithCheckIcon> {
  bool get isSelected => widget.isSelected;
  bool get type => widget.type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        type && (type == isSelected)
            ? setState(() {})
            : setState(() {
                widget.isSelected = !widget.isSelected;
              });
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          border: widget.isSelected ? Border.all(color: Colors.black) : Border.all(color: Colors.transparent),
        ),
        child: isSelected
            ? Stack(
                children: [
                  Center(
                    child: Icon(
                      Icons.check,
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            : null,
      ),
    );
  }
}

class ConfirmPublish extends StatelessWidget {
  const ConfirmPublish({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(113, 112, 112, 1),
              borderRadius: BorderRadius.circular(30.0), // Adjust the radius as needed
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Icon(
                  Icons.check_circle_outline,
                  size: 32,
                  color: Colors.white,
                ),
                Text(
                  "작성한 클립을 발행하시겠습니까?",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  "작성된 클립이 타임라인에 추가되며\n내 타임라인이 업데이트 됩니다.",
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(120, 50),
                        backgroundColor: const Color.fromRGBO(168, 167, 167, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: const Text(
                        '취소',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(120, 50),
                        backgroundColor: const Color.fromRGBO(81, 80, 80, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: const Text(
                        '확인',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RelatedPaper extends StatelessWidget {
  final String paperText;
  final VoidCallback onRemove;

  const RelatedPaper({Key? key, required this.paperText, required this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 270,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(217, 217, 217, 1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform.translate(
            offset: const Offset(20, 0),
            child: Text(
              paperText,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              onRemove();
            },
            icon: const Icon(
              Icons.clear,
              size: 15,
            ),
          )
        ],
      ),
    );
  }
}

// class BottomSheetExample extends StatefulWidget {
//   List<Map<Color, String>> nTags;
//   BottomSheetExample({required this.nTags, Key? key}) : super(key: key);

//   @override
//   State<BottomSheetExample> createState() => _BottomSheetExampleState(nTags: nTags);
// }

// class _BottomSheetExampleState extends State<BottomSheetExample> {
//   bool editing = false;
//   List<Map<Color, String>> nTags;

//   _BottomSheetExampleState({required this.nTags});
//   final TextEditingController tc = TextEditingController();
//   List<Color> colors = [
//     const Color.fromRGBO(253, 203, 110, 1.0),
//     const Color.fromRGBO(225, 112, 85, 1.0),
//     const Color.fromRGBO(214, 49, 49, 1.0),
//     const Color.fromRGBO(232, 68, 147, 1.0),
//     const Color.fromRGBO(255, 234, 167, 1.0),
//     const Color.fromRGBO(250, 177, 160, 1.0),
//     const Color.fromRGBO(255, 118, 118, 1.0),
//     const Color.fromRGBO(253, 121, 168, 1.0),
//     const Color.fromRGBO(85, 239, 196, 1.0),
//     const Color.fromRGBO(129, 236, 236, 1.0),
//     const Color.fromRGBO(116, 185, 255, 1.0),
//     const Color.fromRGBO(162, 155, 254, 1.0),
//     const Color.fromRGBO(0, 184, 148, 1.0),
//     const Color.fromRGBO(0, 206, 201, 1.0),
//     const Color.fromRGBO(9, 132, 227, 1.0),
//     const Color.fromRGBO(108, 92, 231, 1.0),
//   ];

//   void _onTagBubblePressed(int type, Color color) {
//     setState(() {
//       editing = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: const Icon(
//         Icons.edit,
//         size: 15,
//       ),
//       onPressed: () {
//         showModalBottomSheet<void>(
//           context: context,
//           builder: (BuildContext context) {
//             return SizedBox(
//               height: 250,
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     const Text(
//                       "태그 수정",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 25,
//                       ),
//                       child: SizedBox(
//                           height: 80,
//                           width: 180,
//                           child: editing
//                               ? Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         const Text(
//                                           "태그명",
//                                           style: TextStyle(
//                                             fontSize: 13,
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           width: 20,
//                                         ),
//                                         SizedBox(
//                                           width: 70,
//                                           height: 25,
//                                           child: TextField(
//                                             keyboardType: TextInputType.text,
//                                             controller: tc,
//                                             decoration: const InputDecoration(
//                                               border: InputBorder.none,
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Row(
//                                       children: [
//                                         const Text(
//                                           "태그색",
//                                           style: TextStyle(
//                                             fontSize: 13,
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           width: 20,
//                                         ),
//                                         SizedBox(
//                                           width: 70,
//                                           height: 45,
//                                           child: GridView.builder(
//                                             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                                               crossAxisCount: 4,
//                                               mainAxisSpacing: 3.0,
//                                               crossAxisSpacing: 3.0,
//                                             ),
//                                             itemBuilder: (context, index) {
//                                               Color mcolor = colors[index];
//                                               bool colorUsedInNTags = nTags.any((tagMap) => tagMap.keys.first == mcolor);

//                                               if (colorUsedInNTags) {
//                                                 return ContainerWithCheckIcon(color: mcolor);
//                                               } else {
//                                                 return Container(
//                                                   decoration: BoxDecoration(color: mcolor),
//                                                 );
//                                               }
//                                             },
//                                             itemCount: 16,
//                                           ),
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 )
//                               : Wrap(
//                                   alignment: WrapAlignment.start,
//                                   spacing: 5.0,
//                                   runSpacing: 5.0,
//                                   children: widget.nTags.map((tagMap) {
//                                     Color color = tagMap.keys.first;
//                                     String keyword = tagMap.values.first;
//                                     return TagBubble(
//                                       keyword: keyword,
//                                       type: color == Colors.black ? 1 : 0,
//                                       color: color,
//                                       onPressed: () {
//                                         _onTagBubblePressed(color == Colors.black ? 1 : 0, color);
//                                       },
//                                     );
//                                   }).toList(),
//                                 )),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             fixedSize: const Size(100, 50),
//                             backgroundColor: const Color.fromRGBO(168, 167, 167, 1),
//                           ),
//                           child: const Text(
//                             '취소',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               editing = false;
//                             });
//                           },
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               fixedSize: const Size(100, 50),
//                               backgroundColor: const Color.fromRGBO(81, 80, 80, 1),
//                             ),
//                             child: editing
//                                 ? const Text('저장', style: TextStyle(color: Colors.white))
//                                 : const Text(
//                                     '완료',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                             onPressed: () {
//                               if (editing) {
//                                 setState(() {
//                                   editing = !editing;
//                                 });
//                               } else {
//                                 Navigator.pop(context);
//                               }
//                             }),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

