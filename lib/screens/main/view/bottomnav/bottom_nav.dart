import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:travel_app/screens/main/provider/mainprovider.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.category), label: 'Explore'),
        BottomNavigationBarItem(
            icon:Icon(Icons.airplane_ticket_rounded),
            label: 'booking'),
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled), label: 'hotels'),
      ],
      currentIndex: context.watch<MainProvider>().currentIndex,
      selectedItemColor: Colors.teal,
      unselectedItemColor: const Color.fromARGB(255, 168, 178, 176),
      elevation: 30,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (newIndex) {
        context.read<MainProvider>().updateIndex(newIndex);
      },
    );
  }
}
