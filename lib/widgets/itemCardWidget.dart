// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mini_project_ii/globalVariables.dart';

class ItemCartWidget extends StatelessWidget {
  String bookTitle;
  Widget ChapterScreen;
  int book;
  ItemCartWidget({
    Key? key,
    required this.bookTitle,
    required this.ChapterScreen,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChapterScreen,
        ));
      },
      child: Card(
        color: Colors.white,
        shadowColor: Colors.black,
        elevation: 20,
        semanticContainer: true,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Image.asset(
              "assets/images/Group${book + 1}.png",
              height: MediaQuery.of(context).size.height * 0.2,
            )),
      ),
    );
  }
}
