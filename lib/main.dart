import 'package:flutter/material.dart';
import 'package:ziewnic_loyalty_points/components/constants.dart';
import 'package:ziewnic_loyalty_points/pages/authentication/forget_password/forget_password_page.dart';
import 'package:ziewnic_loyalty_points/pages/authentication/login/login_page.dart';
import 'package:ziewnic_loyalty_points/pages/authentication/registration/registration_page.dart';
import 'package:ziewnic_loyalty_points/pages/authentication/update_password/update_new_password.dart';
import 'package:ziewnic_loyalty_points/pages/authentication/update_password_confirm/update_password_confirm.dart';
import 'package:ziewnic_loyalty_points/pages/dashboard/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: false,
      ),
      home: const Dashboard(),
    );
  }
}
