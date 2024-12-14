import 'package:flutter/material.dart';

class FAQItem {
  String question;
  String answer;
  FAQItem({required this.question, required this.answer});
}

class FAQPage extends StatelessWidget {
  FAQPage({super.key});

  final items = [
    FAQItem(
        question: "What is the purpose of this app?",
        answer:
            "This app is designed to provide easy access to India's new criminal laws, including the Bharatiya Nyaya Sanhita, Bharatiya Nagarik Suraksha Sanhita, and Bharatiya Sakshya Adhiniyam. It offers features that make legal information accessible to all users."),
    FAQItem(
        question: "What features does the app offer?",
        answer:
            "The app includes multilingual support, text-to-speech functionality, keyword search, bookmarking, and Google Translate integration for international languages. Future updates will include a chatbot for assistance and Google Translate for Indian languages."),
    FAQItem(
        question: "How do I use the search feature?",
        answer:
            "Simply enter keywords related to specific sections or topics in the law. The app will retrieve relevant sections, making it easier to navigate through the content."),
    FAQItem(
        question: "Can I save specific sections for later reference?",
        answer:
            "Yes, the app has a bookmarking feature that allows you to save sections or specific information for quick access later."),
    FAQItem(
        question: "How does the text-to-speech feature work?",
        answer:
            "The text-to-speech feature reads out the content of sections, making it easier to understand the material without having to read it manually. Just select the section, and tap the play icon."),
    // FAQItem(
    //     question: "Is the app available in multiple languages?",
    //     answer:
    //         "Yes, the app currently supports multiple languages, with Google Translate integration for international languages. Upcoming updates will include support for Indian languages as well."),
    FAQItem(
        question: "How frequently is the content updated?",
        answer:
            "The app content is based on the latest legal documents from official sources, and it will be updated in alignment with any new amendments or official releases."),
    FAQItem(
        question: "How does the app handle data privacy?",
        answer:
            "The app is committed to user privacy. It only collects essential data necessary for functionality, and does not share any user information with third parties."),
  ];
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffDED5C6),
      appBar: AppBar(
        leadingWidth: sizeWidth * 0.18,
        leading: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
              horizontal: sizeWidth * 0.04, vertical: sizeHeight * 0.005),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(sizeWidth * 0.075),
            color: Color(0xffE9E5DC),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              size: sizeWidth * 0.0625,
            ),
          ),
        ),
        backgroundColor: Color(0xff161d37),
        centerTitle: true,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
        bottom: PreferredSize(
            preferredSize: Size(sizeWidth, sizeHeight * 0.02),
            child: Container()),
        title: Text(
          "Frequently Asked\nQuestions",
          style: TextStyle(
            fontFamily: 'playfair',
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 80,
            child: Text(
              "Top Queries",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: const Color(0xffC2A875),
                      surfaceTintColor: Colors.white,
                      child: ExpansionTile(
                        iconColor: Color(0xff161d37),
                        backgroundColor: const Color(0xffC2A875),
                        title: Text(
                          items[index].question,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        children: <Widget>[
                          ListTile(
                              title: Text(
                            items[index].answer,
                          )),
                        ],
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
