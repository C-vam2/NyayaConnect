import 'package:flutter/material.dart';
import 'package:mini_project_ii/Screens/sectionDetailScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mini_project_ii/data/BhartiyaNaayaSanhita/rawData.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  bool isLoading = true;
  late SharedPreferences prefs;
  List<String>? items;

  @override
  void initState() {
    super.initState();
    initDB();
  }

  void initDB() async {
    setState(() {
      isLoading = true;
    });
    prefs = await SharedPreferences.getInstance();
    loadItems();
  }

  void loadItems() {
    setState(() {
      items = prefs.getStringList('items');
      isLoading = false;
    });
  }

  int currIdx = 0;

  @override
  Widget build(BuildContext context) {
    // Getting screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffDED5C6),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
            height: screenHeight * 0.25,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xff161d37),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Favourites",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.1,
                      fontFamily: 'playfair' // Responsive font size
                      ),
                ),
                // SizedBox(height: screenHeight * 0.01),
                Text(
                  "Your Bookmarked Sections will be shown here",
                  style: TextStyle(
                      color: const Color(0xffC2A875),
                      fontSize: screenWidth * 0.04,
                      fontFamily: 'playfair' // Responsive font size
                      ),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          currIdx = 0;
                        });
                      },
                      child: Container(
                        height: screenHeight * 0.04,
                        width: screenWidth * 0.175,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color:
                                currIdx == 0 ? Color(0xffC2A875) : Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "BNS",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  currIdx == 0 ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          currIdx = 1;
                        });
                      },
                      child: Container(
                        height: screenHeight * 0.04,
                        width: screenWidth * 0.175,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color:
                                currIdx == 1 ? Color(0xffC2A875) : Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "BNSS",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  currIdx == 1 ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          currIdx = 2;
                        });
                      },
                      child: Container(
                        height: screenHeight * 0.04,
                        width: screenWidth * 0.175,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color:
                                currIdx == 2 ? Color(0xffC2A875) : Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "BSA",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  currIdx == 2 ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : (items == null || items!.isEmpty)
                  ? Expanded(
                      child: Center(
                        child: Text(
                          "No items to show",
                          style: TextStyle(
                            fontSize:
                                screenWidth * 0.05, // Responsive font size
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: items!.length,
                        itemBuilder: (context, index) {
                          List data = items![index].split(',');
                          int bookIdx = int.parse(data[0]);
                          int chapterIdx = int.parse(data[1]);
                          int sectionIdx = int.parse(data[2]);
                          String section = data[3];
                          var currentData =
                              list[bookIdx][chapterIdx][sectionIdx];
                          if (currIdx != bookIdx) return Container();
                          return Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                              vertical: screenHeight * 0.01,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffC2A875),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ListTile(
                              tileColor: Colors.white,
                              leading: Text(
                                "Section $section: ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth *
                                      0.04, // Responsive font size
                                ),
                              ),
                              dense: true,
                              title: Text(
                                currentData['title'] ?? "",
                                style: TextStyle(
                                  color: const Color(0xff161d37),
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth *
                                      0.03, // Responsive font size
                                ),
                              ),
                              onTap: () async {
                                final result = await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Sectiondetailscreen(
                                      title: "Section $section",
                                      data: list[bookIdx][chapterIdx]
                                          [sectionIdx],
                                      book: bookIdx,
                                      chapter: chapterIdx,
                                      section: sectionIdx,
                                    ),
                                  ),
                                );
                                loadItems();
                              },
                            ),
                          );
                        },
                      ),
                    ),
        ],
      ),
    );
  }
}
