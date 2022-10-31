import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2), () => info(2)),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text(snapshot.hasData ? '${snapshot.data}' : 'Demo'),
          ),
          body: Center(
            child: snapshot.connectionState == ConnectionState.waiting
                ? const CircularProgressIndicator()
                : const Text('Done !'),
          ),
        );
      },
    );
  }
}
