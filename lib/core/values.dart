import 'package:get/get_state_manager/src/simple/list_notifier.dart';

class Value {
  final int id;
  final String value;
  bool isFav;

  Value({
    this.id,
    this.value,
    this.isFav,
  });
}

class Values with ListNotifier {
  final List<Value> values = [
    Value(
      id: 1,
      value: "Exceed clients' and colleagues' expectations",
      isFav: false,
    ),
    Value(
      id: 2,
      value:
          "Take ownership and question the status quo in a constructive manner",
      isFav: false,
    ),
    Value(
      id: 3,
      value:
          "Be brave, curious and experiment. Learn from all successes and failures",
      isFav: false,
    ),
    Value(
      id: 4,
      value: "Act in a way that makes all of us proud",
      isFav: false,
    ),
    Value(
      id: 5,
      value: "Build an inclusive, transparent and socially responsible culture",
      isFav: false,
    ),
    Value(
      id: 6,
      value: "Be ambitious, grow yourself and the people around you",
      isFav: false,
    ),
    Value(
      id: 7,
      value: "Recognize excellence and engagement",
      isFav: false,
    ),
  ];
  List<Value> get valuesItems {
    return [...values];
  }

  List<Value> isFav() {
    return values.where((val) => val.isFav == true).toList();
  }

  void addValue(a) {
    values.add(Value(id: values.length + 1, value: "$a", isFav: false));
  }
}
