import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:movie_tickets_booking/utils/event_items.dart';
import 'package:movie_tickets_booking/utils/movies_item.dart';
import 'package:movie_tickets_booking/utils/mytheme.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../controllers/auth_controller.dart';
import '../utils/dummy_data.dart';
import '../utils/constants.dart';
import '../utils/custom_slider.dart';
import '../utils/menu_item.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  String city = cities[0];
  final Completer<GoogleMapController> _controller = Completer();
 
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(16.074011, 108.149901),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799, 
      target: LatLng(16.074011, 108.149901), 
      tilt: 59.440717697143555, 
      zoom: 19.151926040649414
  );

  @override
  Widget build(BuildContext context){
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: MyTheme.statusBar));
    String? picUrl = AuthController.instance.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAvatar;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CachedNetworkImage(
                  imageUrl: picUrl,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                  ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text ("Name"),
                  DropdownButton<String>(
                    value: city,
                    dropdownColor: MyTheme.statusBar,
                    isDense: true,
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    items: cities
                      .map(
                        (e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                    onChanged: (st){
                      setState(() {
                        city = st!;
                      });
                    },
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(onPressed: (){},
              icon: SvgPicture.asset("assets/icons/search.svg"),
              ),
              IconButton(onPressed: (){},
              icon: SvgPicture.asset("assets/icons/notification.svg", color: Colors.white,),
              ),
            ],
          ),
        ),

        body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height*0.2,
                  width: size.width,
                  color: Colors.red,
                  child: PageView.builder(                
                    itemCount: 3,
                    itemBuilder: (_, i){
                      return CustomSlider(
                        index: i,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "LOẠI PHIM", 
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),
                  ),
                ),
                const MenuItem(),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    "PHIM ĐỀ XUẤT", 
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),
                  ),
                ),
                const MoviesItems(),

                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "RẠP GẦN ĐÂY", 
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),
                      ),
                      TextButton(
                        onPressed: (){},
                        child: const Text(
                          "Xem tất cả", 
                          style: TextStyle(color: Colors.grey),
                        )  
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.2,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                      Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer(),
                      )
                    },
                    onMapCreated: (GoogleMapController controller) {
                      //_controller.complete(controller);
                    },
                    zoomControlsEnabled: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/spotlights.svg", 
                        color: Colors.black.withOpacity(0.8),
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "SỰ KIỆN", 
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8),),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: (){},
                        child: const Text(
                          "Xem tất cả", 
                          style: TextStyle(color: Colors.grey),
                        )  
                      ),
                    ],
                  ),
                ),
                EventItems(
                  events: events,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/theater_masks.svg", 
                        color: Colors.black.withOpacity(0.8),
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "KỊCH", 
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8),),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: (){},
                        child: const Text(
                          "Xem tất cả", 
                          style: TextStyle(color: Colors.grey),
                        )  
                      ),
                    ],
                  ),
                ),
                EventItems(
                  events: plays,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}