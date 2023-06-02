import 'dart:ffi';

import 'package:cigarettecounterapp/constants/constants.dart';
import 'package:flutter/material.dart';

class DaylyDetails extends StatelessWidget {
   DaylyDetails(  this._icon,  this._mony,  this._data) ;
   final IconData _icon;
   final double _mony;
   final String _data;

  @override
  Widget build(BuildContext context) {

    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: brown
        ),
                  child:Column(
                    children: [
                      Icon(_icon),
                      SizedBox(height: 5,),
                      Text("${_mony}"),
                      SizedBox(height: 5,),
                      Text(_data),
                    ],
                  ) ,
                )
    );
  }
}
