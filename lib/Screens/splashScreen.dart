import 'package:flutter/material.dart';
import 'package:mini_project_ii/Screens/homeScreeen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => HomeScreen(),
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context)
            .size
            .width, // Define width for outer container
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context)
                  .size
                  .width, // Ensure image spans full width
              child: Image.asset(
                "assets/images/parliamentImg.png",
                fit: BoxFit.fitWidth,
                // fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.47,
                width: MediaQuery.of(context)
                    .size
                    .width, // Define width for Positioned container
                decoration: BoxDecoration(
                  color: Color(0xff161d37),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        MediaQuery.of(context).size.width * 0.05),
                    topRight: Radius.circular(
                        MediaQuery.of(context).size.width * 0.05),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "INDIAN\nCRIMINAL\nLAWS",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.05,
                          fontFamily: 'playfair'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Image.asset(
                      'assets/images/splashDivider.png',
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xffC2A875),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      "BNS  |  BNSS  |  BSA ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.015),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
