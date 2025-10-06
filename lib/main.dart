import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

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

  late AudioPlayer _audioPlayer;

  @override
  void initState() {
      super.initState();
      _audioPlayer = AudioPlayer();
      _initAudioPlayer();
    }
  Future<void> _initAudioPlayer() async {
    await _audioPlayer.setAudioSource(
      AudioSource.asset('assets/halloweennoise.mp3'),
    );
    // Automatically play the audio after setting the source
    _audioPlayer.play();
  }
  

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
                    /*Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => const Interior(),
                              ),
                            );
                  */
                  },
                  child: const Text('I\'m feeling brave.'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    /*Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => const Leave(),
                              ),
                            );
                  */},
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
