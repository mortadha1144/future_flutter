import 'package:flutter/material.dart';
//import 'package:future_flutter/shared_prefrences/shared_prefrences.dart';
import 'package:future_flutter/shared_prefrences/sign.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'package:url_launcher/url_launcher_string.dart';
//import 'package:future_flutter/future.dart';
//import 'package:future_flutter/stream.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var email = pref.get('email');
  var pass = pref.get('pass');

  runApp(email != null && pass != null ? const MyApp() : const MySign());
}

int info(int a) {
  return a;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main')),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
