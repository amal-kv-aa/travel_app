import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/detailspage/view/details.dart';
import 'package:travel_app/screens/home/provider/provider.dart';

class RandomPlaces extends StatelessWidget {
  const RandomPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => DetailsPage(img: img!))),
                  child: Container(
                    height: 240.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(img.toString()),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:  [
                           Text("California",style: GoogleFonts.anton(),),
                          SizedBox(height: 5.h,),
                          const Flexible(
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: TextStyle(
                                color: Colors.white70,fontStyle: FontStyle.italic
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
