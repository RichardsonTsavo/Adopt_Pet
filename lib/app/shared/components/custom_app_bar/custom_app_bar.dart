import 'package:adopt_pet/app/shared/components/custom_app_bar/custom_app_bar_store.dart';
import 'package:adopt_pet/app/shared/utils/routes/routes_name.dart';
import 'package:adopt_pet/app/shared/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  String title;
  CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final ConstStyle constStyle = Modular.get();
  final CustomAppBarStore store = CustomAppBarStore();
  final RoutesName routesName = RoutesName();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: constStyle.secundaryColor,
      leading: Center(
        child: Image.asset(constStyle.logo, color: constStyle.tertiaryColor),
      ),
      centerTitle: true,
      title: Text(widget.title),
      actions: [
        PopupMenuButton(
          tooltip: "Usuário",
          icon:
              Icon(Icons.account_box_rounded, color: constStyle.tertiaryColor),
          itemBuilder: (context) => [
            PopupMenuItem(
                onTap: () {
                  if (store.isHome()) {
                    Modular.to.pushReplacementNamed(routesName.perfilPage);
                  } else {
                    Modular.to.pushReplacementNamed(routesName.homePage);
                  }
                },
                child: IgnorePointer(
                    ignoring: true,
                    child: ListTile(
                      leading: Icon(store.isHome() ? Icons.person : Icons.house,
                          color: constStyle.primaryColor),
                      title: Text(store.isHome() ? "Perfil" : "Home",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ))),
            PopupMenuItem(
              onTap: () {
                store.logOut();
              },
              child: IgnorePointer(
                ignoring: true,
                child: ListTile(
                  leading: Icon(Icons.logout, color: constStyle.primaryColor),
                  title: const Text("Sair",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
