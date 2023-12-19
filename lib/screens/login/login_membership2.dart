import 'package:flutter/material.dart';
import 'package:lifelog/widgets/login/login_textbox.dart';
import 'package:lifelog/widgets/login/login_box.dart';
import 'package:lifelog/widgets/login/terms.dart';
import 'package:lifelog/widgets/login/checkbox.dart';
import 'package:lifelog/screens/home.dart';

class Membershippage2 extends StatefulWidget {
  const Membershippage2({super.key});

  @override
  State<Membershippage2> createState() => _Membershippage2State();
}

class _Membershippage2State extends State<Membershippage2> {
  String stepNumber = '1';
  bool ischecked1 = false, ischecked2 = false, ischecked3 = false;
  bool allchecked = false;
  bool get isInputValid => ischecked1 && ischecked2;

  // void _handleTextChanged(String text) {
  //   setState(() {
  //     // 체크를 눌렀을 경우
  //   });
  // }

  void nextStep() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HomePage()), // Memberlogin 페이지로 이동
    );
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
                  indtext('4'),
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: exptext('클립드 서비스 이용약관에', '동의해주세요'),
                  ),
                  SizedBox(height: 40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        termbox('[필수] 이용 약관 동의  ', terms1, ischecked1,
                            (newValue) {
                          setState(() {
                            ischecked1 = newValue;
                          });
                        }),
                        SizedBox(height: 9),
                        termbox('[필수] 개인정보 처리 방침 동의  ', terms2, ischecked2,
                            (newValue) {
                          setState(() {
                            ischecked2 = newValue;
                          });
                        }),
                        SizedBox(height: 9),
                        termbox('[선택] 마케팅 활용 동의  ', terms3, ischecked3,
                            (newValue) {
                          setState(() {
                            ischecked3 = newValue;
                          });
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  Center(
                    child: Container(
                      width: 640,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.5,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFF505050),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          termbox2('모두동의(선택 약관 포함)', allchecked, (newValue) {
                            setState(() {
                              allchecked = newValue;
                            });
                          }),
                        ]),
                  ),
                  SizedBox(height: 6),
                  Center(
                    child: Container(
                      width: 150,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.5,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFF505050),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  movebox('다음', Colors.black)
                ]),
          ),
        ));
  }

  Loginbox movebox(String text, Color colors) {
    return Loginbox(
      height: 40,
      text: text,
      boxcolor: colors,
      onTap: isInputValid ? nextStep : null,
    );
  }

  Indicatetext indtext(String num) {
    return Indicatetext(text: num);
  }

  Explaintext2 exptext(String etext, String htext) {
    return Explaintext2(etext: etext, htext: htext);
  }

  Row termbox(
      String text, String terms, bool isChecked, ValueChanged<bool> onChanged) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontFamily: 'Noto Sans',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
      InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 1600,
                color: Colors.white,
                child: Center(
                  child: Text(terms),
                ),
              );
            },
          );
        },
        child: Text(
          "보기",
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      SizedBox(width: 13),
      CustomCheckbox(
        value: isChecked,
        onChanged: onChanged,
      ),
    ]);
  }

  Center termbox2(String text, bool isChecked, ValueChanged<bool> onChanged) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Noto Sans',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          SizedBox(width: 13),
          // CustomCheckbox(
          //   value: isChecked,
          //   onChanged: onChanged,
          // ),
          CustomCheckbox(
            value: isChecked,
            onChanged: (newValue) {
              setState(() {
                allchecked = newValue;
                if (allchecked) {
                  ischecked1 = true;
                  ischecked2 = true;
                  ischecked3 = true;
                } else {
                  ischecked1 = false;
                  ischecked2 = false;
                  ischecked3 = false;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
