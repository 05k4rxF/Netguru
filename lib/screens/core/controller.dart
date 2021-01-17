import 'package:get/get.dart';
import './values.dart';
import 'dart:math';
import 'dart:async';

class Controller extends GetxController {
  Timer timer;
  String currentValueText = Get.put(Values()).valuesItems[0].value;
  var valueFav = Get.put(Values()).valuesItems[0].isFav;

  void selectRandomValue() {
    // timer = new Timer.periodic(new Duration(seconds: 5), (time) {
    var values = Get.put(Values()).valuesItems;
    final _random = new Random();
    var randNumber = _random.nextInt(values.length);
    currentValueText = values[randNumber].value;
    valueFav = values[randNumber].isFav;
    update();
    // });
  }

  changeFav() {
    var currentIndex = Get.put(Values())
        .values
        .indexWhere((element) => element.value == currentValueText);
    Get.find<Values>().values[currentIndex].isFav = !valueFav;
    valueFav = !valueFav;
    update();
  }

  addValue(a) {
    Get.find<Values>().addValue(a);
    update();
  }

  // @override
  // void onReady() {
  //   startTimer();
  //   super.onReady();
  // }
}
