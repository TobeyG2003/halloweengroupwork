import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:math';
import 'dart:async';

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
  double _left = 0;
  double _top = 0;
  double _left2 = 0;
  double _top2 = 0;
  final _random = Random();

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
    await _audioPlayer.setLoopMode(LoopMode.one);

    Timer.periodic(const Duration(seconds: 1), (timer) {
      _moveImage();
    });
  }

  void _moveImage() {
    setState(() {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;
      _left = _random.nextDouble() * (screenWidth - 100);
      _top = _random.nextDouble() * (screenHeight - 100);
      _left2 = _random.nextDouble() * (screenWidth - 100);
      _top2 = _random.nextDouble() * (screenHeight - 100);
    });
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
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const BravePage(),
                  ),
                );
              },
              child: const Text('I\'m feeling brave.'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const Leave(),
                  ),
                );
              },
              child: const Text('Absolutely not.'),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("scaryhouse.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            left: _left,
            top: _top,
            child: Image.asset(
              'bat.png',
              width: 100,
              height: 100,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            left: _left2,
            top: _top2,
            child: Image.asset(
              'bat.png',
              width: 100,
              height: 100,
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'ENTER... IF YOU DARE',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class Leave extends StatefulWidget {
  const Leave({super.key});

  @override
  State<Leave> createState() => _Leave();
}

class _Leave extends State<Leave> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halloween Storybook'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) =>
                        const MyHomePage(title: 'Halloween Storybook'),
                  ),
                );
              },
              child: const Text('I\'m gonna go back.'),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("sunrise.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Congratulations! You survived.',
                style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 244, 225, 54),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 4),
              curve: Curves.easeIn,
              child: const Text(
                'You are smarter than most horror movie characters by just leaving...',
                style: TextStyle(
                    fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class BravePage extends StatefulWidget {
  const BravePage({super.key});

  @override
  State<BravePage> createState() => _BravePageState();
}

class _BravePageState extends State<BravePage> {
  double _pumpkinLeft = 0;
  double _pumpkinTop = 0;
  double _ghostLeft = 0;
  double _ghostTop = 0;
  final _random = Random();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _moveImages();
    });
  }

  void _moveImages() {
    setState(() {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;
      _pumpkinLeft = _random.nextDouble() * (screenWidth - 100);
      _pumpkinTop = _random.nextDouble() * (screenHeight - 100);
      _ghostLeft = _random.nextDouble() * (screenWidth - 100);
      _ghostTop = _random.nextDouble() * (screenHeight - 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halloween Storybook'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const PumpkinWin(),
                  ),
                );
              },
              child: const Text('Choose Pumpkin'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const GhostJumpscare(),
                  ),
                );
              },
              child: const Text('Choose Ghost'),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('hauntedhouse.jpg'), fit: BoxFit.cover),
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Welcome to the foyer. Choose wisely...',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            left: _pumpkinLeft,
            top: _pumpkinTop,
            child: Image.asset(
              'pumpkin.png',
              width: 100,
              height: 100,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            left: _ghostLeft,
            top: _ghostTop,
            child: Image.asset(
              'ghost.png',
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}

// pumpkin
class PumpkinWin extends StatefulWidget {
  const PumpkinWin({super.key});

  @override
  State<PumpkinWin> createState() => _PumpkinWinState();
}

class _PumpkinWinState extends State<PumpkinWin> {
  late AudioPlayer _audioPlayer;
    @override
    void initState() {
      super.initState();
      _audioPlayer = AudioPlayer();
      _playScareSound();
  }
  Future<void> _playScareSound() async {
    await _audioPlayer.setAudioSource(
      AudioSource.asset('assets/youwin.mp3'), 
    );
    _audioPlayer.play();
  }
  @override
  void dispose() {
    _audioPlayer.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halloween Storybook')),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: 'Halloween Storybook'),
                  ),
                  (route) => false, // removes all previous routes
                );
              },
              child: const Text('Go Home'),

            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/hauntedhouse.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Congrats! You Survived.',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Center(
            child: Text(
              'You are safe. For now..',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// jumpscare
class GhostJumpscare extends StatefulWidget {
  const GhostJumpscare({super.key});

  @override
  State<GhostJumpscare> createState() => _GhostJumpscareState();
}

class _GhostJumpscareState extends State<GhostJumpscare> {
    late AudioPlayer _audioPlayer;
    @override
    void initState() {
      super.initState();
      _audioPlayer = AudioPlayer();
      _playScareSound();
  }
  Future<void> _playScareSound() async {
    await _audioPlayer.setAudioSource(
      AudioSource.asset('assets/jumpscare.mp3'), 
    );
    _audioPlayer.play();
  }
  @override
  void dispose() {
    _audioPlayer.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halloween Storybook')),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // back to foyer
              },
              child: const Text('Let me try again...'),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/scaryghost.png'), fit: BoxFit.cover),
            ),
          ),
          const Center(
            child: Text(
              'Oh No! The ghost found you.',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
