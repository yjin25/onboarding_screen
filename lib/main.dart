import 'package:flutter/material.dart';
import 'onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool _isFirst = true;

Future<void> main() async {
  // 최초실행 여부 확인
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirst = prefs.getBool('isFirst') ?? true;
  _isFirst = isFirst;
  // true면 최초실행, false면 재실행

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var activity;
    // done을 눌렀을 때 최초실행이 false가 되게 만들어야함
    if (_isFirst) {
      // 최초실행
      // 온보딩 페이지로 넘어감
      activity = OnBoardingPage(title: '최초실행 튜토리얼');
      setFirst(); // ?
    } else {
      //최초실행

      activity = ();
    }

    return MaterialApp(
      home: activity,
    );
  }

  // 최초실행 체크
  setFirst() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirst', false);
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main page'), // 한번 정하고 바뀌지 않는 데이터 사용하는 위젯 앞에 무조건 'const' !!!!
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Main Screen',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25),
            ),
            //
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) =>
                    const OnBoardingPage(title: '??',)),
                  );
                },
                child: const Text('Go to onboarding screen'),
            )
          ],
        ),
      ),
    );
  }
}

