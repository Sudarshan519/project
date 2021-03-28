import 'package:flutter/material.dart';

import 'const.dart';
import 'widgets/button.dart';

class HistoryContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.grey[900],
            width: double.infinity,
            height: 100,
            child: Text(
              'History',
              style: headingStyle,
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.grey[600],
            child: Column(
              children: [
                Container(
                  height: 400,
                  //   color: Colors.green,
                ),
                Text('Lets place your first order'),
                Text("It seems we don't have any history . Lets\n make some "),
                CustomButton(name: "LET'S ORDER"),
                Container(
                  height: 200,
                  //   color: Colors.green,
                ),
              ],
            ),
          ),
        ]);
  }
}

class OffersContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [Container()]);
  }
}
