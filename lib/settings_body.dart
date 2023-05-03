import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class SettingsBody extends StatefulWidget {
  final void Function(int) onCounterChanged;

  const SettingsBody({super.key, required this.onCounterChanged});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  TextEditingController counterController = TextEditingController();

  void _onIncrementPressed() {
    int newValue = int.tryParse(counterController.text) ?? 0;
    widget.onCounterChanged(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
              textAlign: TextAlign.justify,
              style: GoogleFonts.oswald(
                fontSize: 20,
                color: Colors.pinkAccent,
              ),
              'Ingresa el valor cuyos multiplos quieres ver reflejados en el contador:'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 20.0),
          child: TextField(
            controller: counterController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ingresa un número',
            ),
          ),
        ),
        ElevatedButton(
            onPressed: _onIncrementPressed, child: const Text('Cambiar'))
      ],
    );
  }
}
