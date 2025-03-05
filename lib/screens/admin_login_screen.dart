import 'package:flutter/material.dart';

import 'add_job_screen.dart';

class AdminLoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل دخول المسؤول'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'اسم المستخدم'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'كلمة المرور'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_usernameController.text == 'boss' &&
                    _passwordController.text == '12345') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => AddJobScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('اسم المستخدم أو كلمة المرور غير صحيحة')),
                  );
                }
              },
              child: const Text('تسجيل الدخول'),
            ),
          ],
        ),
      ),
    );
  }
}
