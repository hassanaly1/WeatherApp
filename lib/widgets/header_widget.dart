import 'package:flutter_weather_app/controller/global_controller.dart';
import 'package:flutter_weather_app/widgets/custom_text_widget.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLatitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              child: CustomTextWidget(
                text: city,
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              alignment: Alignment.topLeft,
              child: CustomTextWidget(
                  text: date, fontSize: 16, textColor: Colors.black54),
            ),
          ],
        ),
        Image.asset(
          'assets/weather/weather-logo.png',
          height: 100,
        )
      ],
    );
  }
}
