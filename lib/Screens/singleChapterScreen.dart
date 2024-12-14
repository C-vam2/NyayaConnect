// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_project_ii/Screens/sectionDetailScreen.dart';

class SingleChapterScreen extends StatefulWidget {
  final String title;
  final data;
  final int start;
  int book;
  int chapter;
  SingleChapterScreen(
      {Key? key,
      required this.title,
      required this.data,
      required this.start,
      required this.book,
      required this.chapter})
      : super(key: key);

  @override
  State<SingleChapterScreen> createState() => _SingleChapterScreenState();
}

class _SingleChapterScreenState extends State<SingleChapterScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: screenWidth * 0.18,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.03),
          child: Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.02),
            child: Text(
              "Section Details Page".toUpperCase(),
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
          widget.title.toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'playfair',
              color: Colors.white,
              fontSize: screenWidth * 0.06),
        ),
        toolbarHeight: screenHeight * 0.08,
        backgroundColor: Color(0xff161d37),
        leading: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04, vertical: screenHeight * 0.005),
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
      body: SafeArea(
        top: true,
        child: ShaderMask(
          blendMode: BlendMode.dstOut,
          shaderCallback: (Rect rect) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.transparent,
                Colors.transparent,
                Colors.white,
              ],
              stops: [0.0, 0.03, 0.98, 1.0],
            ).createShader(rect);
          },
          child: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.015),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: screenWidth * 0.02,
                mainAxisSpacing: screenHeight * 0.02,
              ),
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                var start = 0;
                for (int i = 0; i < index; i++) {
                  start = start + widget.data[i].length as int;
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Sectiondetailscreen(
                        title: "Section ${index + 1 + widget.start}",
                        data: widget.data[index],
                        book: widget.book,
                        chapter: widget.chapter,
                        section: index,
                      ),
                    ));
                  },
                  child: Card(
                    elevation: 10,
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/SVGImages/section.svg",
                          alignment: Alignment.center,
                          width: screenWidth,
                          height: screenHeight,
                        ),
                        Container(
                          width: screenWidth,
                          height: screenHeight,
                          alignment: Alignment(0.02, -0.87),
                          child: Text(
                            "Section ${index + 1 + widget.start}",
                            style: TextStyle(
                                fontFamily: 'playfair',
                                color: Colors.white,
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment(0, 0.7),
                          child: SvgPicture.asset(
                            "assets/SVGImages/parliament.svg",
                            width: screenWidth * 0.17,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.1),
                          width: screenWidth * 0.5,
                          height: screenHeight * 0.7,
                          alignment: Alignment.center,
                          child: Text(
                            widget.data[index]['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: screenWidth * 0.03,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 5,
                            textAlign: TextAlign.center,
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
      ),
    );
  }
}
