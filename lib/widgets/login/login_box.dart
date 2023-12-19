import 'package:flutter/material.dart';

class Loginbox extends StatelessWidget {
  final double height;
  final String text;
  final Color boxcolor;
  final VoidCallback? onTap; // 클릭 이벤트를 위한 콜백 추가

  const Loginbox({
    required this.height,
    required this.text,
    required this.boxcolor,
    this.onTap, // 선택적으로 콜백을 받을 수 있도록 수정
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // InkWell 위젯을 사용
      onTap: onTap, // onTap 콜백을 InkWell에 연결
      borderRadius: BorderRadius.circular(64), // InkWell의 물결 효과에 대한 경계를 설정
      child: Container(
        width: 600,
        height: height,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: boxcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(64),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: boxcolor == Color(0xFFFEE500)
                    ? Colors.black.withOpacity(0.85)
                    : Colors.white,
                fontSize: 13,
                fontFamily: 'Noto Sans',
                fontWeight: FontWeight.w500,
                height: 1.0, // 높이 값을 0에서 1.0으로 수정해야 텍스트가 보입니다.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
