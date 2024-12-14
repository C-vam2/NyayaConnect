import 'package:flutter/material.dart';
import 'package:mini_project_ii/Screens/ProfileScreen/faqScreen.dart';
import 'package:mini_project_ii/widgets/alertDialog.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  _sendMail() async {
    String email = Uri.encodeComponent("sahilkirti26660@gmail.com");
    String subject = Uri.encodeComponent("Miniproject II");
    String body = Uri.encodeComponent("Type your message here");

    Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
    await launchUrl(mail);
  }

  _shareApp() {
    // print("Hello");
    Share.share(
        "Hey, I am using this app to learn about new Indian criminal laws. Get the app here :" +
            "fdasf");
    // print("Dello");
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffDED5C6),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                height: screenHeight * 0.20,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xff161d37),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontFamily: 'playfair',
                        color: Colors.white,
                        fontSize: screenWidth * 0.1, // Responsive font size
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      "Indian Criminal Laws".toUpperCase(),
                      style: TextStyle(
                        color: const Color(0xffC2A875),
                        fontFamily: 'playfair',
                        fontSize: screenWidth * 0.04, // Responsive font size
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: screenHeight * 0.17,
              left: screenWidth * 0.05,
              child: Container(
                height: screenHeight * 0.35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenWidth * 0.9,
                      child: Column(
                        children: [
                          Container(
                            height: screenHeight * 0.06,
                            width: screenWidth * 0.9,
                            decoration: BoxDecoration(
                              color: Color(0xffC2A875),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: ProfileItem(
                                context,
                                Text(
                                  "Hello, User",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenHeight * 0.015),
                                ),
                                Icon(Icons.person),
                                Colors.white,
                                null,
                                true,
                                ""),
                          ),
                          Container(
                            height: screenHeight * 0.08,
                            width: screenWidth * 0.9,
                            decoration: BoxDecoration(
                              color: Color(0xff161d37),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: ProfileItem(
                                context,
                                Text(
                                  "Contact Us",
                                  style: TextStyle(
                                      fontFamily: 'playfair',
                                      color: Colors.white,
                                      // fontWeight: FontWeight.bold,
                                      fontSize: screenHeight * 0.02),
                                ),
                                Icon(Icons.contact_support),
                                Color(0xffC2A875),
                                _sendMail,
                                false,
                                "Contact us for any queries."),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.08,
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                        color: Color(0xff161d37),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: ProfileItem(
                          context,
                          Text(
                            "FAQ",
                            style: TextStyle(
                                fontFamily: 'playfair',
                                color: Colors.white,
                                // fontWeight: FontWeight.bold,
                                fontSize: screenHeight * 0.02),
                          ),
                          Icon(Icons.contact_support),
                          Color(0xffC2A875),
                          () => {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FAQPage(),
                                ))
                              },
                          false,
                          "Frequently Asked Questions."),
                    ),
                    Container(
                      height: screenHeight * 0.08,
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                        color: Color(0xff161d37),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: ProfileItem(
                          context,
                          Text(
                            "Share App",
                            style: TextStyle(
                                fontFamily: 'playfair',
                                color: Colors.white,
                                // fontWeight: FontWeight.bold,
                                fontSize: screenHeight * 0.02),
                          ),
                          Icon(Icons.contact_support),
                          Color(0xffC2A875),
                          _shareApp,
                          false,
                          "Share the app to others."),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  ListTile ProfileItem(BuildContext context, Widget title, Icon leadingIcon,
      Color color, Function? fn, bool showTrailing, String subtitle) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: leadingIcon,
        radius: 17,
      ),
      title: title,
      minLeadingWidth: 50,
      onTap: () => {
        if (fn == null) {null} else {fn()}
      },
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Color(
            0xffDED5C6,
          ),
        ),
      ),
      trailing: showTrailing
          ? TextButton(
              onPressed: () => {alertDialog(context)},
              child: Text(
                "Login",
                style: TextStyle(
                    color: Color(0xff161d37), fontWeight: FontWeight.bold),
              ),
            )
          : null,
    );
  }
}
