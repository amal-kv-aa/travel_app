
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({super.key,required this.icon,required this.title,required this.subtitle, this.quarterTurns});
final IconData icon;
final String title;
final String subtitle;
final int? quarterTurns;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        
        SizedBox(height: 50.h,
        width: double.infinity,
        child: ListTile(
          leading: RotatedBox(
            quarterTurns:quarterTurns ?? 0,child:  Icon(icon,color: Colors.teal,)),
          title: Text(title,style: GoogleFonts.anton(fontWeight: FontWeight.w200),),
          subtitle: Text(subtitle,style: TextStyle(color: const Color.fromARGB(96, 55, 53, 53),fontSize: 14.sp,fontWeight: FontWeight.normal),),
        ),
        ),SizedBox(height:10.h),
         Divider(thickness: 2.r,color: const Color.fromARGB(153, 227, 224, 224)),
      ],
    );
  }
}