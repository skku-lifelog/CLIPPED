import 'package:flutter/material.dart';
import 'package:lifelog/widgets/clip/tagbubble.dart';

class LinkerWidget extends StatefulWidget {
  const LinkerWidget({
    super.key,
  });

  @override
  State<LinkerWidget> createState() => _LinkerWidgetState();
}

class _LinkerWidgetState extends State<LinkerWidget> {
  bool showELess = true;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(25),
            image: const DecorationImage(
              image: AssetImage("assets/background.jpg"),
              fit: BoxFit.cover,
            )),
      ),
      Positioned(
          right: 10,
          top: 7,
          child: Container(
            width: 35,
            height: 30,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(113, 112, 112, 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_add_alt_1,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          )),
      showELess
          ? Positioned(
              bottom: 0,
              child: Container(
                  height: 55,
                  width: 180,
                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.7), borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: [
                      IconButton(
                        iconSize: 25,
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: const Icon(
                          Icons.expand_less,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          setState(() {
                            showELess = false;
                          });
                        },
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "김빵빵",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(" @bbangbbang",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              )),
                        ],
                      )
                    ],
                  )))
          : Positioned(
              bottom: 0,
              child: Container(
                  height: 150,
                  width: 180,
                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.7), borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.translate(
                            offset: Offset(10, 0),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: IconButton(
                                iconSize: 25,
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                icon: const Icon(
                                  Icons.expand_more,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    showELess = true;
                                  });
                                },
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(50, 35),
                            child: IconButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                icon: Icon(
                                  size: 20,
                                  color: Colors.white,
                                  Icons.north_east,
                                )),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "김빵빵",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(" @bbangbbang",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 11,
                              )),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "성균관대•소프트웨어학과",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "341",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "팔로잉",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Text(
                        "함께 팔로우한 사람 3명",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TagBubble(
                            keyword: "대학생",
                            type: -1,
                            color: Colors.white,
                            onPressed: () {},
                          ),
                          const SizedBox(
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
                    ],
                  ))),
    ]);
  }
}
