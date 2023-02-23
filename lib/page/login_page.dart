// packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// utils
import 'package:project_tutorial/util/firebase_auth.dart';

// pages
import 'package:project_tutorial/main.dart';
import 'package:project_tutorial/page/home_page.dart';
import 'package:project_tutorial/page/sign_up_page.dart';
import 'package:project_tutorial/page/reset_password.dart';

// widgets
import 'package:project_tutorial/widget/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser() {
    context.read<FirebaseAuthMethods>().loginWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
    if (context.read<FirebaseAuthMethods>().isLoggedIn()) {
      Navigator.of(context).push(
        // OR onPressed: () async { await Navigator.push(...);  await anyOtherMethod(); }
        MaterialPageRoute(
          builder: (BuildContext context) {
            return RootPage();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                controller: emailController,
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                controller: passwordController,
                hintText: 'Enter your password',
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: loginUser,
              child: const Text('Login'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(color: Colors.white),
                ),
                minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width / 2.5, 50),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                // OR onPressed: () async { await Navigator.push(...);  await anyOtherMethod(); }
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SignUpPage();
                  },
                ),
              ),
              child: const Text('Sign Up'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(color: Colors.white),
                ),
                minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width / 2.5, 50),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                // OR onPressed: () async { await Navigator.push(...);  await anyOtherMethod(); }
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return RestPasswordPage();
                  },
                ),
              ),
              child: const Text('Forgot Password?'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(color: Colors.white),
                ),
                minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width / 2.5, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
