import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/splash/provider/splash.dart';

class PlanIcon extends StatelessWidget {
  const PlanIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: context.watch<SplashProvider>().linewidth,
      bottom: 113.h,
      child: RotatedBox(
        quarterTurns: 1,
        child: Icon(
          Icons.airplanemode_active,
          size: 35.sp,
          color:  Colors.white,
          shadows: const [
            BoxShadow(
                blurRadius: 20,
                color: Color.fromARGB(255, 0, 0, 0),
                spreadRadius: 10,
                offset: Offset(3, 6))
          ],
        ),
      ),
    );
  }
}
