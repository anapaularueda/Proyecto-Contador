import 'package:flutter/material.dart';
import 'package:modulo1_proyecto/settings_body.dart';

import 'counter_body.dart';
import 'home_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: _getThemeMode(),
      home: MyHomePage(
        title: 'Counter App',
        onSwitchChanged: _onSwitchChanged,
        isDark: isDark,
      ),
    );
  }

  ThemeMode _getThemeMode() {
    if (isDark) return ThemeMode.dark;

    return ThemeMode.light;
  }

  void _onSwitchChanged(bool currentValue) {
    setState(() {
      isDark = currentValue;
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.onSwitchChanged,
    required this.isDark,
  });

  final String title;
  final void Function(bool currentValue) onSwitchChanged;
  final bool isDark;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  int addition = 1;
  int index = 0;
  TextEditingController counterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0x00ffffff),
        elevation: 0,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.timer_rounded,
            ),
            label: 'Contador',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_rounded,
            ),
            label: 'Configuración',
          ),
        ],
      ),
      body: Builder(builder: (context) {
        if (index == 0) {
          return HomeBody(
            isDark: widget.isDark,
            onSwitchChanged: widget.onSwitchChanged,
          );
        } else if (index == 1) {
          return CounterBody(
              counter: counter,
              incrementCounter: _incrementCounter,
              decrementCounter: _decrementCounter,
              resetCounter: _resetCounter);
        } else if (index == 2) {
          return SettingsBody(
            onCounterChanged: _onCounterChanged,
          );
        } else {
          return HomeBody(
            isDark: widget.isDark,
            onSwitchChanged: widget.onSwitchChanged,
          );
        }
      }),
    );
  }

  void _incrementCounter() {
    setState(() {
      counter += addition;
    });
  }

  void _decrementCounter() {
    setState(() {
      counter -= addition;
    });
  }

  void _resetCounter() {
    setState(() {
      counter = 0;
      addition = 1;
    });
  }

  void _onCounterChanged(int newValue) {
    setState(() {
      counter = newValue;
      addition = newValue;
    });
  }
}
