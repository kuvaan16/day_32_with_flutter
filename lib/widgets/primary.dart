import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/primary.dart';

class Primary extends StatefulWidget {
  const Primary({super.key});

  @override
  State<Primary> createState() => _PrimaryState();
}

class _PrimaryState extends State<Primary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: getPrimaryClass.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                getPrimaryClass[index].isRead = true;
              });
            },
            child: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: Color(0xFFF3F4F8),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      getPrimaryClass[index].img.toString(),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 195,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getPrimaryClass[index].name.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          getPrimaryClass[index].type.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          getPrimaryClass[index].description.toString(),
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              letterSpacing: .1),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        getPrimaryClass[index].timePase.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      getPrimaryClass[index].isRead == true
                          ? Container()
                          : Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
