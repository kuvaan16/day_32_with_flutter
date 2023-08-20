import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/notifi.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: getNotifiList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      padding:
                          index == 1 || index == 4 ? EdgeInsets.all(15) : EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        getNotifiList[index].img.toString(),
                        width: index == 1 || index == 4  ? 55 : 35,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: getNotifiList[index].noNotifi != 0
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 3),
                              decoration: BoxDecoration(
                                  color: Colors.indigoAccent[700],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                getNotifiList[index].noNotifi.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Container(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(getNotifiList[index].title.toString(),
                    style: TextStyle(
                      color: Colors.grey,
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
