import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'const.dart';

class AccountContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 120,
              color: Colors.grey[900],
              child: Container(
                color: Colors.grey[900],
                width: double.infinity,
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(''),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          backgroundColor: kShadowColor,
                          radius: 40,
                          child: SvgPicture.asset('assets/icons/account.svg',
                              color: kPrimaryColor),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sudarshan Shrestha', style: titleStyle),
                              Text(
                                '9484848484',
                                style: subtitleStyle,
                              ),
                              RaisedButton(
                                color: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text('N/A >'),
                                onPressed: () {},
                              ),
                            ]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SpaceBox(),
            Container(
              height: height * .2,
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Text(
                    'Account ',
                    style: titleStyle,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.transparent,
                          child: Icon(Icons.person)),
                      SizedBox(width: 20),
                      Text(
                        'Profile',
                        style: titleStyle,
                      ),
                    ],
                  ),
                  Divider(color: Colors.white30),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.business, color: Colors.grey),
                      SizedBox(width: 20),
                      Text(
                        'Business Profile',
                        style: titleStyle,
                      ),
                    ],
                  ),
                  // ListTile(
                  //     leading: Icon(Icons.business),
                  //     title: Text(
                  //       'Bussiness profile',
                  //       style: subtitleStyle,
                  //     )),
                  // Divider(),
                  // ListTile(
                  //     leading: Icon(Icons.star), title: Text('Saved Address')),
                ],
              ),
              color: Colors.grey[900],
            ),
            SpaceBox(),
            Container(
              padding: EdgeInsets.only(top: 20),
              height: height * .3,
              child: Column(
                children: [
                  Text('Account ', style: titleStyle),
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.transparent,
                          child: Icon(Icons.person)),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Profile',
                        style: titleStyle,
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white54,
                  ),
                  ListTile(
                      leading: Icon(Icons.business, color: Colors.grey[400]),
                      title: Text(
                        'Bussiness profile',
                        style: titleStyle,
                      )),
                  Divider(
                    color: Colors.white30,
                  ),
                  ListTile(
                      leading: Icon(Icons.star),
                      title: Text(
                        'Saved Address',
                        style: titleStyle,
                      )),
                ],
              ),
              color: Colors.grey[900],
            ),
            SpaceBox(),
            Container(
              height: height * .24,
              child: Column(
                children: [
                  Text('Settings '),
                  Row(
                    children: [
                      CircleAvatar(radius: 10, child: Icon(Icons.person)),
                      Text('Language'),
                    ],
                  ),
                  Divider(),
                  ListTile(
                      leading: Icon(Icons.business),
                      title: Text('Bussiness profile')),
                  Divider(),
                  ListTile(
                      leading: Icon(Icons.star), title: Text('Saved Address')),
                ],
              ),
              color: Colors.grey[900],
            ),
            SpaceBox(),
            Container(
              color: Colors.grey[900],
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                ),
                title: Text('Log out'),
              ),
            ),
            Center(child: Text('Version 7.4.1'))
          ],
        ),
      ),
    );
  }
}
