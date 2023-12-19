import 'package:flutter/material.dart';
import '../../widgets/login/login_box.dart';
import 'login_membership.dart';
import 'login_member.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
          margin: EdgeInsets.fromLTRB(76, 140, 76, 70),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      '안녕하세요,',
                      style: TextStyle(
                        color: Color(0xFF505050),
                        fontSize: 17,
                        fontFamily: 'Noto Sans',
                        fontWeight: FontWeight.w500,
                        height:
                            1.0, // height 값을 0으로 설정하면 글자가 보이지 않을 수 있으므로 1.0 또는 적절한 값을 설정해야 합니다.
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // 텍스트들을 세로 방향으로 가운데 정렬합니다.
                  children: <Widget>[
                    Text(
                      '클립드',
                      style: TextStyle(
                        color: Color(0xFF505050),
                        fontSize: 17,
                        fontFamily: 'Noto Sans',
                        fontWeight: FontWeight.bold,
                        height: 1.0,
                      ),
                    ),
                    Text(
                      '에 오신것을 환영합니다!',
                      style: TextStyle(
                        color: Color(0xFF505050),
                        fontSize: 17,
                        fontFamily: 'Noto Sans',
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                logbox('카카오톡 로그인', Color(0xFFFEE500)),
                SizedBox(height: 10),
                emailbox('이메일 로그인', Colors.black, context),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: Text(
                      '클립드가 처음이신가요?',
                      style: TextStyle(
                        color: Colors.black, //Color(0xA8A7A7),
                        fontSize: 13,
                        fontFamily: 'Noto Sans',
                        fontWeight: FontWeight.w100,
                        height:
                            0, // height 값을 0으로 설정하면 글자가 보이지 않을 수 있으므로 1.0 또는 적절한 값을 설정해야 합니다.
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Loginbox(
                  height: 45,
                  text: '회원가입',
                  boxcolor: Colors.black,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Membershippage()),
                    );
                  },
                ),
              ]),
        ));
  }

  Loginbox logbox(String text, Color colors) {
    return Loginbox(
      height: 45,
      text: text,
      boxcolor: colors,
      onTap: () {
        print('Loginbox 클릭됨!'); // 회원가입 이동
      },
    );
  }

  Loginbox emailbox(String text, Color colors, BuildContext context) {
    return Loginbox(
      height: 45,
      text: text,
      boxcolor: colors,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Memberlogin()), // Memberlogin 페이지로 이동
        );
      },
    );
  }

  Loginbox membershipbox(String text, Color colors) {
    return Loginbox(
      height: 45,
      text: text,
      boxcolor: colors,
    );
  }
}
