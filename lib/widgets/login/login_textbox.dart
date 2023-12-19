import 'package:flutter/material.dart';

class Ltextbox extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final Function(String) onTextChanged;

  const Ltextbox({
    required this.text,
    required this.controller,
    required this.onTextChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600, // 원하는 너비 설정
      // decoration: ShapeDecoration(
      //   shape: RoundedRectangleBorder(
      //     side: BorderSide(
      //       width: 2,
      //       color: Color(0xFF505050),
      //     ),
      //   ),
      // ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF505050),
              width: 2,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF505050),
              width: 2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF505050),
              width: 2,
            ),
          ),
        ),
        onChanged: onTextChanged,
      ),
    );
  }
}

class Ltextbox2 extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final Function(String) onTextChanged;
  final bool obscureText;

  const Ltextbox2({
    required this.text,
    required this.controller,
    required this.onTextChanged,
    required this.obscureText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600, // 원하는 너비 설정
      // decoration: ShapeDecoration(
      //   shape: RoundedRectangleBorder(
      //     side: BorderSide(
      //       width: 2,
      //       color: Color(0xFF505050),
      //     ),
      //   ),
      // ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF505050),
              width: 2,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF505050),
              width: 2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF505050),
              width: 2,
            ),
          ),
        ),
        onChanged: onTextChanged,
        obscureText: obscureText,
      ),
    );
  }
}

class Indicatetext extends StatelessWidget {
  final String text; // number
  // final String etext; // explanation text
  // final String htext; // hint text

  const Indicatetext({
    required this.text,
    // required this.etext,
    // required this.htext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center, // 텍스트들을 세로 방향으로 가운데 정렬합니다.
      children: <Widget>[
        Text(
          '회원가입',
          style: TextStyle(
            color: Color(0xFF505050),
            fontSize: 17,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.bold,
            height: 1.0,
          ),
        ),
        SizedBox(width: 5),
        Text(
          '($text/4)',
          style: TextStyle(
            color: Color(0xFF505050),
            fontSize: 11,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.bold,
            height: 1.0,
          ),
        ),
      ],
    );
  }
}

class Explaintext extends StatelessWidget {
  final String etext; // explanation text
  final String htext; // hint text

  const Explaintext({
    required this.etext,
    required this.htext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 텍스트들을 세로 방향으로 가운데 정렬합니다.
      children: <Widget>[
        Text(
          etext,
          style: TextStyle(
            color: Color(0xFF505050),
            fontSize: 17,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w500,
            height: 1.0,
          ),
        ),
        SizedBox(height: 12),
        Text(
          htext,
          style: TextStyle(
            color: Color(0xFF505050),
            fontSize: 11,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w500,
            height: 1.0,
          ),
        ),
      ],
    );
  }
}

class Explaintext2 extends StatelessWidget {
  final String etext; // explanation text
  final String htext; // hint text

  const Explaintext2({
    required this.etext,
    required this.htext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 텍스트들을 세로 방향으로 가운데 정렬합니다.
      children: <Widget>[
        Text(
          etext,
          style: TextStyle(
            color: Color(0xFF505050),
            fontSize: 17,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w500,
            height: 1.0,
          ),
        ),
        SizedBox(height: 12),
        Text(
          htext,
          style: TextStyle(
            color: Color(0xFF505050),
            fontSize: 17,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w500,
            height: 1.0,
          ),
        ),
      ],
    );
  }
}
