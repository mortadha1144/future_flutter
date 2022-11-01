
import 'package:flutter/material.dart';
import 'package:future_flutter/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySign extends StatelessWidget {
  const MySign({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Sign(),
    );
  }
}

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  @override
  Widget build(BuildContext context) {
    String _email = '';
    String _password = '';

    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Email'),
              controller: _emailController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Password'),
              controller: _passwordController,
            ),
            ElevatedButton(
              onPressed: () async{
                SharedPreferences pref =await SharedPreferences.getInstance();
                pref.setString('email',_emailController.text);
                pref.setString('pass',_passwordController.text);

                
                
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const MyApp()));
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
