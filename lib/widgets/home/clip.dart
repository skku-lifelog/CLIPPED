import 'package:flutter/material.dart';
import 'package:lifelog/widgets/home/clipline.dart';

class ClipWidget extends StatelessWidget {
  const ClipWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: 230,
      height: 190,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "첫 해커톤 참가",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "2023.9.12~2023.9.14",
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Column(children: [
                    Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 15,
                    ),
                    Text(
                      "98",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    )
                  ])
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "•새로 추가된 클립",
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "3시간 전 추가됨",
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Positioned(
          right: 10,
          child: Icon(
            Icons.open_in_full,
            size: 15,
            color: Colors.white,
          ),
        ),
        Positioned(
            left: 15,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(0, 1),
                  child: SizedBox(
                    height: 10,
                    width: 10,
                    child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(242, 198, 251, 1.0))),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "전공",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ],
            )),
        Positioned(
          bottom: 0,
          left: 3,
          child: ClipLine(
            image: Image.asset("assets/profile.png"),
            name: "김빵빵",
            university: "성균관대",
            major: "소프트웨어",
            onTap: () {},
            width: 210,
            height: 55,
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 17,
            ),
          ),
        ),
      ]),
    );
  }
}
