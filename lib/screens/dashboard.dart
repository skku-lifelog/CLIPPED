import 'package:flutter/material.dart';
import '../pages/my_page.dart';
import '../pages/search_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 4;
  final List _pages = [
    const Text('Page 1'),
    const Text('Page 2'),
    const Text('Page 3'),
    const SearchPage(),
    const MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Lifelog",
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
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem>[
            BottomIcon(Icons.home, "home"),
            BottomIcon(Icons.language, "world"),
            BottomIcon(Icons.add, "upload"),
            BottomIcon(Icons.search, "search"),
            BottomIcon(Icons.perm_identity, "mypage"),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed),
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
