
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    duration: const Duration(milliseconds: 250));
  }
  @override
  Widget build(BuildContext context) {
        double maxSlide = 225;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: togle,
        child: AnimatedBuilder(animation: animationController, 
        builder: (context, _) {
          final scale = 1 - (animationController.value * 0.3);
           final slide = animationController.value * maxSlide;
          return
          Column(
            children: [
              Flexible(
                child: Container(
                  height: 350.h,
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
                              child: Text("Book now"),
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(child: Container(color: const Color.fromARGB(255, 198, 188, 188),))
            ],
          );
        },),
      ),
    );
  }
   togle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();
}