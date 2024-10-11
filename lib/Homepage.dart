import 'package:flutter/material.dart';
import 'package:prog_john/profilePage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const profilePage(),
                ),
              );
            },
            icon: const Icon(Icons.person_3_outlined),
          ),
        ],
      ),
    );
  }
}
