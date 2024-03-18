// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todoapp/Pages/savcancbtn.dart';

class DialogBox extends StatelessWidget {
  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel,
      });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 235, 226, 226),
      content: Container(
        height: 120,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Kaya Kaam Jode",
              ),
            ),

            //buttons for save and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                my_buttons(text: "Save", onPressed: onSave),

                const SizedBox(width: 100),

                //cancel button
                my_buttons(text: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
