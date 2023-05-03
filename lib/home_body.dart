import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
    required this.isDark,
    required this.onSwitchChanged,
  });

  final bool isDark;
  final void Function(bool currentValue) onSwitchChanged;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: widget.isDark
              ? const AssetImage('images/darkHome.jpg')
              : const AssetImage('images/lightHome.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(children: [
            Text(
                style: GoogleFonts.bebasNeue(
                  fontSize: 30,
                  color: Colors.pinkAccent,
                ),
                '¡Bienvenido a este contador!'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Cambio de tema:'),
                Switch(
                  value: widget.isDark,
                  onChanged: widget.onSwitchChanged,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('images/hi.gif'),
            ),
          ]),
          RichText(
            text: const TextSpan(
                text: 'Desarrollado por ',
                style: TextStyle(color: Colors.grey),
                children: [
                  TextSpan(
                    text: 'Ana Rueda',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
