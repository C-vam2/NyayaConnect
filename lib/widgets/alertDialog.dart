import 'package:flutter/material.dart';

Future<dynamic> alertDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        backgroundColor: Color(0xffC2A875),
        content: Text("This feature will be available soon!"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Ok"))
        ],
      );
    },
  );
}
