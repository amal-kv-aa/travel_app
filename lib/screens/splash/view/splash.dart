import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/main/view/mainview.dart';
import 'package:travel_app/screens/splash/provider/splash.dart';
import 'package:travel_app/screens/splash/view/plain/plain.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<SplashProvider>(
        builder: (context, value, child) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(),
              ),
              Positioned(
                top: 100.h,
                child: Container(
                  height: 300.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: AssetImage(
                              context.watch<SplashProvider>().img[value.page]),
                          fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                bottom: 100,
                child: SizedBox(
                    height: 200.h,
                    width: 300.w,
                    child: Center(
                      child: PageView(
                        physics: const BouncingScrollPhysics(),
                        controller: value.pageController,
                        children: context.read<SplashProvider>().getquates(),
                        onPageChanged: (int page) {
                          context
                              .read<SplashProvider>()
                              .updateLine(page, context);
                        },
                      ),
                    )),
              ),
              const PlanIcon(),
              Positioned(
                left: 120,
                bottom: 130.h,
                height: 1,
                width: 300.w,
                child: Container(
                  color: Colors.white54,
                ),
              ),
              value.page == 3
                  ? Positioned(
                      bottom: 25.h,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (ctx) => MainView())),
                        child: CircleAvatar(
                          radius: 30.r,
                          child: const Center(
                            child: Icon(Icons.arrow_forward_ios_sharp),
                          ),
                        ),
                      ))
                  : Positioned(
                      bottom: 185.h,
                      child: const Text(
                        "swipe right to continue...",
                        style:
                            TextStyle(color: Color.fromARGB(255, 6, 103, 96)),
                      ),
                    )
            ],
          );
        },
      ),
    );
  }
}
