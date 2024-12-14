import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mini_project_ii/Screens/singleChapterScreen.dart';
import 'package:mini_project_ii/data/BhartiyaNaayaSanhita/rawData.dart';

class ChapterScreen extends StatefulWidget {
  final String title;
  int book;
  ChapterScreen({Key? key, required this.title, required this.book})
      : super(key: key);

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  @override
  Widget build(BuildContext context) {
    final data = list[widget.book];
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: screenWidth * 0.2,
        // automaticallyImplyLeading: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.03),
          child: Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.02),
            child: Text(
              "Chapters Details Page".toUpperCase(),
              style: TextStyle(
                  fontFamily: 'playfair',
                  color: Color(0xffc7ab77),
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        centerTitle: true,

        title: Text(
          textAlign: TextAlign.center,
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: screenWidth * 0.06,
            fontFamily: 'playfair',
          ),
        ),
        toolbarHeight: screenHeight * 0.08,
        backgroundColor: Color(0xff161d37),
        leading: Container(
          // alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, vertical: screenHeight * 0.005),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/backImage.png"),
            ),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              size: screenWidth * 0.0625,
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xffE9E5DC),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.01, horizontal: screenWidth * 0.02),
        child: Column(
          children: [
            widget.book == 0
                ? Container(
                    height: screenHeight * 0.1,
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.045),
                    alignment: Alignment.center,
                    child: Text(
                      "An Act to consolidate and amend the provisions relating to offences and for matters connected therewith or incidental thereto.\n BE it enacted by Parliament in the Seventy-fourth Year of the Republic of India as follows:–.",
                      style: TextStyle(
                          fontSize: screenWidth * 0.0275,
                          color: Color(0xff161d37),
                          fontWeight: FontWeight.w600),
                    ),
                  )
                : Container(),
            SizedBox(height: screenHeight * 0.015),
            Expanded(
              child: ShaderMask(
                shaderCallback: (Rect rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: const [
                      Colors.white,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.white,
                    ],
                    stops: const [0.0, 0.02, 0.98, 1.0],
                  ).createShader(rect);
                },
                blendMode: BlendMode.dstOut,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: screenWidth * 0.02,
                      mainAxisSpacing: screenHeight * 0.02),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var start = 0;
                    for (int i = 0; i < index; i++) {
                      start = start + data[i].length as int;
                    }
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SingleChapterScreen(
                            title: "Chapter ${index + 1}",
                            data: data[index],
                            start: start,
                            book: widget.book,
                            chapter: index,
                          ),
                        ));
                      },
                      child: Card(
                        color: Colors.transparent,
                        elevation: 15,
                        child: Stack(
                          children: [
                            SvgPicture.asset(
                              "assets/SVGImages/chapter.svg",
                              alignment: Alignment.center,
                              width: screenWidth,
                              height: screenHeight,
                            ),
                            Container(
                              width: screenWidth,
                              height: screenHeight,
                              alignment: Alignment(0, -0.77),
                              child: Text(
                                "Chapter-${index + 1}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'playfair',
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment(0, -0.22),
                              child: Image.asset(
                                "assets/images/taraju.png",
                                color: Colors.white,
                                width: screenWidth * 0.06,
                              ),
                            ),
                            Container(
                              width: screenWidth,
                              height: screenHeight,
                              alignment: Alignment(0, 0.7),
                              child: Text(
                                "Section ${start + 1} - ${start + data[index].length}",
                                style: TextStyle(
                                    fontFamily: 'playfair',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: screenWidth * 0.03),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
