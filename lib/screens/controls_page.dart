import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
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
  bool lightStatus = false;
  var ledStatus;
  bool isLoading = false;
  final dbRef = FirebaseDatabase.instance.ref();

  getLEDStatus() async {
    await dbRef.child('LED_STATUS').once().then((snapshot) {
      ledStatus = snapshot.snapshot.value;
      if (kDebugMode) {
        print(ledStatus);
      }
    });
    setState(() {
      isLoading = false;
      ledStatus == 0 ? lightStatus = false : lightStatus = true;
    });
  }

  void buttonPressed() {
    ledStatus == 0
        ? dbRef.child('LED_STATUS').set(1)
        : dbRef.child('LED_STATUS').set(0);
    if (ledStatus == 0) {
      setState(() {
        ledStatus = 1;
        lightStatus = true;
      });
    } else {
      setState(() {
        ledStatus = 0;
        lightStatus = false;
      });
    }
  }

  @override
  void initState() {
    isLoading = true;
    getLEDStatus();
    super.initState();
  }

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
                  sBoxH20,
                  /*Container(
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
                              buttonPressed;
                            })
                      ],
                    ),
                  ),*/
                  sBoxH30,
                  RawMaterialButton(
                    onPressed: buttonPressed,
                    elevation: 2.0,
                    fillColor: !lightStatus ? Colors.white : blue,
                    padding: const EdgeInsets.all(50.0),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.power_settings_new_sharp,
                      size: 35.0,
                    ),
                  ),
                  sBoxH30,
                  lightStatus
                      ? const Text('Tap to turn Off')
                      : const Text('Tap to turn On')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
