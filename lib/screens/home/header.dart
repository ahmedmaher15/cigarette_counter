import 'package:cigarettecounterapp/constants/constants.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SliverList(
      delegate: SliverChildListDelegate([
        Stack(
          children:[ Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50,right: 10,left: 10,bottom: 20),
                height: size.height / 4,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                  colors: [
                    brown2,
                    brown,
                    Colors.amber,
                  ],
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                  ),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(45)),
                  boxShadow: [BoxShadow(blurRadius: 2)],
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white70,
                          radius: 35,
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/Myimage.png"),
                            radius: 30,
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Column(
                          children: [
                            const Text("Ahmed Maher",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black54
                              ),
                              child: const Text("Gold Member",style: TextStyle(color: Colors.white),),
                            )
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),

              ),
              const SizedBox(height: 20,)
            ],
          ),
          ]
        )
      ]),
    );
  }
}
