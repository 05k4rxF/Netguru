import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:netguru/theme/theme.dart';
import './fav_screen.dart';
import './values_screen.dart';
import '../core/controller.dart';

goToFavourites() {
  Get.to(
    Favourites(),
    transition: Transition.rightToLeft,
    duration: const Duration(milliseconds: 300),
  );
}

goToValues() {
  Get.to(
    ValuesScreen(),
    transition: Transition.leftToRight,
    duration: const Duration(milliseconds: 300),
  );
}

var controller = Get.put(Controller());
var i = 1;
// Timer timer2;
// void startTimer2() {
//   timer2 = new Timer.periodic(new Duration(seconds: 1), (time) {
//     i++;
//     print("Sekundy:" + i.toString());
//   });
// }

// ignore: must_be_immutable
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  double startPos = -1.0;
  double endPos = 0.0;
  Curve curve = Curves.elasticOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.dark.primaryColor,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          _displayTextInputDialog(context);
        },
      ),
      appBar: AppBar(
        title: Text("NG Values", style: GoogleFonts.raleway()),
        actions: [
          GetBuilder<Controller>(
            init: Controller(),
            builder: (value) => IconButton(
                icon: Icon(controller.valueFav
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  controller.changeFav();
                }),
          )
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      body: Center(
        child: GetBuilder<Controller>(
          init: Controller(),
          builder: (value) => TweenAnimationBuilder(
            builder: (context, offset, child) {
              return FractionalTranslation(
                translation: offset,
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: child,
                  ),
                ),
              );
            },
            onEnd: () {
              if (i <= 1) {
                i++;
              } else if (i == 2) {
                setState(() {
                  controller.selectRandomValue();
                });
                i = 1;
              }
              Future.delayed(
                Duration(milliseconds: 500),
                () {
                  curve = curve == Curves.elasticOut
                      ? Curves.elasticIn
                      : Curves.elasticOut;
                  if (startPos == -1) {
                    setState(() {
                      startPos = 0.0;
                      endPos = 1.0;
                    });
                  } else {
                    setState(() {
                      startPos = -1.0;
                      endPos = 0.0;
                    });
                  }
                },
              );
            },
            tween: Tween<Offset>(
              begin: Offset(startPos, 0),
              end: Offset(endPos, 0),
            ),
            duration: Duration(seconds: 2),
            curve: curve,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                '"${value.currentValueText}"',
                textAlign: TextAlign.center,
                style: GoogleFonts.dancingScript(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _bottomNavigationBar() => SafeArea(
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 26),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RawMaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.all(new Radius.circular(50)),
              ),
              splashColor: AppTheme.dark.splashColor,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.format_quote,
                      color: AppTheme.dark.primaryColor,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      "Values",
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              onPressed: () {
                goToValues();
              },
            ),
            RawMaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.all(new Radius.circular(50)),
              ),
              splashColor: AppTheme.dark.splashColor,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: AppTheme.dark.primaryColor,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      "Favourites",
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              onPressed: () {
                goToFavourites();
              },
            ),
          ],
        ),
      ),
    );

final _textFieldKey = GlobalKey<FormState>();
TextEditingController _textFieldController = new TextEditingController();

Future<void> _displayTextInputDialog(BuildContext context) async {
  var controller = Get.put(Controller());
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
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
        );
      });
}
