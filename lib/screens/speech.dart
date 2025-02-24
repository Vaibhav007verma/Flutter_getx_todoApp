import 'package:flutter/material.dart';
import 'package:getx_todo/screens/speechController.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:get/get.dart';


class Speech extends StatefulWidget {
  const Speech({super.key});

  @override
  State<Speech> createState() => _SpeechState();
}

class _SpeechState extends State<Speech> {

SpeechController _controller = Get.put(SpeechController());


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Speech To Text"),),
      body: Column(
        children: [
          ElevatedButton(onPressed: _controller.askAudio, child: Text("ASK aUDIO")),
          Text(_controller.words.value),
          Text(_controller.enable.value ? "Enabled" : "not enabled" ),
          ElevatedButton(
            onPressed: _controller.speechToText.value.isListening ? _controller.stopListen : _controller.startListen,
            child: Text(_controller.speechToText.value.isListening ? "stopListen" : "Tap to Start Listen"),
          )
        ],
      ),
    );
  }
}





