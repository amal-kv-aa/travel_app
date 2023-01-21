import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/advisory/provider/sliding_provider.dart';
import 'package:travel_app/screens/advisory/view/widget/slidingcard/sliding.dart';
import 'package:travel_app/screens/detailspage/view/details.dart';

class AdvisoryPage extends StatelessWidget {
  const AdvisoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.teal,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Places you never miss",
                style: GoogleFonts.anton(fontSize: 22.sp,color: Colors.teal)),
          ),
          SizedBox(
            height: 50.h,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: PageView(
                controller: context.watch<SlidingProvider>().pageController,
                children: getPlaces(context)),
          ),
        ],
      ),
    );
  }

  List<Widget> getPlaces(BuildContext context) {
    List<Widget> widgets = [];
    final data = context.watch<SlidingProvider>().advisoryData;
    if (data == null) {
    widgets.add(const Center(child: CircularProgressIndicator(),));
    return widgets;
    }else{
    int count = 0;
    for (var photo in data.photos) {
      count++;
      widgets.add(GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => DetailsPage(img: photo.src.medium))),
        child: SlidingCard(
          assetName: photo.src.medium,
          name: "india",
          date: "20-20-2",
          offset: context.watch<SlidingProvider>().pageOffset - count,
        ),
      ));
    }
    return widgets;
  }
  }
}
