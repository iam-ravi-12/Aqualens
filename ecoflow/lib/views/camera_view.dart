import 'package:camera/camera.dart';
import 'package:ecoflow/controller/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ScanController>(
          init: ScanController(),
          builder: (controller) {
            return controller.isCameraInitialized.value
                ? CameraPreview(controller.cameraController)
                : Center(child: Text("Loading Preview..."));
          }),
    );
  }
}
