import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  final Color containerColor;
  final String title;
GestureTapCallback tapCallback;
   RoundContainer({Key? key,required this.title,this.containerColor=Colors.white,required this.tapCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapCallback,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(10)),
        child: Text(title),
      ),
    );
  }
}
