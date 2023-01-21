
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/screens/detailspage/view/details.dart';

class PlacesCard extends StatelessWidget {
  const PlacesCard({super.key, this.img});
  final String? img;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => DetailsPage(img: img!))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100.h,
            width: 150.w,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 207, 204, 204),
                image: DecorationImage(
                    image: NetworkImage(img.toString()), fit: BoxFit.cover)),
                    child: Stack(children:  const [
                      Positioned(
                        top: 2,
                        right: 2,
                        child: ColoredBox(color: Color.fromARGB(255, 180, 236, 182),child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("open",
                          style:
                          TextStyle(color: Color.fromARGB(255, 30, 169, 35))),
                        ),)),
                      Positioned(
                        bottom: 2,
                        left: 5,
                        child:Text("united arab",) )
                    ]),
          ),
          SizedBox(height: 20.h,),
          const Center(
            child: Text("united arab",style: TextStyle(color: Colors.black),) ,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              const Icon(Icons.home_outlined),
              SizedBox(width: 10.w,),
              const Text("accommodation",style: TextStyle(color: Colors.black),)
            ],
          )
        ],
      ),
    );
  }
}
