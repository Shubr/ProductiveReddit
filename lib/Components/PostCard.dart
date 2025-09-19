import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

// class PostCard extends StatelessWidget{

// }

Widget PostCard() {
  return (Container(
    width: 400,
    height: 200,
    decoration: BoxDecoration(
      color: Color.fromRGBO(23, 23, 23, 1),
      borderRadius: BorderRadius.circular(20),
      boxShadow:[
        BoxShadow(
          color: Color.fromRGBO(120,205,87,1),
          spreadRadius: 0,
          offset: Offset(0, -20)
        )
      ],

    ),
  ));
}
