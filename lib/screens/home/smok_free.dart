import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/constants.dart';

class SmokingFree extends StatefulWidget {
  const SmokingFree({Key? key}) : super(key: key);

  @override
  State<SmokingFree> createState() => _SmokingFreeState();
}

class _SmokingFreeState extends State<SmokingFree> {
  int? count = 0;
  int? seconds = 0;
  int? minutes = 0;
  int? hours = 0;
  int? days = 0;
  int? months = 0;
  int se=0;
  int mi=0;
  int ho=0;
  int da=0;
  int mo=0;


  getData() async {
    SharedPreferences prf= await SharedPreferences.getInstance();
    setState(() {
      seconds= prf.getInt("seconds");
      minutes= prf.getInt("minutes");
      hours= prf.getInt("hours");
      days= prf.getInt("days");
      months= prf.getInt("months");
      count= prf.getInt("count");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: const Border(),
          color: brown,
          borderRadius: BorderRadius.circular(15),
        ),
        height: height * .12,
        child: Row(
          children: [
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
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

          ],
        ),

          ],
        ),
          ]
    )
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
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.all(1),
        child:
        Column(mainAxisAlignment: MainAxisAlignment.center, children:<Widget>[
          Text('$value', style:
          TextStyle(color:
          Colors.black, fontSize:
          20,fontWeight: FontWeight.bold)),
          Text('$label', style:
          TextStyle(color:
          Colors.black,fontWeight: FontWeight.bold))
        ])
    );
  }

}