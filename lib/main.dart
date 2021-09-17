import 'package:connectivity/connectivity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:unicef/injection.dart';
import 'package:unicef/presentation/core/app_widget.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message");
}

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);

  await Firebase.initializeApp();
  var connection = await Connectivity().checkConnectivity();
  if (connection != ConnectivityResult.none) {
    await FirebaseMessaging.instance.subscribeToTopic('all');
  }
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  runApp(
    AppWidget(),
  );
}

DatabaseReference userRefs =
    FirebaseDatabase.instance.reference().child('users');
