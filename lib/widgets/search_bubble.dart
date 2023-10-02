import 'package:flutter/material.dart';

class SearchBubble extends StatelessWidget {
  final String keyword;
  final VoidCallback onRemove;
  const SearchBubble({required this.keyword, required this.onRemove, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.translate(
            offset: const Offset(15, -1),
            child: Text(
              keyword,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          IconButton(
            onPressed: () {
              onRemove();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.grey,
              size: 17,
            ),
          ),
        ],
      ),
    );
  }
}
