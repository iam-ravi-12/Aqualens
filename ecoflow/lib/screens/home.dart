import 'package:ecoflow/screens/imagepick.dart';
import 'package:ecoflow/screens/loginPage.dart';
import 'package:ecoflow/screens/manual.dart';
import 'package:ecoflow/screens/scan.dart';
import 'package:ecoflow/utility/dialog_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> _checkAndRequestPermissions() async {
    // Check if camera permission is granted
    PermissionStatus cameraPermission = await Permission.camera.status;
    // Check if location permission is granted
    PermissionStatus locationPermission = await Permission.location.status;

    if (cameraPermission.isGranted && locationPermission.isGranted) {
      // If both permissions are granted, navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ManualPage()),
      );
    } else {
      // If one or both permissions are not granted, request them
      if (!cameraPermission.isGranted) {
        await Permission.camera.request();
      }
      if (!locationPermission.isGranted) {
        await Permission.location.request();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0056FF).withOpacity(0.25),
        centerTitle: true,
        title: Text('home'.tr),
        leading: IconButton(
          onPressed: () => Get.to(LoginPage()),
          icon: Icon(
            CupertinoIcons.back,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.person_alt_circle),
          ),
          IconButton(
            onPressed: () {
              showLanguageDialog(context);
            },
            icon: Icon(CupertinoIcons.globe),
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "know your water footprint".tr,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 20),
            Text("homedesc".tr),
            SizedBox(height: 20),
            //scan it button
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Colors.blue[700],
                  ),
                ),
                onPressed: _checkAndRequestPermissions,
                child: Text(
                  "entermanually".tr,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            //Enter manually button
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue[700]),
                ),
                onPressed: () => Get.to(ImagePicke()),
                child: Text(
                  "scanit".tr,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
