import 'package:flutter/material.dart';

class LinkBubble extends StatelessWidget {
  final String keyword;
  final VoidCallback onRemove;
  const LinkBubble({required this.keyword, required this.onRemove, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
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
                fontSize: 10,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              onRemove();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.grey,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}
