import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: SimpleButtons(),
    debugShowCheckedModeBanner: false,
  ));
}

class SimpleButtons extends StatefulWidget {
  const SimpleButtons({super.key});

  @override
  SimpleButtonsState createState() => SimpleButtonsState();
}

class SimpleButtonsState extends State<SimpleButtons> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    print('initState');
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    print('dispose');
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xylophone"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 1; i <= 7; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => audioPlayer.play(UrlSource('assets/note$i.wav')),
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.primaries[i],
                    ),
                    child: Center(
                      child: Text(
                        'Note $i',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
