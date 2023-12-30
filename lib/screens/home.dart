import 'package:flutter/material.dart';
import 'package:lifelog/widgets/home/clipline.dart';
import 'package:lifelog/widgets/home/paper.dart';
import 'package:lifelog/widgets/home/clip.dart';
import 'package:lifelog/widgets/home/findlinker.dart';
import 'dart:math' as math;

double radians = math.pi / 180;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Clipped",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mail_outline,
              color: Colors.grey,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 1,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                const Text(
                  "라이프로그 업데이트",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        ClipLine(
                          image: Image.asset("assets/profile.png"),
                          name: "김빵빵",
                          university: "성균관대",
                          major: "소프트웨어",
                          onTap: () {},
                          width: 220,
                          height: 70,
                          icon: const Icon(
                            Icons.north_east,
                            color: Colors.white,
                            size: 17,
                          ),
                        ),
                        ClipLine(
                          image: Image.asset("assets/profile.png"),
                          name: "김빵빵",
                          university: "성균관대",
                          major: "소프트웨어",
                          onTap: () {},
                          width: 220,
                          height: 70,
                          icon: const Icon(
                            Icons.north_east,
                            color: Colors.white,
                            size: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Text(
                  "새로운 페이퍼",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        const PaperWidget(),
                        SizedBox(
                          width: 17,
                        ),
                        const PaperWidget(),
                      ],
                    ),
                  ),
                ),
                const Text(
                  "새로운 팔로워 찾기",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        const LinkerWidget(),
                        SizedBox(
                          width: 10,
                        ),
                        const LinkerWidget(),
                        SizedBox(
                          width: 10,
                        ),
                        const LinkerWidget(),
                      ],
                    ),
                  ),
                ),
                const Text("추천 클립"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        const ClipWidget(),
                        SizedBox(
                          width: 10,
                        ),
                        ClipWidget(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BottomNavigationBar(
            backgroundColor: const Color.fromRGBO(143, 143, 143, 0.3),
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            items: <BottomNavigationBarItem>[
              BottomIcon(Icons.home, "home"),
              BottomIcon(Icons.search, "search"),
              BottomIcon(Icons.upload_file, "upload"),
              BottomIcon(Icons.attach_file, "clip"),
              BottomIcon(Icons.account_circle, "mypage"),
            ],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed),
      ),
    );
  }

  BottomNavigationBarItem BottomIcon(IconData iconData, String label) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: Colors.black,
      ),
      label: label,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
