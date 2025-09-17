import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// ❌ Code Smell: Long, unused comments and magic numbers
/// ❌ Code Smell: Duplicate methods and redundant logic
/// ❌ Code Smell: Dead code (unused functions)
/// ❌ Code Smell: Hardcoded strings instead of constants
/// ❌ Code Smell: Duplicate widgets

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ❌ Bad practice: Hardcoded theme color
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // ❌ Duplicate logic
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // ❌ Duplicate method doing the same thing (duplication)
  void _increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  // ❌ Dead code (never used anywhere)
  void _unusedMethod() {
    print("This is unused");
  }

  @override
  Widget build(BuildContext context) {
    // ❌ Bad practice: Inline duplicate widgets instead of reusing
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red, // hardcoded again
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),

            // Duplicate widget 1
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            // Duplicate widget 2 (exact same code, duplication)
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            // ❌ Magic number (instead of constant)
            SizedBox(height: 37),

            // ❌ Hardcoded repeated text
            const Text("Hello World"),
            const Text("Hello World"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // could be _increaseCounter too
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
