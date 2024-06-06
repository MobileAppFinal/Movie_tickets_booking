import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_tickets_booking/controllers/profile_controller.dart';

import '../controllers/auth_controller.dart';
import '../utils/constants.dart';
import '../utils/mytheme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  late AnimationController _animationController;
  late Animation<Offset> _animationImage, _animationCamera;

  @override
  void initState() {
    super.initState();
    Get.put(ProfileController());
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animationImage =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, -0.5)).animate(_animationController);
    _animationCamera =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, -1.2)).animate(_animationController);

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: MyTheme.appBarColor));
    String? picUrl = AuthController.instance.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAvatar;
    // String? picUrl = Constants.dummyAvatar;
    String? name = AuthController.instance.user!.displayName ?? "Name";
    String? email = AuthController.instance.user!.email;
    String? mobile = AuthController.instance.user!.phoneNumber ?? "0000000000";
    mobileController.text = mobile;
    nameController.text = name;
    emailController.text = email.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hồ sơ cá nhân",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if(notification.metrics.pixels == notification.metrics.maxScrollExtent){

                  _animationController.forward();
                } else if(notification.metrics.pixels == notification.metrics.minScrollExtent*0.5){
                  _animationController.reverse();
                }
                print(notification.metrics.pixels);
                return true;
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        color: MyTheme.appBarColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 70),
                      child: Text("Tên"),
                    ),
                    Obx(
                          () => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          readOnly: ProfileController.instance.isEdit.value,
                          initialValue: name,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFE4EDFF),
                                ),
                                child: const Icon(
                                  Icons.person_outline,
                                  color: const Color(0xFF4C7EFF),
                                ),
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                ProfileController.instance.toggleEdit();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.edit_outlined,
                                  color: Color(0xFF4C7EFF),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 70),
                      child: Text("Email"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        readOnly: true,
                        initialValue: email,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFFE4EDFF),
                              ),
                              child: const Icon(
                                Icons.email_outlined,
                                color: const Color(0xFF4C7EFF),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 70),
                      child: Text("Số điện thoại"),
                    ),
                    Obx(
                          () => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          readOnly: ProfileController.instance.isEdit.value,
                          initialValue: mobile,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFE4EDFF),
                                ),
                                child: const Icon(
                                  Icons.phone_android_outlined,
                                  color: const Color(0xFF4C7EFF),
                                ),
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                ProfileController.instance.toggleEdit();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.edit_outlined,
                                  color: Color(0xFF4C7EFF),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: MyTheme.greyColor,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text('TÀI LIỆU'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        leading: const Icon(
                          Icons.privacy_tip_outlined,
                          size: 20,
                        ),
                        title: const Text(
                          'Chính sách bảo mật',
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          // Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        leading: const Icon(
                          Icons.share,
                          size: 20,
                        ),
                        title: const Text(
                          'Chia sẻ',
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          // Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        leading: const Icon(
                          Icons.logout_outlined,
                          size: 20,
                          color: Colors.red,
                        ),
                        title: const Text(
                          'Đăng xuất',
                          style: TextStyle(color: Colors.red),
                        ),
                        onTap: () {
                          AuthController.instance.signOut();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: MediaQuery.of(context).size.width * 0.5 - 30,
              child: SlideTransition(
                position: _animationImage,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: CachedNetworkImage(
                        imageUrl: picUrl,
                        height: 120,
                        width: 120,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 170,
              left: MediaQuery.of(context).size.width * 0.5 + 30,
              child: SlideTransition(
                position: _animationCamera,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: MyTheme.appBarColor),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}