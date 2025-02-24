import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechController extends GetxController{
  var speechToText = SpeechToText().obs;
  RxString words = ''.obs;
  RxBool enable = false.obs ;


  @override
  void onInit() {
    super.onInit();
    askAudio();
  }

  void askAudio() async {
    var per = await Permission.audio.request();
    if (per.isDenied) {
      // Handle permission denial (e.g., show a dialog or re-request)
      await Permission.audio.request();  // This is usually redundant, handle it better
    } else if (per.isGranted) {
      // Permission granted, now initialize speech-to-text
      enable.value = await speechToText.value.initialize();
    } else {
      // Handle the case where permission is permanently denied (user has denied and checked "Don't ask again")
      print("Permission permanently denied");
    }
  }



  void _result(SpeechRecognitionResult result) async {
      words.value = result.recognizedWords;
  }


  void startListen() async {
    await speechToText.value.listen(onResult:  _result);
  }

  void stopListen() async {
    await speechToText.value.stop();
  }





}