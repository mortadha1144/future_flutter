import 'package:flutter/material.dart';

class MyStreamBuilder extends StatefulWidget {
  const MyStreamBuilder({super.key});

  @override
  State<MyStreamBuilder> createState() => _MyStreamBuilderState();
}

class _MyStreamBuilderState extends State<MyStreamBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 2), (a) => a),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text((snapshot.hasData && snapshot.data! < 10)
                ? '${snapshot.data}'
                : 'Demo'),
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
