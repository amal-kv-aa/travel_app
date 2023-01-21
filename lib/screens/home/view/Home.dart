import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/booking/view/booking.dart';
import 'package:travel_app/screens/home/provider/provider.dart';
import 'package:travel_app/screens/home/view/widget/destion/destination.dart';
import 'package:travel_app/screens/home/view/widget/options/options.dart';
import 'package:travel_app/screens/home/view/widget/randomplaces/rondomlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  double maxSlide = 225;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        animationBehavior: AnimationBehavior.normal,
        vsync: this,
        duration: const Duration(milliseconds: 1200));
    togle();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<HomeProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            final slide = animationController.value * maxSlide;
            return ListView(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: slide + 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(
                                  "assets/3d53925183c38c9fc984e68f1bc0b0c6.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(60.r),
                            bottomLeft: Radius.circular(60.r),
                          )),
                    ),
                    Positioned(
                      left: 30.w,
                      child: Transform(
                        transform: Matrix4.identity()..translate(0.0, slide),
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (ctx) => const Booking())),
                          child: SizedBox(
                            height: 100.h,
                            width: 150.w,
                            child: Card(
                              shadowColor: Colors.black,
                              elevation: 10,
                              color: Colors.white,
                              child: Center(
                                  child: Image.network(
                                "https://tse3.mm.bing.net/th?id=OIP.gO_1YZ5JIbT7Sca52NxaygHaEe&pid=Api&P=0",
                                height: 60.h,
                              )),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 30.w,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.02, slide, 1.0),
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (ctx) => const Booking(isHotel: true,))),
                          child: SizedBox(
                            height: 100.h,
                            width: 150.w,
                            child: Card(
                              color: Colors.white,
                              shadowColor: Colors.black,
                              elevation: 10,
                              child: Center(
                                  child: Image.network(
                                "https://tse1.mm.bing.net/th?id=OIP.7DfQabKVGZDcVypg4DBpKwHaHa&pid=Api&P=0",
                                height: 60.h,
                              )),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 70.h,
                ),
                //====Options====buttons===//
                const Options(),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  child: Text(
                    "Destinations open for Travel",
                    style: GoogleFonts.anton(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w200),
                  ),
                ),
                //=============destination=====home=======list======//
                const DestinationsOpen(),
                SizedBox(
                  height: 20.h,
                ),
                 Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  child: Text(
                    "Popular places",
                    style: GoogleFonts.anton(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w200),
                  ),
                ),
                //=============Randomplaces====home=======list=====//
                const RandomPlaces(),
              ],
            );
          }),
    );
  }

  togle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();
}
