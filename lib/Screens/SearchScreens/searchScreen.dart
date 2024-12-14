import 'package:flutter/material.dart';
import 'package:mini_project_ii/Screens/sectionDetailScreen.dart';
import '../../data/BhartiyaNaayaSanhita/rawData.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  TextEditingController searchController = TextEditingController();

  List<List<dynamic>> data = [];
  List<List<dynamic>> data1 = [[], [], [], [], []];
  List<List<dynamic>> data2 = [];
  List<List<dynamic>> data3 = [];

  List<List<dynamic>> searchFunction(List<String> keywords) {
    List<List<dynamic>> ans = [];
    int cntr = 1;
    Set<List<dynamic>> st = {};
    // print("Keywords______________");
    for (int i = 0; i < keywords.length; i++) {
      print(keywords[i]);
    }
    print("______________________");
    for (int book = 0; book < 3; book++) {
      int n = list[book].length;
      cntr = 1;
      print("Chapters count : ${n}");
      for (int chapter = 0; chapter < n; chapter++) {
        int m = list[book][chapter].length;
        for (int section = 0; section < m; section++) {
          String data = list[book][chapter][section]['description'].toString() +
              list[book][chapter][section]['title'].toString();
          double prob = 0;
          int total = 0;
          for (String words in keywords) {
            if (data.contains(words.toLowerCase()) || data.contains(words)) {
              total++;
            }
          }
          prob = total / keywords.length;
          if (prob >= 0.8) {
            List<dynamic> tmp = [book, chapter, section, cntr, prob];
            st.add(tmp);
          }
          cntr++;
        }
      }
    }

    for (List<dynamic> res in st) {
      print(res);
      ans.add(res);
    }
    print("Jai mahakal");
    return ans;
  }

  int currIdx = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final iconSize = screenWidth * 0.07;

    return Scaffold(
      backgroundColor: Color(0xff161D37),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.02, horizontal: screenWidth * 0.025),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Search Criminal\n Law Content",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'playfair'),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              ListTile(
                dense: false,
                title: Container(
                  height: screenHeight * 0.055,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: searchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                      fillColor: Colors.white,
                      hintText: 'Enter search query...',
                      hintStyle: TextStyle(
                        color: Color(0xff161D37),
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ),
                ),
                trailing: Container(
                  height: screenHeight * 0.055,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.search, size: iconSize),
                    onPressed: () {
                      if (searchController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Enter search text ...")));
                        return null;
                      }
                      final res =
                          searchFunction(searchController.text.split(" "));
                      data.clear();
                      data1 = [[], [], []];

                      for (List<dynamic> it in res) {
                        if (it.length == 5) {
                          data.add([
                            list[it[0]][it[1]][it[2]],
                            it[3],
                            it[0],
                            it[1],
                            it[2]
                          ]);
                          data1[it[0]].add([it[1], it[2], it[3]]);
                        }
                      }
                      print("____________");
                      debugPrint(data.toString());
                      print(data1);
                      print("____________");
                      setState(() {
                        FocusScope.of(context).unfocus();
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
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
                            color: currIdx == 0 ? Colors.white : Colors.black),
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
                            color: currIdx == 1 ? Colors.white : Colors.black),
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
                            color: currIdx == 2 ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.04,
                child: Image.asset("assets/images/divider.png"),
              ),
              searchBody(screenHeight, screenWidth, currIdx),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBody(double screenHeight, double screenWidth, int currIdx) {
    print("Curr Idx------->${currIdx}");
    return data1[currIdx].length == 0
        ? Container(
            child: Center(
              child: Text(
                "No search found!!",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        : Expanded(
            child: ListView.builder(
              itemCount: data1[currIdx].length,
              itemBuilder: (context, index) {
                // var title = data[index][0]['title'];
                var searchIndex = data1[currIdx][index][2] as int;
                var book = currIdx;
                var chapter = data1[currIdx][index][0] as int;
                var section = data1[currIdx][index][1] as int;
                var title = list[currIdx][chapter][section]['title']!;
                return Container(
                  margin: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01,
                      horizontal: screenWidth * 0.03),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    dense: true,
                    leading: Text(
                      "Section:$searchIndex",
                      style: TextStyle(
                        color: Color(0xff161D37),
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                    title: Text(
                      title,
                      style: TextStyle(fontSize: screenWidth * 0.03),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Sectiondetailscreen(
                          title: "Section ${searchIndex}",
                          data: list[currIdx][chapter][section],
                          book: book,
                          chapter: chapter,
                          section: section,
                        ),
                      ));
                    },
                  ),
                );
                // return Container(
                //   child: Text(
                //     "data",
                //     style: TextStyle(color: Colors.white),
                //   ),
                // );
              },
            ),
          );
  }
}
