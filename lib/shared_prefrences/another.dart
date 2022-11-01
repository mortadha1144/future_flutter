import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Another extends StatefulWidget {
  const Another({super.key});

  @override
  State<Another> createState() => _AnotherState();
}

class _AnotherState extends State<Another> {
  String _name = '';
  int _age = 0;
  double _height = 0.0;
  bool _developer = false;
  List<String> _skill = ['', ''];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    deleteData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Another Screen')),
      body: Center(
        child: DefaultTextStyle(
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Name: $_name'),
              Text('Age: $_age'),
              Text('Height: $_height'),
              Text('Developer: $_developer'),
              Text('Skill 1: ${_skill[0]}'),
              Text('Skill 2: ${_skill[1]}'),
              ElevatedButton(
                onPressed: () async {
                  await getData();
                },
                child: const Text('Get Data'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  await deleteData();
                },
                child: const Text('Remove Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _name = pref.getString('name') ?? '';
      _age = pref.getInt('age') ?? 0;
      _height = pref.getDouble('height') ?? 0.0;
      _developer = pref.getBool('developer') ?? false;
      _skill = pref.getStringList('skill') ?? ['', ''];
    });
  }

  deleteData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.remove('name');
    pref.remove('age');
    pref.remove('height');
    pref.remove('developer');
    pref.remove('skill');
  }
}
