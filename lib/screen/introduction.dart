import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/model.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  PageController _pageController = PageController();

  var _selectedIndex = 0;
  void onPageChanged(int index) {
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 530,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                itemCount: getModel.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        getModel[index].img.toString(),
                        height: 400,
                        width: 400,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        getModel[index].title.toString(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        getModel[index].subtitle.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  getModel.length,
                  (index) => Indicator(
                      isActive: _selectedIndex == index ? true : false),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _selectedIndex == 1
                      ? Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width / 2 - 30,
                        )
                      : InkWell(
                          onTap: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 48,
                            width: MediaQuery.of(context).size.width / 2 - 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Color.fromARGB(105, 158, 158, 158))),
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/home');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent[700],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.indigoAccent),
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 30 : 10,
      height: 10,
      decoration: BoxDecoration(
          color:
              isActive ? Colors.indigoAccent[700] : Color.fromARGB(178, 189, 189, 189),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
