import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardContent extends StatelessWidget {
  final String name;
  final String date;
  final double offset;

  const CardContent(
      {Key? key,
      required this.name,
      required this.date,
      required this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(width: 20.w,),
        Transform.translate(
          offset: Offset(48 * offset, 0),
          child: ElevatedButton(
         
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 36, 124, 102),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            ),
            onPressed: () {},
            child: Transform.translate(
              offset: Offset(24 * offset, 0),
              child: const Text('Reserve'),
            ),
          ),
        ),
        SizedBox(width: 20.w,),
        Expanded(
          child: Transform.translate(
            offset: Offset(32 * offset, 0),
            child:  Text(
              name,maxLines: 2,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
