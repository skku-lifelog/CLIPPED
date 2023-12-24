import 'package:flutter/material.dart';
import 'package:lifelog/widgets/home/clipline.dart';
import 'package:lifelog/widgets/clip/tagbubble.dart';

class DetailPaper extends StatefulWidget {
  const DetailPaper({Key? key}) : super(key: key);

  @override
  State<DetailPaper> createState() => _DetailPaperState();
}

class _DetailPaperState extends State<DetailPaper> {
  bool isEmpty = true; // bottom modal test용

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromRGBO(241, 241, 241, 1),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.keyboard_backspace),
                iconSize: 25,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Theme(
                                data: Theme.of(context).copyWith(
                                  cardColor: const Color.fromRGBO(115, 115, 115, 0.9),
                                ),
                                child: PopupMenuButton(
                                  itemBuilder: (context) {
                                    return [
                                      const PopupMenuItem(
                                          value: 'clip',
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.share,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 5),
                                              Text("페이퍼 공유",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                  ))
                                            ],
                                          )),
                                      const PopupMenuItem(
                                          value: 'clip',
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.attach_file,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 5),
                                              Text("클립",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                  ))
                                            ],
                                          )),
                                      const PopupMenuItem(
                                          value: 'report',
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.report_problem,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 5),
                                              Text("신고",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                  ))
                                            ],
                                          )),
                                    ];
                                  },
                                  offset: const Offset(-10, 20),
                                  onSelected: (value) {
                                    switch (value) {
                                      case 'share':
                                        print('share');
                                        break;
                                      case 'clip':
                                        print('clip');
                                        break;
                                      case 'report':
                                        print('report');
                                        break;
                                    }
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  constraints: const BoxConstraints.tightFor(height: 150),
                                  child: const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Icon(
                                      Icons.more_vert,
                                      size: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "[우아한 형제들] 우아톤 참가 냐미",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "2023/10/11 발행",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      "2023/10/13 수정됨",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ClipLine(
                                image: Image.asset("assets/profile.png"),
                                name: "김빵빵",
                                university: "성균관대",
                                major: "소프트웨어",
                                onTap: () {},
                                width: 205,
                                height: 50,
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: Colors.transparent,
                                  size: 0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: const Image(
                                    image: AssetImage('assets/paper_image.png'),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "우아톤은 우아한 형제들 구성원 누구나 참여할 수 있는 사내 해커톤으로 구성원 3~5명이 한 팀을 이뤄 24시간 안에 프로토타입으로 서비스를 구현해 내는 행사입니다. 업무에서 벗어나 아이디어 실현해 볼 수 있는 시간을 드리고, 수상 팀에게는 상금과 실제 배민 서비스에 적용할 수 있는 기회를 제공합니다.\n운영하는 DR팁 입장에서 다른 행사보다 특히 우아톤이 기억에 남는 이유는, 밤샘 행사인 만큼 가장 힘들어서... 동료들과 함께 밀도 있게 몰입하고 성취하는 현장을 생생하게 느낄 수 있어서인데요. 다양한 직군, 다양한 소속의 구성원이 공통된 관심사로 한데 모여 각자의 능력을 발휘하면서도 합심하여 문제를 해결하는 과정을 볼 수 있는 기회는 흔치 않습니다.\n우아한 형제들은 사내 행사에 진심이기에 진짜로 다들 밤을 새우며 아주 열심히 참여합니다. 이걸 하루 만에...?라는 생각이 절로 드는 신박하고 대단한 결과물이 쏟아져 나옵니다. 우아톤이 무박 2일간 진행되다 보니 아무래도 구성원들이 육체적으로 정신적으로도 힘들 수밖에 없는데요. 이러한 환경에서도 열정을 다해 참여하는 모습이 감동으로 다가오기도 하고, 우아톤을 통해 구성원들이 결속력을 다지고 성취하는 경험을 가지는 데에 기여했다는 점에서 운영진 또한 큰 보람을 느낍니다.",
                                  style: TextStyle(
                                    fontSize: 11.5,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    TagBubble(
                                      keyword: "우아한형제들",
                                      type: -1,
                                      color: Colors.black,
                                      onPressed: () {},
                                    ),
                                    TagBubble(
                                      keyword: "컴공",
                                      type: -1,
                                      color: Colors.black,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(
                                          const Color(0xff737373),
                                        ),
                                        fixedSize: MaterialStateProperty.all<Size>(
                                          const Size(80, 55),
                                        ),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20.0), // 좌상단 모서리에 둥근 효과 적용
                                              topRight: Radius.circular(20.0), // 우상단 모서리에 둥근 효과 적용
                                            ),
                                          ),
                                          builder: (BuildContext context) {
                                            List<Widget> modalContent = [];

                                            if (!isEmpty) {
                                            } else {
                                              // If there are no comments, add empty space
                                              modalContent.add(Container(
                                                  decoration: const BoxDecoration(color: Color.fromRGBO(115, 115, 115, 0.7)),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: 30,
                                                        ),
                                                        const Row(
                                                          children: [
                                                            SizedBox(width: 4),
                                                            Icon(
                                                              Icons.chat_bubble_outline,
                                                              size: 17,
                                                              color: Colors.white,
                                                            ),
                                                            SizedBox(width: 2),
                                                            Text("3",
                                                                style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors.white,
                                                                ))
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            ClipOval(
                                                              child: Image.asset(
                                                                "assets/profile.png",
                                                                width: 35,
                                                                height: 35,
                                                              ),
                                                            ),
                                                            const SizedBox(width: 2),
                                                            Text("@jh_park",
                                                                style: TextStyle(
                                                                  color: Colors.white.withOpacity(0.8),
                                                                  fontSize: 10,
                                                                )),
                                                            Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsets.symmetric(
                                                                  horizontal: 8,
                                                                  vertical: 8,
                                                                ),
                                                                child: TextField(
                                                                  style: const TextStyle(color: Colors.white),
                                                                  decoration: InputDecoration(
                                                                    hintText: "댓글 작성",
                                                                    hintStyle: TextStyle(
                                                                      color: Colors.white.withOpacity(0.6),
                                                                      fontSize: 10,
                                                                    ),
                                                                    enabledBorder: const UnderlineInputBorder(
                                                                      borderSide: BorderSide(color: Colors.white),
                                                                    ),
                                                                    focusedBorder: const UnderlineInputBorder(
                                                                      borderSide: BorderSide(color: Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TextButton(
                                                              onPressed: () {},
                                                              style: ButtonStyle(
                                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                  RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(25.0), // Adjust the radius as needed
                                                                    side: const BorderSide(color: Colors.white), // White border color
                                                                  ),
                                                                ),
                                                                fixedSize: MaterialStateProperty.all<Size>(
                                                                  const Size(35, 25),
                                                                ),
                                                              ),
                                                              child: const Text(
                                                                "등록",
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )));
                                              modalContent.add(ListTile(
                                                horizontalTitleGap: 0,
                                                leading: ClipOval(
                                                  child: Image.asset(
                                                    "assets/profile.png",
                                                    width: 35,
                                                    height: 35,
                                                  ),
                                                ),
                                                title: const Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "송연우",
                                                              style: TextStyle(
                                                                fontSize: 11,
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                            Text(" @nameid",
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 11,
                                                                ))
                                                          ],
                                                        ),
                                                        Text(
                                                          "성균관대 • 소프트웨어",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 9,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(width: 10),
                                                    Text("우와~해커톤 멋있습니다.",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                        ))
                                                  ],
                                                ),
                                                trailing: Theme(
                                                  data: Theme.of(context).copyWith(
                                                    cardColor: const Color.fromRGBO(115, 115, 115, 0.9),
                                                  ),
                                                  child: PopupMenuButton(
                                                    itemBuilder: (context) {
                                                      return [
                                                        const PopupMenuItem(
                                                            value: 'edit',
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.edit,
                                                                  size: 12,
                                                                  color: Colors.white,
                                                                ),
                                                                SizedBox(width: 5),
                                                                Text("수정",
                                                                    style: TextStyle(
                                                                      fontSize: 10,
                                                                      color: Colors.white,
                                                                    ))
                                                              ],
                                                            )),
                                                        const PopupMenuItem(
                                                            value: 'erase',
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.delete_outline,
                                                                  size: 12,
                                                                  color: Colors.white,
                                                                ),
                                                                SizedBox(width: 5),
                                                                Text("삭제",
                                                                    style: TextStyle(
                                                                      fontSize: 10,
                                                                      color: Colors.white,
                                                                    ))
                                                              ],
                                                            )),
                                                      ];
                                                    },
                                                    offset: const Offset(-10, 20),
                                                    onSelected: (value) {
                                                      switch (value) {
                                                        case 'edit':
                                                          print('edit');
                                                          break;
                                                        case 'erase':
                                                          print('erase');
                                                          break;
                                                      }
                                                    },
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(7),
                                                    ),
                                                    child: const SizedBox(
                                                      width: 20,
                                                      height: 20,
                                                      child: Icon(
                                                        Icons.more_vert,
                                                        size: 17,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                tileColor: const Color.fromRGBO(115, 115, 115, 0.7),
                                                onTap: () {
                                                  // Handle option 1
                                                  Navigator.pop(context); // Close the modal
                                                },
                                              ));
                                              modalContent.add(ListTile(
                                                horizontalTitleGap: 0,
                                                leading: ClipOval(
                                                  child: Image.asset(
                                                    "assets/profile.png",
                                                    width: 35,
                                                    height: 35,
                                                  ),
                                                ),
                                                title: const Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "장하현",
                                                              style: TextStyle(
                                                                fontSize: 11,
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                            Text(" @nameid",
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 11,
                                                                ))
                                                          ],
                                                        ),
                                                        Text(
                                                          "성균관대 • 소프트웨어",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 9,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(width: 10),
                                                    Text("저도 참여해보고 싶네요",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                        ))
                                                  ],
                                                ),
                                                tileColor: const Color.fromRGBO(115, 115, 115, 0.7),
                                                onTap: () {
                                                  // Handle option 1
                                                  Navigator.pop(context); // Close the modal
                                                },
                                              ));
                                              modalContent.add(Container(
                                                height: 55,
                                                color: const Color.fromRGBO(115, 115, 115, 0.7),
                                              ));
                                            }

                                            return Container(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: modalContent,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: const Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.chat_bubble_outline,
                                            size: 18,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            "3",
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(
                                          const Color.fromRGBO(115, 115, 115, 1),
                                        ),
                                        fixedSize: MaterialStateProperty.all<Size>(
                                          const Size(80, 55),
                                        ),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        // 버튼이 클릭되었을 때 수행할 동작
                                      },
                                      child: const Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.favorite,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            "112",
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              )
            ],
          ),
        ),
      ),
    );
  }
}
