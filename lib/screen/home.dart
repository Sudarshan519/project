import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanicfinder/controller/networkController.dart';
import 'package:mechanicfinder/screen/const.dart';
import 'package:mechanicfinder/screen/home/widgets/nav_bar.dart';
import 'package:mechanicfinder/screen/widgets/banner.dart';

import 'account.dart';
import 'history.dart';
import 'request_service/request_service.dart';
import 'widgets/button.dart';

final List _categories = List.unmodifiable([
  {'image': 'assets/service/mirror.gif', 'title': 'Mirror'},
  {'image': 'assets/service/oilservice.jpg', 'title': 'CarOil'},
  {'image': 'assets/service/gasservice.jpg', 'title': 'Fuel'},
  {'image': 'assets/service/brakeservice.jpg', 'title': 'Brake'},
  {'image': 'assets/service/engine.gif', 'title': 'Engine'},
]);

class CategoriesContainer extends StatelessWidget {
  final List categories;

  const CategoriesContainer({Key key, this.categories}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ResuestService());
      },
      child: Container(
        //color: Colors.green,
        //color: Colors.grey[900],
        height: MediaQuery.of(context).size.height * .2,
        child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int i) {
            return Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[900]),
              margin: EdgeInsets.all(5),
              child: Column(children: [
                Image.asset(
                  categories[i]['image'],
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  categories[i]['title'],
                  textAlign: TextAlign.center,
                  style: titleStyle.copyWith(color: Colors.white),
                ),
              ]),
            );
          },
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final networkController = Get.find<NetworkController>();
  int currentIndex = 0;

  final List _tabIcons = List.unmodifiable([
    {'icon': 'assets/icons/shop.svg', 'title': 'Shop'},
    {'icon': 'assets/icons/explore.svg', 'title': 'History'},
    // {'icon': 'assets/icons/explore.svg', 'title': 'History'},
    // {'icon': 'assets/icons/explore.svg', 'title': 'History'},
    // {'icon': 'assets/icons/cart.svg', 'title': 'Cart'},
    //  {'icon': 'assets/icons/history.svg', 'title': 'History'},
    {'icon': 'assets/icons/account.svg', 'title': 'Account'},
  ]);

  final List<Widget> _tabs = List.unmodifiable([
    HomeContent(),
    HistoryContent(),
    HistoryContent(),
    HistoryContent(),
    AccountContent(),
  ]);

  void onTabChanged(int index) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        child: Obx(()=>networkController.connectionStatus.value != 0?_tabs[currentIndex]:"Connect to network")
      ),
      bottomNavigationBar: NavBar(
        tabIcons: _tabIcons,
        activeIndex: currentIndex,
        onTabChanged: onTabChanged,
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  void onChanged(int index) {
    setState(() => selectedTab = index);
  }

  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(children: [
      Container(
          height: 120,
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(10),
            color: Colors.grey[900],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // IconButton(
              //     icon: Icon(
              //       Icons.sort,
              //       size: 30,
              //       color: Colors.grey,
              //     ),
              //     onPressed: () {}),
              Icon(
                Icons.car_repair,
                color: Colors.white,
                size: 30,
              ),
              Text('Mechanic',
                  style: TextStyle(color: Colors.grey.shade300, fontSize: 20)),
              Text('Finder',
                  style: TextStyle(color: Colors.red.shade900, fontSize: 20)),
            ],
          )),
      SpaceBox(),
      CategoriesContainer(
        categories: _categories,
      ),
      SpaceBox(),
      Container(
        // padding: EdgeInsets.only(left: 19),
        color: Colors.grey[900],
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 20),
              Text("What's New",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              SpaceBox(),
              Wrap(spacing: 10, runSpacing: 10, children: [
                CustomButton(
                    name: 'All',
                    color:
                        selectedTab == 0 ? Colors.red[800] : Colors.grey[800],
                    textColor: Colors.white,
                    onpress: () {
                      onChanged(0);
                    }),
                CustomButton(
                    name: 'Trending',
                    color:
                        selectedTab == 1 ? Colors.red[800] : Colors.grey[800],
                    textColor: Colors.white,
                    onpress: () {
                      onChanged(1);
                    }),
                CustomButton(
                    name: 'Trending',
                    color:
                        selectedTab == 2 ? Colors.red[800] : Colors.grey[800],
                    textColor: Colors.white,
                    onpress: () {
                      onChanged(2);
                    }),
                CustomButton(
                    name: 'Trending',
                    color:
                        selectedTab == 3 ? Colors.red[800] : Colors.grey[800],
                    textColor: Colors.white,
                    onpress: () {
                      onChanged(3);
                    }),
                // RaisedButton(
                //   onPressed: () {},
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       side: BorderSide(color: Colors.white38, width: 1)),
                //   child: Text(
                //     'Services',
                //     style: TextStyle(
                //         color: Colors.grey[800],
                //         fontSize: 14,
                //         fontWeight: FontWeight.w400),
                //   ),
                // ),
              ]),
              SpaceBox(),
              Banners(),
              SizedBox(height: 10)
              // Container(
              //   width: double.infinity,
              //   height: height * .2,
              //   color: Colors.white,
              //   child: Image.asset('assets/serviceman.png'),
              // ),
            ]),
      ),
      SizedBox(height: 10),
      Container(
        color: Colors.grey[900],
        height: height * .15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose your service type ??',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Container(
              height: height * .1,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white30,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white30,
                      child: Icon(
                        Icons.home,
                        size: 16,
                        color: Colors.white60,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Monthly Service',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Sechedule your \nservice day',
                        style: subtitleStyle.copyWith(
                            fontWeight: FontWeight.w300, fontSize: 12),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.white54,
                    height: height * .05,
                    width: 1,
                  ),
                  CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white30,
                      child: Icon(
                        Icons.home,
                        size: 16,
                        color: Colors.white54,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Instant Service',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Call your mechanic \ninstantly',
                        style: subtitleStyle,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      SizedBox(height: 15),
      Container(
        height: height * .4,
        width: double.infinity,
        color: Colors.grey[900],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Invite your friends',
              style: headingStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: height * .25,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Invite your friends',
              style: titleStyle,
            ),
            Text(
              "FlatButton, RaisedButton, and OutlineButton have been replaced by TextButton, ElevatedButton, and OutlinedButton respectively. ??? jithin Jan 21 at 6:57",
              style: subtitleStyle,
            )
          ],
        ),
      )
    ]);
  }
}
