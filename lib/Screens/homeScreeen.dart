import 'package:flutter/material.dart';
import 'package:mini_project_ii/Screens/FavouriteScreen/favouriteScreen.dart';
import 'package:mini_project_ii/Screens/ProfileScreen/profileScreen.dart';
import 'package:mini_project_ii/Screens/SearchScreens/searchScreen.dart';
import 'package:mini_project_ii/Screens/criminalLawScreen.dart';
// import 'package:mini_project_ii/globalVariables.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIdx = 0;
  final List<Widget> _list = [
    CriminalLawScreen(),
    Searchscreen(),
    FavouriteScreen(),
    ProfileScreen()
  ];
  final List<String> _labels = ["Home", "Search", "Favourites", "Profile"];
  final List<IconData> _icons = [
    Icons.home,
    Icons.search,
    Icons.favorite,
    Icons.person
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff161D37),
      body: _list[currentIdx],
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(MediaQuery.of(context).size.height * 0.015),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Color(0xffC2A875),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(4, (index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            currentIdx = index;
                          });
                        },
                        child: Container(
                          // color: Colors.pink,
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.13,
                          child: Icon(
                            _icons[index],
                            color: currentIdx == index
                                ? const Color(0xff161D37)
                                : Colors.white,
                            size: MediaQuery.of(context).size.height * 0.03,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                          MediaQuery.of(context).size.height * 0.015),
                      bottomRight: Radius.circular(
                          MediaQuery.of(context).size.height * 0.015)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 4; i++)
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIdx = i;
                          });
                        },
                        child: Text(
                          _labels[i],
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.017,
                              fontWeight: i == currentIdx
                                  ? FontWeight.bold
                                  : FontWeight.w500),
                        ),
                      )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.035,
              )
            ],
          ),
        ),
      ),
    );
  }
}
