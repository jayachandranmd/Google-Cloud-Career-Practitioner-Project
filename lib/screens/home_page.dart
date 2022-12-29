import 'package:chargeio/utils/colors.dart';
import 'package:chargeio/utils/constants.dart';
import 'package:chargeio/utils/textstyle.dart';
import 'package:flutter/material.dart';

import 'controls_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/block.png'),
          sBoxH30,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ControlsPage()));
                  },
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: grey)),
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/icons/block1.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                    title: Text(
                      'Block A',
                      style: titleText,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
