import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/home/view/widget/card_layout/custom_card.dart';

import '../../../provider/provider.dart';

class DestinationsOpen extends StatelessWidget {
  const DestinationsOpen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      width: double.infinity,
      child: Consumer<HomeProvider>(builder: (context, value, child) {
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
          itemCount: img!.length - 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding:   EdgeInsets.symmetric(horizontal: 10.w),
              child: PlacesCard(
                img: img[index + 1].src.large,
              ),
            );
          },
        );
      }),
    );
  }
}
