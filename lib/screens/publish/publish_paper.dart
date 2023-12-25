import 'package:flutter/material.dart';
import 'package:lifelog/screens/home.dart';

///home.dart';
import 'package:lifelog/widgets/clip/tagbubble.dart';
import 'package:lifelog/widgets/clip/hashtagbubble.dart';

void main() => runApp(const Publishpaper());
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

class Publishpaper extends StatefulWidget {
  const Publishpaper({Key? key}) : super(key: key);

  @override
  State<Publishpaper> createState() => _PublishpaperState();
}

class _PublishpaperState extends State<Publishpaper> {
  final TextEditingController _tc = TextEditingController();
  final TextEditingController _ec = TextEditingController();
  late bool imageIndicater1 = false;
  int num = 0;
  int exnum = 0;
  List<String> tags = ["태그 입력"];
  List<Widget> images = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Transform.translate(
                    offset: const Offset(-160, 0),
                    child: IconButton(
                        onPressed: () {
                          // imageIndicater1 = true;
                          // 복귀 로직
                        },
                        icon: const Icon(Icons.arrow_back))),
                Transform.translate(
                    offset: const Offset(0, 0),
                    child: Text(
                      '페이퍼 작성',
                      style: TextStyle(
                        color: Color(0xFF505050),
                        fontSize: 14,
                        fontFamily: 'Noto Sans',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    )),
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
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "본문",
                    ),
                    const SizedBox(
                      width: 235,
                    ),
                    IconButton(
                      // onPressed: () {
                      //   setState(() {
                      //     imageIndicater1 =
                      //         !imageIndicater1; // Toggle the image indicator
                      //   });
                      // },
                      onPressed: () => _addImage(), // 이미지 추가 함수 호출
                      icon: Icon(Icons.image),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 290,
                      height: 300,
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
                          hintText: "내용을 입력해주세요",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                for (var image in images)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10), // 이미지 간의 간격
                    child: image,
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
                    Text("태그"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 7.0,
                  runSpacing: 5.0,
                  children: tags.asMap().entries.map((entry) {
                    int index = entry.key;
                    String tag = entry.value;

                    return Container(
                      constraints: BoxConstraints(
                        maxWidth: 100,
                        maxHeight: 20,
                      ),
                      child: HashtagBubble(
                        initialText: tag,
                        onSubmitted: (newTag) {
                          if (index == tags.length - 1) {
                            _addTag(newTag);
                          } else {
                            _editTag(newTag, index);
                          }
                        },
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 30,
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
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _editTag(String newTag, int index) {
    if (newTag.isNotEmpty && !tags.contains(newTag)) {
      setState(() {
        tags[index] = newTag;
      });
    }
  }

  void _addTag(String newTag) {
    if (newTag.isNotEmpty && !tags.contains(newTag)) {
      setState(() {
        tags.add(newTag);
      });
    }
  }

  // void _addImage() {
  //   setState(() {
  //     images.add(Image.asset('assets/test1.png'));
  //   });
  // }

  void _addImage() {
    setState(() {
      images.add(
        Container(
          height: 150,
          child: Image.asset(
            'assets/test1.png',
            fit: BoxFit.cover, // 이미지가 주어진 공간 내에서 비율을 유지하면서 채워지도록 함
          ),
        ),
      );
    });
  }
}
