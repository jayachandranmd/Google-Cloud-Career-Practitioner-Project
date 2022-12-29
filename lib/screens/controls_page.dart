import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/textstyle.dart';

class ControlsPage extends StatefulWidget {
  const ControlsPage({super.key});

  @override
  State<ControlsPage> createState() => _ControlsPageState();
}

class _ControlsPageState extends State<ControlsPage> {
  bool fanStatus = false;
  bool lightStatus = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/images/block.png'),
                Positioned(
                  top: 12,
                  left: 7,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            sBoxH30,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'BLOCK A',
                    style: titleText,
                  ),
                  sBoxH10,
                  Image.asset(
                    'assets/icons/block1.png',
                    height: 35,
                    width: 35,
                  ),
                  sBoxH30,
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/icons/fan.png',
                          height: 30,
                          width: 30,
                        ),
                        CupertinoSwitch(
                          activeColor: blue,
                          value: fanStatus,
                          onChanged: (value) {
                            fanStatus = value;
                            setState(
                              () {},
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  sBoxH20,
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/icons/light.png',
                          height: 30,
                          width: 30,
                        ),
                        CupertinoSwitch(
                          value: lightStatus,
                          activeColor: blue,
                          onChanged: (value) {
                            lightStatus = value;
                            setState(
                              () {},
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
