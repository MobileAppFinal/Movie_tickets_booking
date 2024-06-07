import 'package:flutter/material.dart';
import 'package:movie_tickets_booking/controllers/auth_controller.dart';
import 'package:movie_tickets_booking/utils/mytheme.dart';

import '../utils/constants.dart';

class ReviewBlock extends StatelessWidget {
  const ReviewBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? picUrl = AuthController.instance.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAvatar;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "43 reviews",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Viết cảm nhận của bạn >",
                  style: TextStyle(
                    color: MyTheme.splash,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: CircleAvatar(
              foregroundImage: NetworkImage(
                picUrl,
              ),
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AuthController.instance.user!.displayName ?? "No Name",
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  const WidgetSpan(
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
                  const TextSpan(
                    text: "04 April, 2024",
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  )
                ],
              ),
            ),
            subtitle:
                Text("Với tất cả các bản cập nhật sau vài tháng qua, ứng dụng đã được cải thiện rất nhiều."),
          ),
        ],
      ),
    );
  }
}