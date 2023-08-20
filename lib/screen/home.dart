import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/notifi.dart';
import '../widgets/notifi.dart';
import '../widgets/primary.dart';
import 'newemail.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> tabs = [
    "Primary",
    "Social",
    "Forums",
  ];
  int current = 0;
  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 14;
      case 1:
        return 84;
      case 2:
        return 155;

      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F8),
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "All Inboxes",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              FontAwesomeIcons.angleDown,
                              size: 18,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Total 2500 Messages, 3 Unread",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(
                        "img/profile.jpg",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Notifications(),
              Container(
                padding: EdgeInsets.only(top: 25, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width / 2 + 10,
                          height: size.height * 0.039,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: SizedBox(
                                  width: size.width,
                                  height: size.height * 0.04,
                                  child: ListView.builder(
                                    itemCount: tabs.length,
                                    scrollDirection: Axis.horizontal,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            current = index;
                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: index == 0 ? 10 : 25,
                                          ),
                                          child: Text(
                                            tabs[index],
                                            style: TextStyle(
                                              color: current == index
                                                  ? Colors.black
                                                  : Colors.grey[400],
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: .4,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              AnimatedPositioned(
                                bottom: 0,
                                left: changePositionedOfLine(),
                                curve: Curves.fastLinearToSlowEaseIn,
                                duration: Duration(milliseconds: 500),
                                child: AnimatedContainer(
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  margin: EdgeInsets.only(left: 10),
                                  duration: Duration(milliseconds: 500),
                                  width: 25,
                                  height: size.height * 0.008,
                                  decoration: BoxDecoration(
                                    color: Colors.indigoAccent[700],
                                    borderRadius: BorderRadius.circular(1050),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.ellipsis,
                              color: Colors.grey[400],
                              size: 20,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Edit",
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Primary()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 10, right: 10),
        height: 60,
        width: 60,
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.indigoAccent[700],
          child: Icon(
            FontAwesomeIcons.pencil,
            size: 22,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewEmail(),
              ),
            );
          },
        ),
      ),
    );
  }
}
