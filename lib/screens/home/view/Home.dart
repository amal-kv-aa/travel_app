import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/detailspage/view/details.dart';
import 'package:travel_app/screens/home/provider/provider.dart';
import 'package:travel_app/screens/home/view/widget/custom_card.dart';

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
      
        vsync: this, duration: const Duration(milliseconds: 1500));
    togle();
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
                    Positioned(
                      right: 30.w,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.02, slide, 1.0),
                        alignment: Alignment.centerRight,
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
                            )
                                ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 60.h,
                ),
                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                   child: Text("Destinations open for your trip",style: TextStyle(color: Colors.black,fontSize: 22.sp,fontWeight: FontWeight.bold),),
                 ),
                
                SizedBox(
                  height: 180.h,
                  width: double.infinity,
                  child:
                      Consumer<HomeProvider>(builder: (context, value, child) {
                    if (value.data == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (value.data!.err != null) {
                      return const Center(
                        child: Text("checkyour internet found.."),
                      );
                    }
                    final img = value.data?.photos;
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: img!.length -1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PlacesCard(
                            img: img[index+1].src.large,
                          ),
                        );
                      },
                    );
                  }),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Consumer<HomeProvider>(
                  builder: (context, value, child) {
                    if (value.data == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (value.data!.err != null) {
                      return const SizedBox();
                    }
                    return ListView.builder(
                        addAutomaticKeepAlives: true,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          final img = value.data?.photos[index + 10].src.medium;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (ctx) =>
                                            DetailsPage(img: img!))),
                                child: Container(
                                  height: 240.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(img.toString()),
                                          fit: BoxFit.cover)),
                                )),
                          );
                        });
                  },
                )
              ],
            );
          }),
    );
  }

  togle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();
}

class CardTravel extends StatelessWidget {
  const CardTravel({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 250.h,
      left: 20,
      child: SizedBox(
        height: 100.h,
        width: 150.w,
        child: Card(
          child: Center(
            child: Icon(Icons.local_airport_sharp,
                size: 40.sp,
                color: Colors.white,
                shadows: const [
                  BoxShadow(
                      color: Colors.black, offset: Offset(0, 5), blurRadius: 10)
                ]),
          ),
        ),
      ),
    );
  }
}
