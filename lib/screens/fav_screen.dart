import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/route_manager.dart';
import '../core/values.dart';

// ignore: must_be_immutable
class Favourites extends StatelessWidget {
  List listOfFav = Get.put(Values()).isFav().obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Favorites Screen"),
      ),
      body: Obx(
        () => Container(
          height: MediaQuery.of(context).size.height * 1,
          child: listOfFav.length >= 1
              ? ListView.builder(
                  itemCount: listOfFav.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Card(
                      elevation: 5,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      // child: InkWell(
                      //   borderRadius: BorderRadius.circular(15),
                      //   onTap: () {
                      //     //..
                      //   },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          '"${listOfFav[index].value}"',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.dancingScript(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    "Add Values to favourites",
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
