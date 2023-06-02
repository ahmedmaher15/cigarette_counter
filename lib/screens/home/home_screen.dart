import 'package:cigarettecounterapp/constants/constants.dart';
import 'package:cigarettecounterapp/screens/home/smok_free.dart';
import 'package:cigarettecounterapp/screens/home/time.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(this.q1, this.q2, this.q3, this.q4, {super.key});

  final double q1;
  final double q2;
  final double q3;
  final double q4;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    return Scaffold(
      backgroundColor: black,
      body: CustomScrollView(
        slivers: [
          Header(),
          MyHomePage(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildColumn(Icons.flag, widget.q3, "Smoking free",
                          height * 0.15, width * 0.3),
                      Container(
                        color: Colors.grey,
                        child: const VerticalDivider(
                          color: Colors.grey,
                          thickness: 1.0,
                          width: 1,
                          endIndent: 70,
                          indent: 50,
                        ),
                      ),

                      buildColumn(Icons.payments_outlined, widget.q4,
                          "Money per day", height * 0.15, width * 0.3),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                    height: 1,
                    endIndent: 20,
                    indent: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildColumn(Icons.schedule, widget.q1, "Time wast",
                          height * 0.15, width * 0.3),
                      Container(
                        color: Colors.grey,
                        child: const VerticalDivider(
                          color: Colors.grey,
                          thickness: 1.0,
                          width: 1,
                          endIndent: 70,
                          indent: 50,
                        ),
                      ),
                      buildColumn(Icons.smoke_free, widget.q1,
                          "Cigarette smoked", height * 0.15, width * 0.3),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      border: const Border(),
                      color: brown,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: width * 1,
                    height: height * .28,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "During the period that you smoked",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              height:40,
                              width: 30,
                              decoration:BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black
                              ),
                              child: const Icon(
                                Icons.smoking_rooms_outlined,
                                size: 25,
                                color: brown,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text(
                              "${(widget.q1 * widget.q3 * 366)}  Sigarettes Smoked",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "RobotoCondensed",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height:40,
                              width: 30,
                              decoration:BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black
                              ),
                              child:  Icon(
                                Icons.money_off,
                                size: 25,
                                color: brown,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text(
                              "${((widget.q1 * widget.q3 * 366) / widget.q2) * widget.q4} \$ Money Wasted",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "RobotoCondensed"),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                height:40,
                                width: 30,
                                decoration:BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black
                                ),
                              child: const Icon(
                                Icons.access_time_rounded,
                                size: 20,
                                color: brown,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text(
                              "${(widget.q1 * widget.q3 * 366)} \$ Life Lost",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "RobotoCondensed",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          ),
          SmokingFree(),
        ],
      ),
    );
  }

  Container buildColumn(
      IconData ic, double mony, String text, double? h, double? w) {
    return Container(
      decoration: BoxDecoration(
        border: const Border(),
        color: brown,
        borderRadius: BorderRadius.circular(15),
      ),
      width: w,
      height: h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            ic,
            size: 40,
          ),
          SizedBox(height: 5,),
          FittedBox(child: Text("$mony ")),
          SizedBox(height: 5,),
          FittedBox(child: Text(text)),
        ],
      ),
    );
  }
}
