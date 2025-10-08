import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart';
import '../models/user.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _login() {
    String u = usernameController.text;
    String p = passwordController.text;

    bool found = users.any((usr) => usr.username == u && usr.password == p);

    if (found) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Username atau Password salah")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ Logo aplikasi (pastikan ada di assets/images/logo.png)
              Image.asset(
                "assets/images/f.png",
                width: 250,
                height: 250,
              ),
              const SizedBox(height: 50),

              TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder())),
              const SizedBox(height: 10),
              TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder())),
              const SizedBox(height: 20),

              ElevatedButton(onPressed: _login, child: const Text("Login")),
              TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const RegisterPage())),
                child: const Text("Belum punya akun? Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
