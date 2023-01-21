import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/screens/booking/view/widget/bookingcard.dart';

class Booking extends StatelessWidget {
  const Booking({super.key, this.isHotel = false, this.isTrain = false});
  final bool isHotel;
  final bool isTrain;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            getTitle(isHotel, isTrain),
            style: GoogleFonts.anton(),
          ),
          centerTitle: true,
        ),
        body: getBooking(isHotel, isTrain));
  }

  Widget getBooking(bool isHotel, bool isTrain) {
    if (isHotel) {
      return Column(
        children: const [
          BookingCard(
              icon: Icons.home, title: "CHECK-IN", subtitle: "check-in-day"),
          BookingCard(
              icon: Icons.home, title: "CHECK-OUT", subtitle: "check-out-day"),
          BookingCard(
              icon: Icons.calendar_month,
              title: "Select Date",
              subtitle: "CHECK-IN DATE"),
          BookingCard(
              icon: Icons.person_add, title: "2 Adult", subtitle: "persons"),
          BookingCard(
              icon: Icons.payment_outlined,
              title: "Master Card,Credit Card,Visa...",
              subtitle: "Depature Date"),
        ],
      );
    } else if (isTrain) {
      return Column(
        children: const [
          BookingCard(
            icon: Icons.train,
            title: "Choose Depature",
            subtitle: "Depature",
          ),
          BookingCard(
            icon: Icons.train_sharp,
            title: "Choose Arivel",
            subtitle: "Depature",
          ),
          BookingCard(
              icon: Icons.calendar_month,
              title: "Select Date",
              subtitle: "Depature Date"),
          BookingCard(
              icon: Icons.person, title: "1 Adult", subtitle: "Passengers"),
          BookingCard(
              icon: Icons.shopping_bag_rounded,
              title: "Economy",
              subtitle: "First class"),
          BookingCard(
              icon: Icons.payment_outlined,
              title: "Master Card,Credit Card,Visa...",
              subtitle: "Depature Date"),
        ],
      );
    } else {
      return Column(
        children: const [
          BookingCard(
            icon: Icons.airplanemode_on_outlined,
            title: "Choose Depature",
            subtitle: "Depature",
            quarterTurns: 1,
          ),
          BookingCard(
            icon: Icons.airplanemode_active_rounded,
            title: "Choose Arivel",
            subtitle: "Depature",
            quarterTurns: 2,
          ),
          BookingCard(
              icon: Icons.calendar_month,
              title: "Select Date",
              subtitle: "Depature Date"),
          BookingCard(
              icon: Icons.person, title: "1 Adult", subtitle: "Passengers"),
          BookingCard(
              icon: Icons.shopping_bag_rounded,
              title: " Economy",
              subtitle: "Cabin class"),
          BookingCard(
              icon: Icons.payment_outlined,
              title: "Master Card,Credit Card,Visa...",
              subtitle: "Depature Date"),
        ],
      );
    }
  }

  String getTitle(bool isHotel, bool isTrain) {
    if (isHotel) {
      return "Hotel booking";
    } else if (isTrain) {
      return "Train Booking";
    } else {
      return "Flight Booking";
    }
  }
}
