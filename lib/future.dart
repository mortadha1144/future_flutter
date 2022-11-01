import 'package:flutter/material.dart';

class MyFutureBuilder extends StatefulWidget {
   const MyFutureBuilder(this.info,{super.key});

  final Function(int) info;

  @override
  State<MyFutureBuilder> createState() => _MyFutureBuilderState();
}

class _MyFutureBuilderState extends State<MyFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2), () => widget.info(2)),
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
