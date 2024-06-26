import 'package:flutter/material.dart';
import 'package:movie_tickets_booking/utils/dummy_data.dart';

class CustomSlider extends StatelessWidget {
  final index;
  const CustomSlider({Key? key, this.index = 0 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.3,
      width: size.width,
      // color: Colors.red,
      child: Image.asset(
        sliderData[index].url, 
        fit: BoxFit.cover,
      ),
    );
  }
}