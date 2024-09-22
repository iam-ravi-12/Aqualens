import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class ScanController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initCamera();
    initTFlite();
  }

  @override
  void dispose() {
    if (cameraController != null && cameraController.value.isInitialized) {
      cameraController.dispose();
    }
    Tflite.close();
    super.dispose();
  }

  late CameraController cameraController;
  late List<CameraDescription> cameras;

  var isCameraInitialized = false.obs;
  var cameraCount = 0;

  // var x, y, w, h = 0.0;
  var label = "";

  initCamera() async {
    if (await Permission.camera.request().isGranted) {
      cameras = await availableCameras();
      cameraController = CameraController(
        cameras[0],
        ResolutionPreset.medium,
        imageFormatGroup: ImageFormatGroup.yuv420,
      );
      await cameraController.initialize().then((value) {
        cameraController.startImageStream((image) {
          cameraCount++;
          if (cameraCount % 30 == 0) {
            cameraCount = 0;
            objectDetector(image);
          }
          update();
        });
      });
      isCameraInitialized(true);
      update();
    } else {
      log("Camera Permission Denied");
    }
  }

  // initTFlite() async {
  //   await Tflite.loadModel(
  //     model: "assets/model/model.tflite",
  //     labels: "assets/model/labels.txt",
  //     isAsset: true,
  //     numThreads: 1,
  //     useGpuDelegate: false,
  //   );
  // }

  // objectDetector(CameraImage image) async {
  //   var detector = await Tflite.runModelOnFrame(
  //     bytesList: image.planes.map((e) {
  //       return e.bytes;
  //     }).toList(),
  //     asynch: true,
  //     imageHeight: image.height,
  //     imageWidth: image.width,
  //     imageMean: 127.5,
  //     imageStd: 127.5,
  //     numResults: 1,
  //     rotation: 90,
  //     threshold: 0.4,
  //   );

  //   if (detector != null) {
  //     log("Result is $detector");
  //   }
  // }

  initTFlite() async {
    try {
      var result = await Tflite.loadModel(
        model: "assets/model/model.tflite",
        labels: "assets/model/labels.txt",
        isAsset: true,
        numThreads: 1,
        useGpuDelegate: false,
      );
      if (result != null) {
        log("Model loaded successfully: $result "); //$result
        var labels = await Tflite.loadModel(
          model: "assets/model/model.tflite",
        );
        log("loaded labels: $labels");
      }
    } catch (e) {
      log("Error loading model: $e");
    }
  }

  objectDetector(CameraImage image) async {
    try {
      // log("Image height: ${image.height}, Image width: ${image.width}");

      var detector = await Tflite.runModelOnFrame(
        bytesList: image.planes.map((e) => e.bytes).toList(),
        asynch: true,
        imageHeight: image.height,
        imageWidth: image.width,
        imageMean: 0,
        imageStd: 255.0,
        numResults: 5,
        rotation: 90, // Ensure rotation matches the camera orientation
        threshold: 0.1,
      );

      if (detector != null && detector.isNotEmpty) {
        log("Raw detector result: $detector");
        for (var detection in detector) {
          var firstDetection = detector.first;

          var confidence = firstDetection['confidence'];
          log("Detected: $label with confidence: ${(confidence * 100).toStringAsFixed(2)}%");
        }
      } else {
        log("No detection made.");
      }
    } catch (e) {
      log("Error in object detection: $e");
    }

    // Ensure you're accessing the first result in the detector list

    //     var label = firstDetection['label'];

    //     if (confidence != null && label != null) {
    //       log("Detected object: $label with confidence: ${confidence * 100}%");
    //     } else {
    //       log("No valid detection made.");
    //     }
    //   } else {
    //     log("No detection made.");
    //   }
    // } catch (e) {
    //   log("Error in object detection: $e");
    // }
  }
}
