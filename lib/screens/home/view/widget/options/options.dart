import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/screens/advisory/view/advisory.dart';
import 'package:travel_app/screens/booking/view/booking.dart';

class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => const AdvisoryPage())),
          child: Column(
            children: [
              Image.asset("assets/advisory.jpeg", height: 60.h),
              Center(
                child: Text(
                  "Advisory",
                  style:
                      GoogleFonts.anton(color: Colors.black, fontSize: 10.sp),
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => const AdvisoryPage())),
          child: Column(
            children: [
              Image.network(
                  "https://cdn0.iconfinder.com/data/icons/landmarks-29/60/46__landmark__monument__famous__building__world-512.png",
                  height: 60.h),
              Center(
                child: Text(
                  "Activity",
                  style:
                      GoogleFonts.anton(color: Colors.black, fontSize: 10.sp),
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => const Booking(
                    isTrain: true,
                  ))),
          child: Column(
            children: [
              Image.network(
                "https://tse1.mm.bing.net/th?id=OIP.-a7FM6Dwf9zH-8HET-VxLgHaHa&pid=Api&P=0",
                height: 60.h,
              ),
              Center(
                child: Text(
                  "book Train",
                  style:
                      GoogleFonts.anton(color: Colors.black, fontSize: 10.sp),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
