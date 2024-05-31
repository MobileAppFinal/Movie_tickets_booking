import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_tickets_booking/utils/mytheme.dart';

class SocialLoginButtons extends StatelessWidget {
  final Function() onGoogleClick;
  final Function() onFacebookClick;
  const SocialLoginButtons({super.key, required this.onGoogleClick, required this.onFacebookClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Expanded(
         child: Material(
           color: MyTheme.redLight,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15),
             side:  const BorderSide(color: MyTheme.redBorder, width: 0.2),
           ),

           child: InkWell(
             onTap: onGoogleClick,
             child: Padding(
               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
               child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/google.svg', height: 30),
                    const SizedBox(width: 10),
                    const Text('Google', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
             )
            ),
         ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Material(
            color: MyTheme.blueLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: MyTheme.blueBorder, width: 0.2),
            ),

            child: InkWell(
              onTap: onFacebookClick,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/facebook.svg', height: 30),
                    const SizedBox(width: 10),
                    const Text('FaceBook', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ),
          ),
        ),
      ],
    );
  }
}
