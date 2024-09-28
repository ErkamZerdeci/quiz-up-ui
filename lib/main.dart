import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_up_ui/src/providers/auth_view_model.dart';
import 'src/views/auth/login_page.dart';
import 'package:logging/logging.dart';

final Logger log = Logger('MyApp');

void main() {
  log.info("App Started");
  runApp(ChangeNotifierProvider(create: (context) => AuthViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(), // Set the home to the LoginPage
    );
  }
}