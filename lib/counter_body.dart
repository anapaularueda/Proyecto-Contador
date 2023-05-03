import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CounterBody extends StatelessWidget {
  const CounterBody({
    super.key,
    required this.counter,
    required this.incrementCounter,
    required this.decrementCounter,
    required this.resetCounter,
  });

  final int counter;

  final void Function() incrementCounter;
  final void Function() decrementCounter;
  final void Function() resetCounter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              style: GoogleFonts.bebasNeue(
                fontSize: 24,
                color: Colors.blueGrey,
              ),
              'Te invito a jugar con el contador'),
          const SizedBox(height: 20),
          Text(
            style: GoogleFonts.ibmPlexMono(
              fontSize: 62,
              color: Colors.grey,
            ),
            '$counter',
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.lightBlueAccent)),
                    onPressed: incrementCounter,
                    child: const Text('Incrementar')),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.lightGreen)),
                    onPressed: resetCounter,
                    child: const Icon(Icons.restart_alt_rounded)),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.pink)),
                    onPressed: decrementCounter,
                    child: const Text('Decrementar')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
