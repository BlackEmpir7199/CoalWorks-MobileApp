// import 'dart:async';
// import 'dart:io';
// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:record/record.dart';

// class EmergencyAlertSplashScreen extends StatefulWidget {
//   @override
//   _EmergencyAlertSplashScreenState createState() => _EmergencyAlertSplashScreenState();
// }

// class _EmergencyAlertSplashScreenState extends State<EmergencyAlertSplashScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _scaleController;
//   late AnimationController _rotationController;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _opacityAnimation;

//   bool _isRecording = false;
//   AudioPlayer _audioPlayer = AudioPlayer();
//   Record _recorder = Record();
//   String? _currentFilePath;
//   List<String> _recordings = [];

//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   @override
//   void initState() {
//     super.initState();
//     _initializeAnimations();
//     _fetchRecordings();
//     _initializeNotifications();
//   }

//   void _initializeAnimations() {
//     _scaleController = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..forward();

//     _rotationController = AnimationController(
//       duration: const Duration(seconds: 5),
//       vsync: this,
//     )..repeat();

//     _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _scaleController,
//         curve: Curves.elasticOut,
//       ),
//     );

//     _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _scaleController,
//         curve: Curves.easeIn,
//       ),
//     );
//   }

//   Future<void> _initializeNotifications() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     final IOSInitializationSettings initializationSettingsIOS =
//         IOSInitializationSettings();
//     final InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   Future<void> _fetchRecordings() async {
//     final directory = await getApplicationDocumentsDirectory();
//     final files = directory.listSync().where((file) => file.path.endsWith('.m4a'));
//     setState(() {
//       _recordings = files.map((e) => e.path).toList();
//     });
//   }

//   void _cancelAlert() {
//     Navigator.of(context).pop();
//     _showNotification('Alert Cancelled', 'Emergency alert has been cancelled');
//   }

//   Future<void> _startRecording() async {
//     if (await _recorder.hasPermission()) {
//       final directory = await getApplicationDocumentsDirectory();
//       final filePath =
//           "${directory.path}/recording_${DateTime.now().millisecondsSinceEpoch}.m4a";

//       await _recorder.start(path: filePath);

//       setState(() {
//         _currentFilePath = filePath;
//         _isRecording = true;
//       });
//     } else {
//       _showNotification('Permission Denied', 'Please grant microphone permissions.');
//     }
//   }

//   Future<void> _stopRecording() async {
//     if (_isRecording && _currentFilePath != null) {
//       final path = await _recorder.stop();
//       setState(() {
//         _isRecording = false;
//         if (path != null) {
//           _recordings.add(path);
//         }
//       });
//     }
//   }

//   void _playRecording(String path) {
//     _audioPlayer.play(DeviceFileSource(path));
//   }

//   Future<void> _showNotification(String title, String body) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'emergency_alert_channel',
//       'Emergency Alerts',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: false,
//     );
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       platformChannelSpecifics,
//     );
//   }

//   @override
//   void dispose() {
//     _scaleController.dispose();
//     _rotationController.dispose();
//     _audioPlayer.dispose();
//     _recorder.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black.withOpacity(0.9),
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.list, color: Colors.white),
//             onPressed: () async {
//               await _fetchRecordings();
//               showModalBottomSheet(
//                 context: context,
//                 builder: (context) {
//                   return ListView.builder(
//                     itemCount: _recordings.length,
//                     itemBuilder: (context, index) {
//                       final path = _recordings[index];
//                       return ListTile(
//                         title: Text(
//                           path.split('/').last,
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         trailing: IconButton(
//                           icon: Icon(Icons.play_arrow, color: Colors.green),
//                           onPressed: () => _playRecording(path),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//       body: AnimatedBuilder(
//         animation: _scaleController,
//         builder: (context, child) {
//           return Transform.scale(
//             scale: _scaleAnimation.value,
//             child: Opacity(
//               opacity: _opacityAnimation.value,
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         AnimatedBuilder(
//                           animation: _rotationController,
//                           builder: (_, child) {
//                             return Transform.rotate(
//                               angle: _rotationController.value * 2 * math.pi,
//                               child: child,
//                             );
//                           },
//                           child: Container(
//                             width: 250,
//                             height: 250,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(color: Colors.red, width: 8),
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onLongPressStart: (_) => _startRecording(),
//                           onLongPressEnd: (_) => _stopRecording(),
//                           child: Icon(
//                             _isRecording ? Icons.mic : Icons.mic_none,
//                             size: 120,
//                             color: Colors.red,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 30),
//                     ElevatedButton(
//                       onPressed: _cancelAlert,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.redAccent,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 50, vertical: 15),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30)),
//                       ),
//                       child: Text(
//                         'Cancel Alert',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

