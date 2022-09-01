import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Label text',
                errorText: 'Error message',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.error,
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Label text',
                errorText: 'Error message',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.error,
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Label text',
                errorText: 'Error message',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.error,
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Label text',
                errorText: 'Error message',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.error,
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Label text',
                errorText: 'Error message',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.error,
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Label text',
                errorText: 'Error message',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.error,
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Label text',
                errorText: 'Error message',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.error,
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Label text',
                errorText: 'Error message',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.error,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
