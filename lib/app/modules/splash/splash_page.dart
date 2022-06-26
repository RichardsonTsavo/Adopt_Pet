import 'package:adopt_pet/app/modules/splash/splash_store.dart';
import 'package:adopt_pet/app/shared/utils/style/style.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final SplashStore store = Modular.get();
  ConstStyle constStyle = ConstStyle();

  @override
  void initState() {
    store.getPersistentLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Image.asset(
                  constStyle.loaderAnimation,
                  width: constraints.maxWidth * 0.8,
                ),
              ),
            ));
  }
}
