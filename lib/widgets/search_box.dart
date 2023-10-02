import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final Image image;
  final String name, workplace, occupation;
  final VoidCallback onTap;
  const SearchBox(
      {required this.image,
      required this.name,
      required this.workplace,
      required this.occupation,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 7,
      ),
      child: Row(
        children: [
          ClipOval(
            child: SizedBox(
              height: 50,
              width: 50,
              child: image,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "$workplace•$occupation",
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
