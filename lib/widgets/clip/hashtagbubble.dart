import 'package:flutter/material.dart';

class HashtagBubble extends StatefulWidget {
  final String initialText; // 초기 텍스트 값을 위한 매개변수 추가
  final Function(String) onSubmitted; // 태그를 추가하는 함수

  const HashtagBubble({
    Key? key,
    required this.onSubmitted,
    this.initialText = '',
  }) : super(key: key);

  @override
  State<HashtagBubble> createState() => _HashtagBubbleState();
}

class _HashtagBubbleState extends State<HashtagBubble> {
  final TextEditingController _controller = TextEditingController();
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isEditing = true; // 편집 모드로 전환
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1.5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(25),
        ),
        child: _isEditing
            ? TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: '#태그 입력',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    widget.onSubmitted(value.trim()); // 태그 추가
                  }
                  setState(() {
                    _isEditing = false;
                  });
                },
              )
            : Text(
                _controller.text.isEmpty ? '#태그 입력' : '#${_controller.text}',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
