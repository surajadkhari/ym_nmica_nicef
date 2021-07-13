import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:unicef/application/cluster_list/cluster_list_bloc.dart';
import 'package:unicef/infrastructure/cluster/repositories/cluster_repository.dart';
import 'package:unicef/injection.dart';
import 'package:unicef/presentation/core/app_widget.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await Firebase.initializeApp();
  runApp(
    AppWidget(),
  );
}
