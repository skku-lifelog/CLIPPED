import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:lifelog/screens/login_screen.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'amplifyconfiguration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  runApp(const MyApp());
}

Future<void> _configureAmplify() async {
  // final auth = AmplifyAuthCognito(); // Auth 서비스 생성
  // final analytics = AmplifyAnalyticsPinpoint(); // Analytics 서비스 생성
  bool configured = false;

  try {
    await Amplify.addPlugin(AmplifyAuthCognito()); // 플러그인 추가
    await Amplify.configure(amplifyconfig); // amplifyconfig 변수 정의 필요
    configured = true;
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }

  if (configured) {
    safePrint('Successfully configured Amplify 🎉');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}
