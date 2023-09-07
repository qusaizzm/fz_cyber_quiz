import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fz_cyber_quiz/firebase_options.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'adsmob/ads/ad_state.dart';

import 'ui/screen/intro/splash.dart';
import 'ui/shared/constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final initFuture = MobileAds.instance.initialize();
  // final adState = AdState(initFuture);

  runApp(Test01());
  // runApp(Provider.value(
  //     value: adState, builder: (context, child) =>  Test01()));
}

class Test01 extends StatelessWidget {
  const Test01({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quiz App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColor.darkpripmaryColor,
          appBarTheme: AppBarTheme(
            color: const Color(0xFF151026),
          ),
        ),
        home: SplashScreen());
  }
}
