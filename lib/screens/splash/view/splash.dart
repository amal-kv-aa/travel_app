import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/main/view/mainview.dart';
import 'package:travel_app/screens/splash/provider/splash.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
          ),
          ImageSlideshow(
            width: double.infinity.w,
            height: double.infinity,
            initialPage: 0,
            indicatorRadius: 5.r,
            indicatorColor: const Color.fromARGB(255, 255, 255, 255),
            indicatorBackgroundColor: const Color.fromARGB(255, 151, 147, 147),
            onPageChanged: (value) {
              context.read<SplashProvider>().updateLine(value, context);
            },
            autoPlayInterval: 3000,
            isLoop: false,
            children: const [
              ImageIntro(
                  img:
                      "assets/4f7238120511bfe8dae2289a9615e3ac.jpg"),
              ImageIntro(
                  img:
                      "assets/dec462cce6e3bd7683e51ae88f312fb8.jpg"),
              ImageIntro(
                  img:
                      "assets/fe4c9763fb96dd02bd603a9424494b38.jpg"),
              ImageIntro(
                  img:
                      "assets/e31e0b365fa0371dec49b354c1e99f52.jpg"),
            ],
          ),
          const PlanIcon(),
          Positioned(
            left: 120,
            bottom: 100.h,
            height: 1,
            width: 300.w,
            child: Container(
              color: Colors.white,
              child: Row(
                children: const [],
              ),
            ),
          ),
          context.watch<SplashProvider>().page == 3
              ? Positioned(
                  bottom: 200.h,
                  child: SizedBox(
                    width: 140.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => MainView()));
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                      child: const Text(
                        "Explore",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
                        
                      ),
                    ),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

class PlanIcon extends StatelessWidget {
  const PlanIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: context.watch<SplashProvider>().linewidth,
      bottom: 84.h,
      child:  RotatedBox(
        quarterTurns: 1,
        child: Icon(
          Icons.airplanemode_active,
          size: 35.sp,
          color: Colors.white,
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

class ImageIntro extends StatelessWidget {
  const ImageIntro({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 40.h,),
           context.watch<SplashProvider>().page != 3
              ? 
          Container(
            height: 100.h,
            width: 250.w,
            decoration: const BoxDecoration(
             boxShadow: [
              BoxShadow(
                color: Colors.teal,
                blurRadius: 100,
                
              )
             ]
            ),
            child: Center(
              child: Text(
                "enjoy Traveling",
                style: 
                GoogleFonts.anton(color: Colors.white, fontSize: 40.sp)
                //TextStyle(color: Colors.white, fontSize: 30.sp),
              ),
            ),
          )
          :const SizedBox()
        ],
      ),
    );
  }
}
