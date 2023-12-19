import 'package:flutter/material.dart';
import 'dart:math' as math;

double radians = math.pi / 180;

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
          right: 15,
          top: 3,
          child: Transform.rotate(
            angle: 90 * radians,
            child: Container(
              width: 30,
              height: 45,
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
                ],
              ),
            ),
          )),
      showELess
          ? Positioned(
              bottom: 0,
              child: Container(
                  height: 70,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: [
                      IconButton(
                        iconSize: 25,
                        icon: const Icon(
                          Icons.expand_less,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          showELess = false;
                        },
                      ),
                      Transform.translate(
                        offset: const Offset(0, -10),
                        child: const Row(
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
                        ),
                      )
                    ],
                  )))
          : Positioned(
              bottom: 0,
              child: Container(
                  height: 150,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: [
                      IconButton(
                        iconSize: 25,
                        icon: const Icon(
                          Icons.expand_more,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          showELess = true;
                        },
                      ),
                      Transform.translate(
                        offset: const Offset(0, -10),
                        child: const Row(
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
                                  color: Colors.white,
                                  fontSize: 13,
                                )),
                          ],
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -10),
                        child: const Row(
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
                      ),
                      Transform.translate(
                        offset: const Offset(0, -5),
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
                              "연결",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Text(
                        "나와 연결된 사람 3명과 연결중",
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
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white, // 테두리 색상
                                width: 1.0, // 테두리 너비
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white, // 테두리 색상
                                width: 1.0, // 테두리 너비
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
                    ],
                  ))),
    ]);
  }
}
