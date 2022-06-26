import 'package:adopt_pet/app/modules/home/home_store.dart';
import 'package:adopt_pet/app/modules/home/pages/cat_page.dart';
import 'package:adopt_pet/app/modules/home/pages/dog_page.dart';
import 'package:adopt_pet/app/shared/components/custom_app_bar/custom_app_bar.dart';
import 'package:adopt_pet/app/shared/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore store = Modular.get();
  ConstStyle constStyle = Modular.get();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: constStyle.primaryColor,
        appBar: CustomAppBar(title: "Home"),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: constStyle.secundaryColor),
                    child: SizedBox(
                      width: constraints.maxWidth / 3,
                      child: Text(
                        'Cachorros',
                        style: TextStyle(fontSize: constraints.maxWidth * 0.04),
                      ),
                    ),
                    onPressed: () {
                      store.pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: constStyle.secundaryColor),
                    child: SizedBox(
                      width: constraints.maxWidth / 3,
                      child: Text(
                        'Gatos',
                        style: TextStyle(fontSize: constraints.maxWidth * 0.04),
                      ),
                    ),
                    onPressed: () {
                      store.pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: store.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [DogPage(), CatPage()],
              ),
            )
          ],
        ),
      );
    });
  }
}
