import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/advisory/view/advisory.dart';
import 'package:travel_app/screens/booking/view/booking.dart';
import 'package:travel_app/screens/home/view/home.dart';
import 'package:travel_app/screens/main/provider/mainprovider.dart';
import 'package:travel_app/screens/main/view/bottomnav/bottom_nav.dart';

class MainView extends StatelessWidget {
   MainView({super.key});
  List<Widget>screens=[
    const Home(),const AdvisoryPage(),const Booking(),const Booking(isHotel: true,)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[context.watch<MainProvider>().currentIndex],
      bottomNavigationBar: const BottomNavItem(),
    );
  }
}