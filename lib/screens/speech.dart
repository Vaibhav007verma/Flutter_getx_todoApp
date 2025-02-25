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
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: _controller.askAudioPermission, child: Text("Ask Speech Permission")),
            Obx(() => Text(_controller.enable.value == true ? "speechToText is Initialized" : "speechToText not Initialized" )),
            ElevatedButton(
              onPressed: () async {
                if(_controller.show.value) {
                  await _controller.stopListen();
                } else {
                  await _controller.startListen();
                }
              },
              child: Obx(() => Text(_controller.show.value ? "Stop Listening" : "Tap to Start Listen")),
            ),
            Obx(() => Text(_controller.words.value)),





          ],
        ),
      ),
    );
  }
}





