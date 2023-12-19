import 'package:flutter/material.dart';
import '../../widgets/login/login_box.dart';
import '../../widgets/login/login_textbox.dart';

class Memberlogin extends StatefulWidget {
  const Memberlogin({super.key});

  @override
  State<Memberlogin> createState() => _MemberloginState();
}

class _MemberloginState extends State<Memberlogin> {
  final TextEditingController idcontroller = TextEditingController();
  final TextEditingController pwdcontroller = TextEditingController();
  late String email, passwrd;
  bool isInputValid = false;

  @override
  void dispose() {
    idcontroller.dispose();
    pwdcontroller.dispose();

    super.dispose();
  }

  void _handleTextChanged(String text) {
    setState(() {
      isInputValid = text.isNotEmpty;
    });
  }

  void nextPage() {
    // page 이동
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
        body: Container(
          margin: EdgeInsets.fromLTRB(90, 140, 90, 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      '로그인',
                      style: TextStyle(
                        color: Color(0xFF505050),
                        fontSize: 17,
                        fontFamily: 'Noto Sans',
                        fontWeight: FontWeight.bold,
                        height:
                            1.0, // height 값을 0으로 설정하면 글자가 보이지 않을 수 있으므로 1.0 또는 적절한 값을 설정해야 합니다.
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                letterbox('이메일', idcontroller),
                SizedBox(height: 5),
                letterbox('비밀번호', pwdcontroller),
                SizedBox(height: 50),
                movebox('로그인', Colors.black)
              ]),
        ));
  }

  Loginbox movebox(String text, Color colors) {
    return Loginbox(
      height: 40,
      text: text,
      boxcolor: colors,
      onTap: isInputValid ? nextPage : null,
    );
  }

  Ltextbox letterbox(String text, TextEditingController controller) {
    return Ltextbox(
        text: text, controller: controller, onTextChanged: _handleTextChanged);
  }
}
