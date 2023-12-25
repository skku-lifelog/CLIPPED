import 'package:flutter/material.dart';
import 'package:lifelog/screens/login/login_membership.dart';
import 'package:lifelog/screens/login/login_membership2.dart';
import 'package:lifelog/screens/login/login_screen.dart';
import 'package:lifelog/screens/login/login_member.dart';
import 'package:lifelog/screens/home.dart';
import 'package:lifelog/screens/publish/publish_paper.dart';
import 'package:lifelog/screens/mypage/clipedit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

// Future<void> _configureAmplify() async {
//   // final auth = AmplifyAuthCognito(); // Auth 서비스 생성
//   // final analytics = AmplifyAnalyticsPinpoint(); // Analytics 서비스 생성
//   bool configured = false;
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Publishpaper(),
    );
  }
}
