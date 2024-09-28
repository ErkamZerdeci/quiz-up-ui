import 'package:flutter/material.dart';
import 'package:quiz_up_ui/src/views/test_page.dart';
import '../../providers/auth_view_model.dart';
import 'signup_page.dart'; // Import the signup page
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      } else if (value.length < 5) {
                        return 'Username must be at least 5 characters';
                      } else {
                        return null;
                      }
                    }),
                TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final response = await Provider.of<AuthViewModel>(context,
                            listen: false)
                        .login(
                            usernameController.text, passwordController.text);
                    if (response.statusCode == 200 && context.mounted) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TestPage()));
                    }
                  },
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SignupPage(),
                    ));
                  },
                  child: const Text('Don\'t have an account? Sign up'),
                ),
              ],
            ),
          )),
    );
  }
}
