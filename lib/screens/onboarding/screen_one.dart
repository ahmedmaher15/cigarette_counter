import 'package:cigarettecounterapp/screens/onboarding/screen_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/constants.dart';
import '../asking_screen/asking.dart';
import '../home/home_screen.dart';
import 'components/slanding_clipper.dart';

class OnboardingScreenOne extends StatefulWidget {
  @override
  State<OnboardingScreenOne> createState() => _OnboardingScreenOneState();
}

class _OnboardingScreenOneState extends State<OnboardingScreenOne> {
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  double? q1;

  double? q2;

  double? q3;

  double? q4;

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      q1 = pref.getDouble("q1");
      q2 = pref.getDouble("q2");
      q3 = pref.getDouble("q3");
      q4 = pref.getDouble("q4");
    });
  }

  @override
  Widget build(BuildContext context) {
    //it will helps to return the size of the screen
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  width: size.width,
                  height: size.height * 0.6,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/onboard1.png'),
                ),
                ClipPath(
                  clipper: SlandingClipper(),
                  child: Container(
                    height: size.height * 0.4,
                    color: yellow,
                  ),
                )
              ],
            ),
            Positioned(
              top: size.height * 0.65,
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(appPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'For You',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: white,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      'Smoking causes It causes lung diseases, \n such as emphysema and chronic bronchitis.',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: appPadding / 4),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        color: white),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: appPadding / 4),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        color: yellow),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: appPadding / 4),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        color: yellow),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: appPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () =>
                          q1 != null && q2 != null && q3 != null && q4 != null
                              ? Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(q1!, q2!, q3!, q4!)))
                              : Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AskingScreen())),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: appPadding),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => OnboardingScreenTwo(),
                          ),
                        );
                      },
                      backgroundColor: white,
                      child: Icon(
                        Icons.navigate_next_rounded,
                        color: black,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
