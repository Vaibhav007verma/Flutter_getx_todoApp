import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';


class Speech extends StatefulWidget {
  const Speech({super.key});

  @override
  State<Speech> createState() => _SpeechState();
}

class _SpeechState extends State<Speech> {

  SpeechToText _speechToText = SpeechToText();
  String words = "";
  bool _enable = false;


  @override
  void initState(){
    super.initState();
    askAudio();
  }

  void askAudio() async {
    var per = await Permission.audio.request();
    if(per.isDenied) {
      await Permission.audio.request();
    }
    _enable = await _speechToText.initialize();
    setState(() { });
  }


  void _result(SpeechRecognitionResult result) async {
    setState(() {
      words = result.recognizedWords;
    });
  }

  void startListen() async {
    await _speechToText.listen(onResult: _result);
    setState(() { });
  }

  void stopListen() async {
    await _speechToText.stop();
    setState(() { });
  }





  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Speech To Text"),),
      body: Column(
        children: [
          Text(words),
          Text(_enable ? "Enabled" : "not enabled" ),
          ElevatedButton(
            onPressed: _speechToText.isListening ? stopListen : startListen,
            child: Text(_speechToText.isListening ? "stopListen" : "Tap to Start Listen"),
          )
        ],
      ),
    );
  }
}