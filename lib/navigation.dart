import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationBarTravel extends StatefulWidget {
  @override
  _BottomNavigationBarTravelState createState() =>
      _BottomNavigationBarTravelState();
}

class _BottomNavigationBarTravelState extends State<BottomNavigationBarTravel> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var bottomNavStyle =
  GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.4,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            spreadRadius: 2,
            blurRadius: 15,
            offset: Offset(0, 5))
      ]),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label : 'Home',
            icon: _selectedIndex == 0
                ? new SvgPicture.asset('assets/svg/icon_home_colored.svg')
                : new SvgPicture.asset('assets/svg/icon_home.svg',color: Colors.deepPurple,),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? new SvgPicture.asset('assets/svg/icon_heart_colored.svg')
                : new SvgPicture.asset('assets/svg/icon_heart.svg',color: Colors.deepPurple,),
            label: 'Heart',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? new SvgPicture.asset('assets/svg/icon_plus_colored.svg')
                : new SvgPicture.asset('assets/svg/icon_plus.svg',color: Colors.deepPurple,),
            label: 'Plus',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? new SvgPicture.asset(
                'assets/svg/icon_notification_colored.svg')
                : new SvgPicture.asset('assets/svg/icon_notification.svg',color: Colors.deepPurple,),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            label: 'User',
            icon: _selectedIndex == 4
                ? new SvgPicture.asset('assets/svg/icon_user_colored.svg',)
                : new SvgPicture.asset('assets/svg/icon_user.svg',color: Colors.deepPurple,),
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.redAccent.shade100.withOpacity(0.8),
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
      ),
    );
  }
}