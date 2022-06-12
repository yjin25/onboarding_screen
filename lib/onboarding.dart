import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:onboarding_screen/main.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Welcome to my app!',
          body:
              'This is the first page'
              'This is the Test1 page',
          image: Image.asset('image/image1.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Welcome to my app!',
          body:
              'This is the second page'
              'This is the Test2 page',
          image: Image.asset('image/image2.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Welcome to my app!',
          body:
              'This is the third page'
              'This is the Test3 page',
          image: Image.asset('image/image3.png'),
          decoration: getPageDecoration(),
        ),
      ],
      done: const Text('done'),
      onDone: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MyPage()),
        );
      },
      next: const Icon(Icons.arrow_forward_ios_rounded),
      // skip버튼
      showSkipButton: true,
      skip: const Text('Skip'), // skip은 온보딩스크린 마지막 페이지로 한번에 이동
      // 온보딩 페이지가 여러개 일 때 점 부분
      dotsDecorator: DotsDecorator(
        color: Colors.cyan,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        )
      ),
      curve: Curves.bounceOut,
      // Curves위에 마우스 올려보면 애니메이션 효과 직접 볼 수 있음
    );
  }
  PageDecoration getPageDecoration() {
    return PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      imagePadding: EdgeInsets.only(top: 40),
      pageColor: Colors.orange,
    );
  }
}
