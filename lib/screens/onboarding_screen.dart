
import 'package:estate/screens/signup_screen.dart';
import "package:flutter/material.dart";
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();

}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  final PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            Container(
              color: Colors.red[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  SizedBox(
                    child: Lottie.asset('assets/images/intro1.json')
                    ),
                    const Text(
                      "Browse real estate"
                      " listings with big"
                      " beautiful home photos.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                      ),
                  )
                ], 
            ),
      
),
            Container(
              color: Colors.yellow[100],
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  SizedBox(
                    child: Lottie.asset('assets/images/intro2.json')
                    ),
                    const Text(
                      "Browse real estate"
                      " listings with big"
                      " beautiful home photos.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.blue,
                      ),
                  )
                ], 
            ),
            ),
            Container(
              color: Colors.green[100],
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  SizedBox(
                    child: Lottie.asset('assets/images/intro3.json')
                    ),
                    const Text(
                      "Real estate notification alerts on price reductions"
                      " and new listings",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 106, 143, 20),
                      ),
                  )
                ], 
            ),
            ),
          ],
        ),
        Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text("Skip"),
                ),
                SmoothPageIndicator(controller: _controller, count: 3),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const SignUpScreen();
                          }
                          )
                          );
                        },
                        child: const Text("Done"))
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text("Next")),
              ],
            ))
      ],
    ));
  }
}
