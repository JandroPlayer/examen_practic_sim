import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:examen_practic_sim/screens/home_screen.dart';
import 'package:examen_practic_sim/fakeapi/fakeapi.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FakeApi _api = FakeApi();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _rememberMe = prefs.getBool('rememberMe') ?? false;
      if (_rememberMe) {
        _emailController.text = prefs.getString('email') ?? '';
        _passwordController.text = prefs.getString('password') ?? '';
      }
    });
  }

  Future<void> _login() async {
    final user = await _api.login(_emailController.text.trim(), _passwordController.text.trim());

    if (user != null) {
      if (_rememberMe) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('rememberMe', true);
        await prefs.setString('email', user.email);
        await prefs.setString('password', user.phone); // Simulant la contrasenya
      } else {
        final prefs = await SharedPreferences.getInstance();
        await prefs.clear();
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: Credencials incorrectes')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Iniciar Sessió')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Correu electrònic'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contrasenya'),
              obscureText: true,
            ),
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                ),
                Text('Recorda\'m'),
              ],
            ),
            ElevatedButton(
              onPressed: _login,
              child: Text('Iniciar Sessió'),
            ),
          ],
        ),
      ),
    );
  }
}
