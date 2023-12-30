import 'package:flutter/material.dart';
import 'package:lifelog/widgets/home/clipline.dart'; //클립라인 가져오기
import 'package:lifelog/screens/detailpaper.dart';

class PaperWidget extends StatelessWidget {
  const PaperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void handlePopupMenuSelection(String value) {
      switch (value) {
        case 'share':
          // Handle share
          break;
        case 'send':
          // Handle send
          break;
        case 'hide':
          // Handle hide
          break;
      }
    }

    void showPopupMenu(BuildContext context) {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      final Offset offset = renderBox.localToGlobal(Offset.zero);
      showMenu(
        context: context,
        color: const Color.fromRGBO(115, 115, 115, 0.9),
        position: RelativeRect.fromLTRB(
          offset.dx + 110,
          offset.dy + renderBox.size.height - 230,
          offset.dx + renderBox.size.width + 110,
          offset.dy + renderBox.size.height - 340, // Adjust as needed
        ),
        items: [
          PopupMenuItem(
            value: 'share',
            child: Row(
              children: [
                Icon(
                  Icons.share,
                  size: 12,
                  color: Colors.white,
                ),
                SizedBox(width: 5),
                Text(
                  "프로필 공유",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'send',
            child: Row(
              children: [
                Icon(
                  Icons.send,
                  size: 12,
                  color: Colors.white,
                ),
                SizedBox(width: 5),
                Text(
                  "메세지 보내기",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
              value: 'hide',
              child: Row(
                children: [
                  Icon(
                    Icons.visibility_off,
                    size: 12,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "컨텐츠 숨기기",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  )
                ],
              )),
        ],
      ).then((value) {
        if (value != null) {
          handlePopupMenuSelection(value);
        }
      });
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        width: 240,
        height: 300,
        color: Colors.blueGrey,
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white, // 테두리 색상
                        width: 2.0, // 테두리 너비
                      ),
                    ),
                    child: const Text(
                      "#대학생",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white, // 테두리 색상
                        width: 2.0, // 테두리 너비
                      ),
                    ),
                    child: const Text(
                      "#컴공",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "사용자 경험 리서치",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              const Text(
                "최근에 논리회로 수업을 듣고 있습니다. 공부한 내용을 정리하는 습관을 들이고자 이 시리즈를 개설했어요. 많은 관심 부탁드립니다 ...",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "3주•수정됨",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
              const SizedBox(
                height: 90,
              ),
            ],
          ),
          Positioned(
            top: -15,
            right: -15,
            child: IconButton(
              icon: const Icon(
                Icons.open_in_full,
                size: 15,
                color: Colors.white,
              ),
              onPressed: () {
                // 버튼이 클릭되었을 때 실행될 코드
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailPaper()),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipLine(
              image: Image.asset("assets/profile.png"),
              name: "김빵빵",
              university: "성균관대",
              major: "소프트웨어",
              onTap: () {
                showPopupMenu(context);
              },
              width: 210,
              height: 55,
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 17,
              ),
            ),
          ),
          Positioned(
              right: 0,
              top: 110,
              child: Container(
                width: 30,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(113, 112, 112, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.attach_file,
                      color: Colors.white,
                      size: 18,
                    ),
                    Text(
                      "12",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                    )
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
