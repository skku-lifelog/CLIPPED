import 'package:flutter/material.dart';
import 'package:lifelog/widgets/login/login_textbox.dart';
import '../../widgets/login/login_box.dart';
import 'login_membership2.dart';

class Membershippage extends StatefulWidget {
  const Membershippage({super.key});

  @override
  State<Membershippage> createState() => MembershipState();
}

class MembershipState extends State<Membershippage> {
  String stepNumber = '1';
  String stepExp = '이메일을 입력해주세요';
  String stepHint = '로그인에 사용될 아이디입니다.';
  String hint = '이메일';
  late String email, name, pwd1, pwd2;
  // bool emailChecked = false;
  // bool nameChecked = false;
  // bool pwdChecked = false;
  double padding = 40;
  int checker = 0;
  TextEditingController textcontroller = TextEditingController();
  TextEditingController textcontroller2 = TextEditingController();
  // namecontroller,
  // passcontroller1,
  // passcontroller2;
  bool isInputValid = false;

  @override
  // void initState() {
  //   super.initState();
  //   textcontroller = TextEditingController();
  //   textcontroller2 = TextEditingController();
  //   // namecontroller = TextEditingController();
  //   // passcontroller1 = TextEditingController();
  //   // passcontroller2 = TextEditingController();
  // }

  @override
  void dispose() {
    textcontroller.dispose();
    textcontroller2.dispose();
    // namecontroller.dispose();
    // passcontroller1.dispose();
    // passcontroller2.dispose();
    super.dispose();
  }

  void _handleTextChanged(String text) {
    setState(() {
      isInputValid = text.isNotEmpty;
    });
  }

  void nextStep() {
    checker++;
    updateStep();
    isInputValid = false;
  }

  void updateStep() {
    if (checker == 0) {
      stepNumber = '1';
      stepExp = '이메일을 입력해주세요';
      stepHint = '로그인에 사용될 아이디입니다.';
      hint = '이메일';
    } else if (checker == 1) {
      email = textcontroller.text;
      //checker = true;
      textcontroller.clear();

      stepNumber = '2';
      stepExp = '이름을 입력해주세요';
      stepHint = '실명을 입력해주세요.';
      hint = '이름';
    } else if (checker == 2) {
      name = textcontroller.text;
      //checker = true;
      textcontroller.clear();

      stepNumber = '3';
      stepExp = '비밀번호를 입력해주세요';
      stepHint = '';
      hint = '비밀번호';
      padding = 20;
    } else if (checker == 3) {
      pwd1 = textcontroller.text;
      pwd2 = textcontroller2.text;
      //checker = true;
      textcontroller.clear();
      textcontroller2.clear();
      // page이동
      if (pwd1 == pwd2) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Membershippage2()), // Memberlogin 페이지로 이동
        );
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffffffff),
          elevation: 0,
          title: Text(
            'Clipped',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Orelega One',
              fontWeight: FontWeight.bold,
              height: 0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(90, 140, 90, 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  indtext(stepNumber),
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: exptext(stepExp, stepHint),
                  ),
                  SizedBox(height: padding),
                  if (checker != 2) letterbox(hint, textcontroller),
                  if (checker == 2) ...[
                    oletterbox('비밀번호 입력', textcontroller, true),
                    SizedBox(height: 10),
                    oletterbox('비밀번호 확인', textcontroller2, true),
                  ],
                  SizedBox(height: 40),
                  movebox('다음', Colors.black)
                ]),
          ),
        ));
  }

  Indicatetext indtext(String num) {
    return Indicatetext(text: num);
  }

  Explaintext exptext(String etext, String htext) {
    return Explaintext(etext: etext, htext: htext);
  }

  Loginbox movebox(String text, Color colors) {
    return Loginbox(
      height: 40,
      text: text,
      boxcolor: colors,
      onTap: isInputValid ? nextStep : null,
    );
  }

  Ltextbox letterbox(String text, TextEditingController controller) {
    return Ltextbox(
        text: text, controller: controller, onTextChanged: _handleTextChanged);
  }

  Ltextbox2 oletterbox(String text, TextEditingController controller,
      [bool obscureText = false]) {
    return Ltextbox2(
      text: text,
      controller: controller,
      onTextChanged: _handleTextChanged,
      obscureText: obscureText,
    );
  }
}
