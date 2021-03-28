import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanicfinder/screen/request_service/customer_vechicle_details.dart';

import '../const.dart';

class ResuestService extends StatefulWidget {
  @override
  _ResuestServiceState createState() => _ResuestServiceState();
}

class _ResuestServiceState extends State<ResuestService> {
  int selectedService = 0;
  changeIndex(int index) {
    setState(() {
      selectedService = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Step 1',
          style: headingStyle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'CHOOSE THE \nSERVICE YOU\n REQUIRE',
              style: headingStyle.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
            
              height: MediaQuery.of(context).size.height * .5,
              child: GridView.builder(
                  itemCount: 4,
                  itemBuilder: (context, int i) {
                    return InkWell(
                      onTap: () {
                        changeIndex(i);
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: selectedService == i
                            ? BoxDecoration(
                                border:
                                    Border.all(color: Colors.green, width: 1))
                            : null,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/serviceman.png',
                              height: 140,
                            ),
                            Text(
                              'Repair',
                              style: subtitleStyle.copyWith(
                                  color: Colors.grey[500], fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2)),
            ),
            SizedBox(height: 20),
            Container(
                height: 60,
                width: 350,
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    Get.to(CustomerDetails());
                  },
                  child: Row(
                    children: [
                      Text('CONTINUE', style: titleStyle),
                      Spacer(),
                      Icon(Icons.arrow_forward, color: Colors.white)
                    ],
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
