// import 'package:flutter/material.dart';
// import 'package:location/location.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String locationMessage = '';

//   Future<void> _getLocation() async {
//     Location location = Location();

//     bool serviceEnabled;
//     PermissionStatus permission;

//     serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//       if (!serviceEnabled) {
//         return;
//       }
//     }

//     permission = await location.hasPermission();
//     if (permission == PermissionStatus.denied) {
//       permission = await location.requestPermission();
//       if (permission == PermissionStatus.deniedForever) {
//         return;
//       }
//     }

//     if (permission == PermissionStatus.granted) {
//       LocationData locationData = await location.getLocation();

//       setState(() {
//         locationMessage =
//             'Latitude: ${locationData.latitude}, Longitude: ${locationData.longitude}';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Location'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               locationMessage,
//               style: const TextStyle(fontSize: 20),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _getLocation,
//               child: const Text('Get Location'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
