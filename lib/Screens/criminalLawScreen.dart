import 'package:flutter/material.dart';
import 'package:mini_project_ii/Screens/chapterListScreen.dart';
import 'package:mini_project_ii/globalVariables.dart';
import 'package:mini_project_ii/widgets/itemCardWidget.dart';

class CriminalLawScreen extends StatelessWidget {
  const CriminalLawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset(
            "assets/images/phoolRight.png",
            height: MediaQuery.of(context).size.height * 0.05,
          )
        ],
        leadingWidth: MediaQuery.of(context).size.width * 0.09,
        leading: Container(
          child: Image.asset(
            "assets/images/phoolLeft.png",
            height: MediaQuery.of(context).size.height * 0.05,
          ),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        title: Text(
          "INDIAN CRIMINAL LAWS",
          style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.06,
              fontWeight: FontWeight.bold,
              fontFamily: 'playfair'),
        ),
        bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.01),
            child: Image.asset("assets/images/divider.png")),
        centerTitle: true,
        backgroundColor: Color(0xff161D37),
      ),
      backgroundColor: Color(0xff161D37),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.175,
                  color: Color(0xffC2A875),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.175,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        color: Color(0xffC2A875),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: "0",
                      child: ItemCartWidget(
                        bookTitle: "Bharatiya Nyaya Sanhita",
                        book: 0,
                        ChapterScreen: ChapterScreen(
                            title: "Bharatiya Nyaya Sanhita", book: 0),
                      ),
                    ),
                    ItemCartWidget(
                      bookTitle: "Bharatiya Nagarik Suraksha Sanhita",
                      book: 1,
                      ChapterScreen: ChapterScreen(
                          title: "Bharatiya Nagarik \nSuraksha Sanhita",
                          book: 1),
                    ),
                  ],
                ),
                ItemCartWidget(
                  bookTitle: "Bharatiya Sakshya Adhiniyam",
                  book: 2,
                  ChapterScreen: ChapterScreen(
                    title: "Bharatiya Sakshya\n Adhiniyam",
                    book: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
