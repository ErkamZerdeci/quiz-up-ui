import 'package:flutter/material.dart';
import 'package:quiz_up_ui/src/utils/utils.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Menu'), automaticallyImplyLeading: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/play');
              },
              child: const Text('Play'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: const Text('Profile'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _logout(context);
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    deleteToken();
    Navigator.pushReplacementNamed(context, '/login'); 
  }
}
