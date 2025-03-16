import 'package:flutter/material.dart';
import '../import/import.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/upnLogo.png',
                    width: 50,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Login untuk mengakses lebih banyak fitur',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: username,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(
                        Icons.person,
                        size: 24,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 24,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var userName = username.text;
                      var pass = password.text;
                      if (userName.isEmpty || pass.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Gagal! Lengkapi Username dan juga Password.',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Colors.red,
                            action: SnackBarAction(
                              label: 'Oke',
                              textColor: Colors.white,
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              },
                            ),
                          ),
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (c) => HomePage(
                              username: userName,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
