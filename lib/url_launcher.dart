import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyUrlLauncher extends StatefulWidget {
  const MyUrlLauncher({super.key});

  @override
  State<MyUrlLauncher> createState() => _MyUrlLauncherState();
}

class _MyUrlLauncherState extends State<MyUrlLauncher> {
  String str = 'Get The Video!';
  var url = 'https://www.youtube.com/watch?v=IWRK48TyjGo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              await canLaunchUrlString(url)
                  ? await launchUrlString(url)
                  : throw 'Could Not Launch url';
            } catch (e) {
              setState(() {
                str = e.toString();
              });
            }
          },
          child: Text(str),
        ),
      ),
    );
  }
}
