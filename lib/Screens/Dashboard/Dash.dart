import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kitakerja/Screens/Profile/Profile.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
        icon: Icon(IconData(0xf107, fontFamily: 'MaterialIcons'), size: 13.0),
        label: ''),
    BottomNavigationBarItem(
      icon: Icon(IconData(0xee35, fontFamily: 'MaterialIcons'), size: 10.0),
      label: '',
    ),
  ];
  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Add navigation logic here if you want to navigate to different pages based on the selected item.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavBarItems,
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
      ),
      backgroundColor: Color(0xffD1D8EB),
      body: _screens[_selectedIndex],
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              height: 160.0,
              padding: const EdgeInsets.all(22),
              margin: const EdgeInsets.symmetric(horizontal: 0.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Color(0xffffffff),
              ),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      isCollapsed: true,
                      labelText: 'Flutter Developer.',
                      filled: true,
                      fillColor: Color(0xffD1D8EB),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      prefixIcon: Icon(
                        IconData(0xe567, fontFamily: 'MaterialIcons'),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("10 Jobs Found"),
                      Icon(
                        Icons.filter_list,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            height: 170.0,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Color(0xffffffff),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.5),
                      child: Image.asset(
                          'assets/images/Logo-Pertamina-resize-2-1 1.png'),
                    ),
                    Row(
                      children: [
                        Text('Junior Flutter Developer.',
                            style: TextStyle(
                              color: Color(0xff4D7EFA),
                              fontWeight: FontWeight.w700,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text('PT. Pertamina',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w700,
                        )),
                    Text('Jakarta Raya, DKI Jakarta.',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w700,
                        )),
                    Text('Perkiraan Gaji Rp. 10.000.000',
                        style: TextStyle(
                            color: Color(0xff14C163),
                            fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: (3.0),
                    ),
                    Text(
                      '1 jam yang lalu',
                      style: TextStyle(color: Color(0xff000000CC)),
                    ),
                  ],
                ),
                Icon(
                  Icons.bookmark_border,
                  color: Color(0xff4D7EFA),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            height: 170.0,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Color(0xffffffff),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.5),
                      child: Image.asset(
                          'assets/images/Logo-Pertamina-resize-2-1 1.png'),
                    ),
                    Row(
                      children: [
                        Text('Senior Flutter Developer.',
                            style: TextStyle(
                                color: Color(0xff4D7EFA),
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text('PT. Pertamina',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w700,
                        )),
                    Text('Jakarta Raya, DKI Jakarta',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w700,
                        )),
                    Text('Perkiraan Gaji Rp. 20.000.000',
                        style: TextStyle(
                            color: Color(0xff14C163),
                            fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: (3.0),
                    ),
                    Text('3 jam yang lalu'),
                  ],
                ),
                Icon(
                  Icons.bookmark_border,
                  color: Color(0xff4D7EFA),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            height: 170.0,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Color(0xffffffff),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.5),
                      child: Image.asset(
                          'assets/images/logo telkom indonesia 1.png'),
                    ),
                    Row(
                      children: [
                        Text(
                          'Flutter Developer.',
                          style: TextStyle(
                              color: Color(0xff4D7EFA),
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text('PT. Telkom Indonesia',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w700,
                        )),
                    Text('Jakarta Selatan, DKI Jakarta',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w700,
                        )),
                    Text('Perkiraan Gaji Dibawah Perkiraan Anda',
                        style: TextStyle(
                            color: Color(0xffD07E03),
                            fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: (3.0),
                    ),
                    Text('5 jam yang lalu'),
                  ],
                ),
                Icon(
                  Icons.bookmark_border,
                  color: Color(0xff4D7EFA),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            height: 170.0,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Color(0xffffffff),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.5),
                      child: Image.asset('assets/images/Starbucks-logo 1.png'),
                    ),
                    Row(
                      children: [
                        Text(
                          'Flutter Developer.',
                          style: TextStyle(
                              color: Color(0xff4D7EFA),
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text('PT. Starbuck Indonesia',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w700,
                        )),
                    Text('Jakarta Selatan, DKI Jakarta',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w700,
                        )),
                    Text('Perkiraan Gaji Dibawah Perkiraan Anda',
                        style: TextStyle(
                            color: Color(0xff14C163),
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                Icon(
                  Icons.bookmark_border,
                  color: Color(0xff4D7EFA),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          )
        ]
        ),
      ),
    );
  }
}
