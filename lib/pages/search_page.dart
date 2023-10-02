import 'package:flutter/material.dart';
import 'package:lifelog/widgets/search_box.dart';
import 'package:lifelog/widgets/search_bubble.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  bool searching = false;
  List<String> recentSearches = [];

  Future<void> performSearch(String keyword) async {
    if (keyword.isNotEmpty) {
      setState(() {
        searching = true;
      });
    } else {
      setState(() {
        searching = false;
      });
    }
    await Future.delayed(const Duration(seconds: 2));
  }

  void removeKeyword(String keyword) {
    setState(() {
      recentSearches.remove(keyword);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            child: TextField(
              onSubmitted: (keyword) {
                if (keyword.isNotEmpty) {
                  setState(() {
                    recentSearches.insert(0, keyword);
                  });
                }
              },
              onChanged: (keyword) {
                performSearch(keyword);
              },
              keyboardType: TextInputType.text,
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                hintText: '이름 또는 아이디 검색',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 30.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          searching
              ? Transform.translate(
                  offset: const Offset(150, 150),
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.grey,
                    ),
                  ),
                )
              : Column(
                  children: [
                    Transform.translate(
                      offset: const Offset(-140, 0),
                      child: const Text(
                        "최근 검색",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SearchBox(
                      image: Image.asset("assets/profile.png"),
                      name: "김빵빵",
                      workplace: "직장",
                      occupation: "직업",
                      onTap: () {},
                    ),
                    SearchBox(
                      image: Image.asset("assets/profile.png"),
                      name: "김빵빵",
                      workplace: "직장",
                      occupation: "직업",
                      onTap: () {},
                    ),
                    SearchBox(
                      image: Image.asset("assets/profile.png"),
                      name: "김빵빵",
                      workplace: "직장",
                      occupation: "직업",
                      onTap: () {},
                    ),
                    SearchBox(
                      image: Image.asset("assets/profile.png"),
                      name: "김빵빵",
                      workplace: "직장",
                      occupation: "직업",
                      onTap: () {},
                    ),
                  ],
                ),
          searching
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(5, 0),
                      child: const Text(
                        "최근 검색어",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: recentSearches.map((keyword) {
                        return SearchBubble(
                          keyword: keyword,
                          onRemove: () {
                            removeKeyword(keyword);
                          },
                        );
                      }).toList(),
                    )
                  ],
                )
        ],
      ),
    );
  }
}
