import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/home/view/Home.dart';
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
            autoPlayInterval: 5000,
            isLoop: false,
            children: const [
              ImageIntro(
                  img:
                      "https://i.pinimg.com/564x/4f/72/38/4f7238120511bfe8dae2289a9615e3ac.jpg"),
              ImageIntro(
                  img:
                      "https://i.pinimg.com/564x/fe/4c/97/fe4c9763fb96dd02bd603a9424494b38.jpg"),
              ImageIntro(
                  img:
                      "https://i.pinimg.com/564x/de/c4/62/dec462cce6e3bd7683e51ae88f312fb8.jpg"),
              ImageIntro(
                  img:
                      "https://i.pinimg.com/564x/e3/1e/0b/e31e0b365fa0371dec49b354c1e99f52.jpg"),
            ],
          ),
          const PlanIcon(),
          Positioned(
            left: 120,
            bottom: 90.h,
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
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => const Home()));
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.lime),
                    child: const Text(
                      "Start",
                      style: TextStyle(color: Colors.black),
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
      bottom: 60.h,
      child: const RotatedBox(
        quarterTurns: 1,
        child: Icon(
          Icons.airplanemode_active,
          size: 64,
          color: Colors.white,
          shadows: [
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
          image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
          color: Colors.white),
      child:  Center(
        child: Text("enjoy Traveling",style: TextStyle(color: Colors.white,fontSize: 30.sp),),
      ),
    );
  }
}
