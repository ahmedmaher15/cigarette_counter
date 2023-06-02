import 'package:cigarettecounterapp/constants/constants.dart';
import 'package:cigarettecounterapp/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AskingScreen extends StatefulWidget {
  const AskingScreen({Key? key}) : super(key: key);

  @override
  State<AskingScreen> createState() => _AskingScreenState();
}

class _AskingScreenState extends State<AskingScreen> {
  @override
  Widget build(BuildContext context) {
    double q1=0;
    double q2=0;
    double q3=0;
    double q4=0;
    var cigPerDayController = TextEditingController()..text = "";
    var cigInPackController = TextEditingController()..text = "";
    var yearsController = TextEditingController()..text = "";
    var priceController = TextEditingController()..text = "";
    setData()async{
      SharedPreferences pref=await SharedPreferences.getInstance();
      setState(() {
        pref.setDouble("q1",q1 );
        pref.setDouble("q2",q2 );
        pref.setDouble("q3",q3 );
        pref.setDouble("q4",q4);
      });
    }

    return  Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text("Answer please"),
          leading: IconButton(
            icon: const Icon(Icons.question_answer),
            onPressed: () {},
          ),
          flexibleSpace: Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [brown, brown2],
                )),
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            buildTextField(
                cigPerDayController, "Cigarettes smoked day", "........."),
            const SizedBox(
              height: 50,
            ),
            buildTextField(
                cigInPackController, "Cigarettes in a pack", "........."),
            const SizedBox(
              height: 50,
            ),
            buildTextField(
                yearsController, " years of smoking", ".......sad."),
            const SizedBox(
              height: 50,
            ),
            buildTextField(priceController, "Price per pack", ".........")
          ],
        ),
        extendBody: true,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
               q1=double.parse(cigPerDayController.text);
               q2=double.parse(cigInPackController.text)  ;
               q3=double.parse(yearsController.text) ;
               q4=double.parse( priceController.text);
               setData();
            });
            Navigator.pushReplacement(context, MaterialPageRoute(builder:(ctx)=> HomeScreen(q1,q2,q3,q4)));
          },
          child: const Icon(
            Icons.done,
            size: 30,
          ),
        ));
  }
  Container buildTextField(var cont, String lbText, String hent) {
    return Container(
      height: 50,
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black,
          labelText: lbText,
          hintText: hent,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.white12, width: 5.0)),
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        controller: cont,
      ),
    );
  }


}


