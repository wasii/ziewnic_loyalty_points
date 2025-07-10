import 'package:flutter/material.dart';
import 'package:ziewnic_loyalty_points/components/constants.dart';
import 'package:ziewnic_loyalty_points/pages/authentication/login/login_page.dart';
import 'package:ziewnic_loyalty_points/pages/dashboard/loyalty_rewards/loyalty_rewards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ziewnic Loyalty Program',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: false,
      ),
      home: const LoginPage(),
    );
  }
}
