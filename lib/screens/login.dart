import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toko_pertanian/screens/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Mengecek apakah pengguna sudah login sebelumnya
  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? storedEmail = prefs.getString('email');
    final String? storedPassword = prefs.getString('password');

    if (storedEmail != null && storedPassword != null) {
      // Pengguna sudah login, arahkan ke halaman dashboard
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> handleLogin() async {
    String email = emailController.text;
    String password = passwordController.text;

    // Simpan email dan password ke shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);

    // Arahkan pengguna ke halaman dashboard
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: handleLogin,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
