import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halloween Storybook',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(title: 'Halloween Storybook'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    
                  },
                  child: const Text('I\'m feeling brave.'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    
                  },
                  child: const Text('Absolutely not.'),
                )
              ],
            ),
          ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("scaryhouse.jpg"), fit: BoxFit.cover,),
            ),
          ),
          const Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 20.0), // Adjust top padding as needed
            child: Text(
              'ENTER... IF YOU DARE',
              style: TextStyle(fontSize: 40, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ]
      ),
    );
  }
}
