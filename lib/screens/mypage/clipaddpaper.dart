import 'package:flutter/material.dart';
import 'package:lifelog/main.dart';
import 'package:lifelog/screens/mypage/clipedit.dart';
import 'package:lifelog/widgets/clip/tagbubble.dart';

class ClipAddPaper extends StatefulWidget {
  final List<String> initialClickedPapers;

  const ClipAddPaper({Key? key, required this.initialClickedPapers}) : super(key: key);

  @override
  State<ClipAddPaper> createState() => _ClipAddPaperState(initialClickedPapers: initialClickedPapers);
}

class _ClipAddPaperState extends State<ClipAddPaper> {
  List<String> clickedPapers = [];
  List<String> initialPapers = [];
  List<PaperElement> paperElements = [];

  _ClipAddPaperState({required List<String> initialClickedPapers}) {
    // Initialize clickedPapers with the provided values
    clickedPapers.addAll(initialClickedPapers);
    initialPapers.addAll(initialClickedPapers);
  }

  void handlePaperSelection(String paperTitle) {
    setState(() {
      if (clickedPapers.contains(paperTitle)) {
        // If already selected, remove it
        clickedPapers.remove(paperTitle);
      } else {
        // If not selected, add it
        clickedPapers.add(paperTitle);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    List<String> titles = ["Paper 1", "Paper 2", "Paper 3", "Paper 4", "Paper 5"];

    paperElements = [
      PaperElement(isSelected: clickedPapers.contains(titles[0]), onTap: handlePaperSelection, paperTitle: "Paper 1"),
      PaperElement(isSelected: clickedPapers.contains(titles[1]), onTap: handlePaperSelection, paperTitle: "Paper 2"),
      PaperElement(isSelected: clickedPapers.contains(titles[2]), onTap: handlePaperSelection, paperTitle: "Paper 3"),
      PaperElement(isSelected: clickedPapers.contains(titles[3]), onTap: handlePaperSelection, paperTitle: "Paper 4"),
      PaperElement(isSelected: clickedPapers.contains(titles[4]), onTap: handlePaperSelection, paperTitle: "Paper 5"),
    ];
  }

  void erasePapers() {
    setState(() {
      clickedPapers.clear();

      for (var element in paperElements) {
        element.setIsSelected(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            children: [
              Transform.translate(
                offset: const Offset(-160, 0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context, initialPapers);
                  },
                  icon: const Icon(Icons.keyboard_backspace),
                  iconSize: 25,
                ),
              ),
              // Add your other widgets and content here
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${clickedPapers.length}개 선택",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  GestureDetector(
                    onTap: erasePapers,
                    child: Text(
                      "선택 해제",
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(120, 50),
                        backgroundColor: const Color.fromRGBO(81, 80, 80, 1),
                      ),
                      child: const Text(
                        '추가',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context, clickedPapers);
                      }),
                ],
              ),
              SizedBox(height: 30),
              ...paperElements.expand((element) => [element, SizedBox(height: 15)]),
            ],
          ),
        ),
      ),
    );
  }
}

class PaperElement extends StatefulWidget {
  final Function(String) onTap;
  final String paperTitle;
  final bool isSelected;
  final GlobalKey<_PaperElementState> key;

  PaperElement({
    required this.onTap,
    required this.paperTitle,
    required this.isSelected,
    super.key,
  }) : key = GlobalKey<_PaperElementState>();

  // 추가된 부분
  void setIsSelected(bool value) {
    key.currentState?.setIsSelected(value);
  }

  @override
  State<PaperElement> createState() => _PaperElementState(initialbool: isSelected);
}

class _PaperElementState extends State<PaperElement> {
  late bool isSelected;

  _PaperElementState({required bool initialbool}) {
    isSelected = initialbool;
  }

  void setIsSelected(bool value) {
    setState(() {
      isSelected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });

        widget.onTap(widget.paperTitle);
      },
      child: Container(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey,
            border: isSelected
                ? Border.all(
                    color: Color.fromRGBO(81, 80, 80, 1),
                    width: 2.0,
                  )
                : Border.all(
                    color: Colors.transparent, // Set to a fully transparent color
                    width: 2.0,
                  ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // 태그들 넣는 곳. 차후 wrap으로 처리하기
                  children: [
                    TagBubble(
                      keyword: "대학생",
                      type: -1,
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    TagBubble(
                      keyword: "컴공",
                      type: -1,
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
                Text(
                  "사용자 경험 리서치",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "2023/10/2 발행 • 2023/10/3 수정됨",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                Transform.translate(
                  offset: Offset(310, -85),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Transform.translate(
                      offset: Offset(-3, -2.5),
                      child: Icon(
                        Icons.check_circle,
                        color: isSelected ? Color.fromRGBO(81, 80, 80, 1) : Color.fromRGBO(168, 167, 167, 1),
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
