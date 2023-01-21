
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key,required this.img});
final String img;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this,
    duration: const Duration(milliseconds: 1000));
    togle();
  }
@override
  void dispose() {
     animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        double maxSlide = 400;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(elevation: 0,backgroundColor: Colors.transparent,),
      backgroundColor: Colors.white,
      body: AnimatedBuilder(animation: animationController, 
      builder: (context, _) {
         final slide =   maxSlide * animationController.value;
        return
        Column(
          children: [
            Flexible(
              child: Container(
                height: slide ,
                width: double.infinity,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  image: 
                DecorationImage(image: NetworkImage(widget.img),fit: BoxFit.cover),
                ),
                child:  Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      bottom: 0,
                      height: 60.h,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height:  MediaQuery.of(context).size.height,
                        decoration:  BoxDecoration(
                          color: Colors.white,
                      borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(90.r),
                                    topRight: Radius.circular(90.r),
                                  )
                        ),
                      child:const Center(
                            child: Text("Book now",style: TextStyle(color: Colors.black),),
                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(child:
             Container(
                height: MediaQuery.of(context).size.height,
                color:  Colors.white,
                
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                         Text("location : ",style: GoogleFonts.anton(fontSize: 20.sp,color: Colors.black),),
                        SizedBox(width: 20.w,),
                         Text("London",style: GoogleFonts.anton(fontSize: 20.sp,color: Colors.black),)
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                         Text("isOpen : ",style: GoogleFonts.anton(fontSize: 20.sp,color: Colors.black),),
                        SizedBox(width: 20.w,),
                         Text("yes",style: GoogleFonts.anton(fontSize: 20.sp,color: Colors.black),)
                      ],
                    ),
                    SizedBox(height: 30.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("₹ 49000/-",style: GoogleFonts.anton(fontSize: 20.sp,color: const Color.fromARGB(255, 76, 221, 40)),)
                      ],
                    ),SizedBox(height: 20.h,),
                     Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        style: TextStyle(color: Colors.black),),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                     SizedBox(
                      height: 50.h,
                      width: 180.w,
                       child: ElevatedButton(
                        onPressed: () {
                        },
                        style:
                            ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                        child: const Text(
                          "Book Now",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
                          
                        ),
                                         ),
                     ),
                  ],

                ),
                ),
            )
          ],
        );
      },),
    );
  }
   togle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();
}