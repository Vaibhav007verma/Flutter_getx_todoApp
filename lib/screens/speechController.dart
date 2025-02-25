import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechController extends GetxController {
  var speechToText = SpeechToText().obs;
  RxString words = ''.obs;
  RxBool enable = false.obs;

  RxBool show = false.obs;

  @override
  void onInit() {
    super.onInit();
    askAudioPermission();
  }

  void askAudioPermission() async {
    var status = await Permission.speech.request();

    if (status.isDenied) {
      print("Audio permission denied");

    } else if (status.isGranted) {
      enable.value = await speechToText.value.initialize();
      print("Audio permission Granted !, ${enable.value.toString()}");
      if (!enable.value) {
        print("Speech-to-text initialization failed");
      }

    } else if (status.isPermanentlyDenied) {
      print("Audio permission permanently denied. Please enable it in settings.");
      openAppSettings();
    }

  }

  void _result(SpeechRecognitionResult result) {
    words.value = result.recognizedWords;
  }

  Future<void> startListen() async {
    if (enable.value == true) {
      await speechToText.value.listen(onResult: _result);
      show.value = true;
    } else {
      print("Speech-to-text is not initialized.");

    }

  }

  Future<void> stopListen() async {
    await speechToText.value.stop();
    show.value = false;
  }

}
