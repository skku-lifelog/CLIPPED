import 'package:flutter/material.dart';

class ClipLine extends StatelessWidget {
  final Image image;
  final String name, university, major;
  final VoidCallback onTap;
  final double height, width;
  final Icon icon;

  const ClipLine({
    required this.image,
    required this.name,
    required this.university,
    required this.major,
    required this.onTap,
    required this.height,
    required this.width,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 7,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(113, 112, 112, 1),
          ),
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center, // 세로 중앙 정렬을 위해 추가
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  ClipOval(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: image,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Transform.translate(
                      offset: const Offset(0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(" @nameid",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ))
                            ],
                          ),
                          Text(
                            "$university • $major",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onTap,
                    icon: icon,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
