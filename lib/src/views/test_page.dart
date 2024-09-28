import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_up_ui/main.dart';
import 'package:quiz_up_ui/src/providers/auth_view_model.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
          onPressed: () async {
            final response =
                await Provider.of<AuthViewModel>(context, listen: false).test();
            if (response.statusCode == 200 && context.mounted) {
              log.info(response.data);
            }
          },
          child: const Text('TEST')),
    );
  }
}
