import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/route_manager.dart';
import '../core/values.dart';
import '../core/controller.dart';

// ignore: must_be_immutable
class ValuesScreen extends StatelessWidget {
  List listOfValues = Get.put(Values()).valuesItems.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Values Screen"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _displayTextInputDialog(context);
            },
          )
        ],
      ),
      body: GetBuilder(
        init: Controller(),
        builder: (_) => Container(
          height: MediaQuery.of(context).size.height * 1,
          child: Get.find<Values>().values.length >= 1
              ? ListView.builder(
                  itemCount: Get.find<Values>().values.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Card(
                      elevation: 5,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          '"${Get.find<Values>().values[index].value}"',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.dancingScript(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    "Dodaj wartości",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

final _textFieldKey = GlobalKey<FormState>();
TextEditingController _textFieldController = new TextEditingController();

Future<void> _displayTextInputDialog(BuildContext context) async {
  var controller = Get.put(Controller());
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              title: Text('Add Value'),
              content: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(
                  key: _textFieldKey,
                  onEditingComplete: () {
                    if (_textFieldController.text != "") {
                      controller.addValue(_textFieldController.text);
                      Navigator.pop(context);
                      Get.snackbar(
                        "Success",
                        "Value \"${_textFieldController.text}\" was added to Values list",
                        snackPosition: SnackPosition.TOP,
                        duration: const Duration(seconds: 2),
                        colorText: Colors.white,
                        backgroundColor: Colors.grey[900],
                      );
                      _textFieldController.clear();
                    } else {
                      Navigator.pop(context);
                      Get.snackbar(
                        "Error",
                        "Text field can't be empty. Try again",
                        snackPosition: SnackPosition.TOP,
                        duration: const Duration(seconds: 3),
                        colorText: Colors.white,
                        backgroundColor: Colors.grey[900],
                      );
                    }
                  },
                  controller: _textFieldController,
                  decoration: InputDecoration(hintText: "Enter new Value here"),
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('Cancel'),
                  onPressed: () {
                    _textFieldController.clear();
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text('Add'),
                  onPressed: () {
                    if (_textFieldController.text != "") {
                      controller.addValue(_textFieldController.text);
                      Navigator.pop(context);
                      Get.snackbar(
                        "Success",
                        "Value \"${_textFieldController.text}\" was added to Values list",
                        snackPosition: SnackPosition.TOP,
                        duration: const Duration(seconds: 2),
                        colorText: Colors.white,
                        backgroundColor: Colors.grey[900],
                      );
                      _textFieldController.clear();
                    } else {
                      Navigator.pop(context);
                      Get.snackbar(
                        "Error",
                        "Text field can't be empty. Try again",
                        snackPosition: SnackPosition.TOP,
                        duration: const Duration(seconds: 3),
                        colorText: Colors.white,
                        backgroundColor: Colors.grey[900],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      });
}
