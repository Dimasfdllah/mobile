import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.only(top: 100, bottom: 100),
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login To Food Shop",
                style: GoogleFonts.poppins(fontSize: 25, color: Colors.white),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 60)),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20.0),
              Material(
                color: Color.fromRGBO(136, 92, 227, 1.0),
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  // splashColor: Colors.white,
                  onTap: () {
                    String username = usernameController.text;
                    String password = passwordController.text;
                    if (username == 'user' && password == 'ifapagi') {
                      // Reset pesan error
                      setState(() {
                        errorMessage = '';
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    } else {
                      setState(() {
                        errorMessage = 'Username atau password salah';
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ),

                  // child: const Text('Login'),
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
