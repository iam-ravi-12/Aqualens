import 'package:ecoflow/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:ecoflow/controller/scan_controller.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        title: Text('Scan Page'),
        leading: IconButton(
          onPressed: () => Get.to(Home()),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "scan".tr,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 350,
                width: 350,
                color: Colors.red,
                child: GetBuilder<ScanController>(
                  init: ScanController(),
                  builder: (controller) {
                    return controller.isCameraInitialized.value
                        ? Stack(
                            children: [
                              CameraPreview(controller.cameraController),
                            ],
                          )
                        : Center(child: Text("loading preview...".tr));
                  },
                ),
              ),
              Text(
                "image".tr,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue[600],
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                child: GetBuilder<ScanController>(
                  init: ScanController(),
                  builder: (controller) {
                    return Text(
                      controller.label,
                      style: TextStyle(color: Colors.black),
                    );
                  },
                ),
              ),
              Text(
                "water footprint".tr,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue[600],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
