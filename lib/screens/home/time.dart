import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const duration = const Duration(seconds: 1);

  int secondsPassed = 0;
  bool isActive = true;
  Timer? timer;
  int seconds=0;
  int minutes=0;
  int hours=0;
  int days=0;
  int months=0;
  int count=0;
  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  setData()async{
    SharedPreferences prf= await SharedPreferences.getInstance();
    setState(() {
      prf.setInt("seconds", seconds);
      prf.setInt("minutes", minutes);
      prf.setInt("hours", hours);
      prf.setInt("days", days);
      prf.setInt("months", months);
      prf.setInt("count", count);
    });
  }
  @override
  void initState() {
    super.initState();
    getData();
  }
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      seconds = prefs.getInt('seconds') ?? 0;
      minutes = prefs.getInt('minutes') ?? 0;
      hours = prefs.getInt('hours') ?? 0;
      days = prefs.getInt('days') ?? 0;
      months = prefs.getInt('months') ?? 0;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    setData();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    if (timer == null)
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
     seconds = secondsPassed % 60;
     minutes = secondsPassed ~/ 60;
     hours = secondsPassed ~/ (60 * 60);
     days = secondsPassed ~/ (60 * 60 * 24);
     months = secondsPassed ~/ (60 * 60 * 24 * 30);
    final Size size = MediaQuery.of(context).size;
    return  SliverToBoxAdapter(
      child: Column(
          children: [Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LabelText(
                        label: 'Months', value: months.toString().padLeft(2, '0')),
                    LabelText(
                        label: 'Days', value: days.toString().padLeft(2, '0')),
                    LabelText(
                        label: 'Hours', value: hours.toString().padLeft(2, '0')),
                    LabelText(
                        label: 'Minutes', value: minutes.toString().padLeft(2, '0')),
                    LabelText(
                        label: 'Seconds', value: seconds.toString().padLeft(2, '0')),
                  ],
                ),
              ),

            ],
          ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child:ElevatedButton(
                style:ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Color(0x9BA96314)), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)
                    )
                )),
                child:
                Text('RESET Timer'),
                onPressed: () {
                  setState(() {
                    setData();
                    secondsPassed = 0;
                    count=count+1;
                  });
                },
              ),
            ),
          ]

      ),
    );
  }
}

class LabelText extends StatelessWidget {
  LabelText({required this.label,required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(1),
        child:
        Column(mainAxisAlignment: MainAxisAlignment.center, children:<Widget>[
          Text('$value', style:
          TextStyle(color:
          Colors.brown, fontSize:
          20)),
          Text('$label', style:
          TextStyle(color:
          Colors.brown))
        ])
    );
  }

}