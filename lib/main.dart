import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/advisory/provider/sliding_provider.dart';
import 'package:travel_app/screens/home/provider/provider.dart';
import 'package:travel_app/screens/main/provider/mainprovider.dart';
import 'package:travel_app/screens/splash/provider/splash.dart';
import 'package:travel_app/screens/splash/view/splash.dart';

void main() {
  //=======landscap rotation lock=========//
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SplashProvider(),
      ),
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => MainProvider()),
      ChangeNotifierProvider(create: (_) => SlidingProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, index) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.teal,
              textTheme:
                  const TextTheme(bodyMedium: TextStyle(color: Colors.white))),
          home: const Splash(),
        );
      },
      designSize: const Size(375, 812),
    );
  }
}
