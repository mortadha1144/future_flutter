import 'package:flutter/material.dart';
import 'package:future_flutter/shared_prefrences/another.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySaredPreferances extends StatefulWidget {
  const MySaredPreferances({super.key});

  @override
  State<MySaredPreferances> createState() => _MySaredPreferancesState();
}

class _MySaredPreferancesState extends State<MySaredPreferances> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    setData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Another(),
            ));
          },
          child: const Text('Go to another screen !'),
        ),
      ),
    );
  }
}

setData() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('name', 'ali');
  pref.setInt('age', 20);
  pref.setDouble('height', 170.5);
  pref.setBool('developer', true);
  pref.setStringList('skill', ['DART', 'FLUTTER']);
}
