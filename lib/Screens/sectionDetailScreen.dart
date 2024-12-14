// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mini_project_ii/widgets/alertDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';

class Sectiondetailscreen extends StatefulWidget {
  final String title;
  final data;
  int book;
  int chapter;
  int section;
  Sectiondetailscreen({
    Key? key,
    required this.title,
    required this.book,
    required this.chapter,
    required this.section,
    this.data,
  }) : super(key: key);

  @override
  State<Sectiondetailscreen> createState() => _SectiondetailscreenState();
}

class _SectiondetailscreenState extends State<Sectiondetailscreen> {
  FlutterTts _flutterTts = FlutterTts();
  final translator = GoogleTranslator();
  late final SharedPreferences prefs;

  List<Map> _voices = [];
  Map? _currentVoice;

  int? _currentWordStart, _currentWordEnd;
  // final SharedPreferences prefs=;

  @override
  void dispose() {
    // TODO: implement dispose
    // isSpeaking = false;
    _flutterTts.stop();
    super.dispose();
  }

  void initState() {
    super.initState();
    initTTS();
    initDB();
  }

  bool isLoading = false;
  void initDB() async {
    setState(() {
      isLoading = true;
    });

    prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoading = false;
    });
  }

  void initTTS() {
    _flutterTts.setProgressHandler((text, start, end, word) {
      setState(() {
        _currentWordStart = start;
        _currentWordEnd = end;
      });
    });
    _flutterTts.getVoices.then((data) {
      try {
        List<Map> voices = List<Map>.from(data);
        setState(() {
          _voices =
              voices.where((voice) => voice["name"].contains("en")).toList();
          _currentVoice = _voices.first;
          setVoice(_currentVoice!);
        });
      } catch (e) {
        print(e);
      }
    });
  }

  void setVoice(Map voice) {
    _flutterTts.setVoice({"name": voice["name"], "locale": voice["locale"]});
  }

  String richTextToMarkdown(RichText richText) {
    final buffer = StringBuffer();

    // Loop through the text spans
    richText.text.visitChildren((span) {
      if (span is TextSpan) {
        // Extract the text and apply formatting
        final text = span.text ?? '';

        if (span.style != null) {
          final style = span.style!;
          if (style.fontWeight == FontWeight.bold) {
            buffer.write('**$text**'); // Markdown for bold
          } else if (style.fontStyle == FontStyle.italic) {
            buffer.write('_${text}_'); // Markdown for italic
          } else {
            buffer.write(text); // No formatting
          }

          if (style.color != null) {
            buffer.write(' (color: ${style.color})'); // Custom color indication
          }
        } else {
          buffer.write(text); // No style, just write the text
        }
      }
      return true; // Continue visiting children
    });

    return buffer.toString();
  }

  TextSpan formatLargeText(String inputText, double textSize, int book) {
    List<TextSpan> spans = [];
    List<String> lines = [];
    if (book == 1) {
      List<String> tmp = [];
      int prev = 0;
      for (int i = 0; i < inputText.length; i++) {
        if (inputText.codeUnitAt(i) == 10) {
          if (i != 0 &&
              i != inputText.length - 1 &&
              (inputText.codeUnitAt(i - 1) >= 'a'.codeUnitAt(0) &&
                  inputText.codeUnitAt(i - 1) <= 'z'.codeUnitAt(0)) &&
              (inputText.codeUnitAt(i + 1) >= 'a'.codeUnitAt(0) &&
                  inputText.codeUnitAt(i + 1) <= 'z'.codeUnitAt(0))) {
            continue;
          }
          String str = inputText.substring(prev, i);
          prev = i + 1;
          tmp.add(str);
        }
      }
      if (prev != inputText.length) {
        String str = inputText.substring(prev);
        tmp.add(str);
      }
      lines = tmp;
    } else {
      lines = inputText.split('\n');
    }

    for (String line in lines) {
      line = line.trim();
      if (book == 1) {
        String str = "";
        int prev = 0;
        // print(line);
        for (int i = 0; i < line.length; i++) {
          // print(line[i]);
          if (line.codeUnitAt(i) == 10) {
            str = str + line.substring(prev, i);
            str = str + " ";
            prev = i + 1;
            // print("_________________");
            // print(i);
            // print("___________________");
          }
        }

        // print(str);
        // print("+++++++++++++++++++++++++++++++++++++");
        if (prev != line.length - 1) {
          str = str + line.substring(prev) + ".";
        }
        if (str != "") line = str;
      }

      if (line.startsWith('(')) {
        // If line starts with a section number, format it as bold
        spans.add(
          TextSpan(
            text: '$line\n\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      } else if (line.startsWith('Explanation') ||
          line.startsWith('Illustration')) {
        // Format the 'Explanation' and 'Illustration' headings as bold
        spans.add(
          TextSpan(
            text: '$line\n\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      } else if (line.startsWith('(a)') ||
          line.startsWith('(b)') ||
          line.startsWith('(c)') ||
          line.startsWith('(d)') ||
          line.startsWith('(e)') ||
          line.startsWith('(f)') ||
          line.startsWith('(g)') ||
          line.startsWith('(h)') ||
          line.startsWith('(i)') ||
          line.startsWith('(j)') ||
          line.startsWith('(k)') ||
          line.startsWith('(l)') ||
          line.startsWith('(m)') ||
          line.startsWith('(n)') ||
          line.startsWith('(o)') ||
          line.startsWith('(p)') ||
          line.startsWith('(q)') ||
          line.startsWith('(r)') ||
          line.startsWith('(s)') ||
          line.startsWith('(t)') ||
          line.startsWith('(u)') ||
          line.startsWith('(v)') ||
          line.startsWith('(w)') ||
          line.startsWith('(x)') ||
          line.startsWith('(y)') ||
          line.startsWith('(z)')) {
        // Format subpoints as italic
        spans.add(
          TextSpan(
            text: '$line\n',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        );
      } else {
        // For normal text, just append it without any special style
        spans.add(
          TextSpan(text: '$line\n\n', style: TextStyle(wordSpacing: 2.5)),
        );
      }
    }

    // Return the RichText widget with the formatted spans
    return TextSpan(
      style:
          TextStyle(fontSize: textSize, color: Colors.black), // Default style
      children: spans,
    );
  }

  var bodyData = "";
  bool isFav = false;
  bool isSpeaking = false;
  double multiplier = 1.0;
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    double textSize = sizeHeight * 0.0175 * multiplier;

    // print(widget.title);
    if (isLoading) {
      return Scaffold(
        backgroundColor: Color(0xffDED5C6),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      String curr = widget.book.toString() +
          "," +
          widget.chapter.toString() +
          "," +
          widget.section.toString() +
          "," +
          (widget.title.split(' ')[1]);

      final List<String>? items = prefs.getStringList('items');
      if (items == null) {
        prefs.setStringList('items', []);
        setState(() {
          isFav = false;
        });
      } else if (!items.contains(curr)) {
        setState(() {
          isFav = false;
        });
      } else if (items.contains(curr)) {
        setState(() {
          isFav = true;
        });
      }
      // print(items);
      return Scaffold(
        appBar: AppBar(
          leadingWidth: sizeWidth * 0.18,
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(sizeHeight * 0.025),
              child: Container(
                color: Color(0xffDED5C6),
                child: Image.asset("assets/images/sectionBottom.png"),
              )),
          title: Text(
            widget.title,
            style: TextStyle(
                fontFamily: 'playfair',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: sizeHeight * 0.035),
          ),
          toolbarHeight: sizeHeight * 0.06,
          backgroundColor: Color(0xff161d37),
          leading: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
                horizontal: sizeWidth * 0.04, vertical: sizeHeight * 0.005),
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
                size: sizeWidth * 0.0625,
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xffDED5C6),
        bottomNavigationBar: Container(
          width: sizeWidth,
          margin: EdgeInsets.only(bottom: sizeHeight * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {
                    showMenu(
                        color: Color(0xff161d37),
                        context: context,
                        position: RelativeRect.fromLTRB(
                            sizeWidth * 0.15,
                            sizeHeight * 0.85,
                            sizeWidth * 0.85,
                            sizeHeight * 0.15),
                        items: [
                          PopupMenuItem(
                            child: TextButton(
                              onPressed: () => {
                                setState(() {
                                  multiplier = 1;
                                })
                              },
                              child: Text(
                                "1x",
                                style: TextStyle(
                                    color: Color(0xffE9E5DC),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            child: TextButton(
                              onPressed: () => {
                                setState(() {
                                  multiplier = 1.5;
                                })
                              },
                              child: Text(
                                "1.5x",
                                style: TextStyle(
                                    color: Color(0xffE9E5DC),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            child: TextButton(
                              onPressed: () => {
                                setState(() {
                                  multiplier = 1.75;
                                })
                              },
                              child: Text(
                                "1.75x",
                                style: TextStyle(
                                    color: Color(0xffE9E5DC),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            child: TextButton(
                              onPressed: () => {
                                setState(() {
                                  multiplier = 2;
                                })
                              },
                              child: Text(
                                "2x",
                                style: TextStyle(
                                    color: Color(0xffE9E5DC),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ]);
                  },
                  icon: Icon(
                    Icons.zoom_in,
                    size: sizeHeight * 0.035,
                  )),
              IconButton(
                onPressed: () {
                  alertDialog(context);
                },
                icon: Icon(
                  Icons.g_translate_outlined,
                  size: sizeHeight * 0.035,
                ),
              ),
              IconButton(
                onPressed: () async {
                  // print("Tapped on texttospeech");
                  // print(widget.data["description"]);
                  if (!isSpeaking) {
                    int len = widget.data["description"].toString().length;
                    await _flutterTts.speak(widget.data["description"]
                        .toString()
                        .substring(0, len));
                  } else {
                    await _flutterTts.pause();
                  }
                  // print("Tapped on texttospeech ended");
                  setState(() {
                    isSpeaking = !isSpeaking;
                  });
                },
                icon: Icon(
                  isSpeaking
                      ? Icons.transcribe_sharp
                      : Icons.transcribe_outlined,
                  size: sizeHeight * 0.035,
                ),
                color: Color(0xff161d37),
              ),
              IconButton(
                  onPressed: () async {
                    if (isFav && items != null) {
                      List<String> tmp = [];
                      items
                          .map((item) => {if (item != curr) tmp.add(item)})
                          .toList();
                      prefs.setStringList('items', tmp);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Bookmark Removed!")));
                    } else if (items != null) {
                      prefs.setStringList('items', [...items, curr]);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Bookmark Added!")));
                    }
                    setState(() {
                      isFav = !isFav;
                      // print(curr);
                    });
                  },
                  icon: Icon(
                    isFav
                        ? Icons.bookmark_add_rounded
                        : Icons.bookmark_add_outlined,
                    size: sizeHeight * 0.035,
                  ))
            ],
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: sizeHeight * 0.02, horizontal: sizeWidth * 0.05),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.data['title'],
                      style: TextStyle(
                          fontSize: sizeHeight * 0.03,
                          fontFamily: 'playfair',
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Image.asset(
                    "assets/images/divider.png",
                    width: double.infinity,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: sizeHeight * 0.01),
                    child: SelectableText.rich(formatLargeText(
                        widget.data["description"], textSize, widget.book)),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
