import 'package:adopt_pet/app/shared/components/custom_app_bar/custom_app_bar.dart';
import 'package:adopt_pet/app/shared/utils/style/style.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:adopt_pet/app/modules/perfil/perfil_store.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  final String title;
  const PerfilPage({Key? key, this.title = 'PerfilPage'}) : super(key: key);
  @override
  PerfilPageState createState() => PerfilPageState();
}

class PerfilPageState extends State<PerfilPage> {
  final PerfilStore store = Modular.get();
  ConstStyle constStyle = Modular.get();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: constStyle.primaryColor,
        appBar: CustomAppBar(title: "Perfil"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Informações do usuário",
                  style: TextStyle(fontSize: constraints.maxWidth * 0.05),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person, color: constStyle.secundaryColor),
                title: Text(
                  "Nome: ${store.returnUserModel().userName!}",
                  style: TextStyle(fontSize: constraints.maxWidth * 0.04),
                ),
              ),
              ListTile(
                leading: Icon(Icons.phone, color: constStyle.secundaryColor),
                title: Text(
                  "Telefone: ${store.returnUserModel().userPhone!}",
                  style: TextStyle(fontSize: constraints.maxWidth * 0.04),
                ),
              ),
              ListTile(
                leading: Icon(Icons.email, color: constStyle.secundaryColor),
                title: Text(
                  "E-mail: ${store.returnUserModel().userEmail!}",
                  style: TextStyle(fontSize: constraints.maxWidth * 0.04),
                ),
              ),
              ListTile(
                leading:
                    Icon(Icons.date_range, color: constStyle.secundaryColor),
                title: Text(
                  "Data de Nascimento: ${store.returnUserModel().userBirthday!}",
                  style: TextStyle(fontSize: constraints.maxWidth * 0.04),
                ),
              ),
              ListTile(
                leading:
                    Icon(Icons.location_on, color: constStyle.secundaryColor),
                title: Text(
                  "Endereço: ${store.returnUserModel().userAddress!}",
                  style: TextStyle(fontSize: constraints.maxWidth * 0.04),
                ),
              ),
              Text(
                "Perfil de cor do App",
                style: TextStyle(fontSize: constraints.maxWidth * 0.05),
              ),
              Wrap(
                children: [
                  SizedBox(
                    width: constraints.maxWidth / 2.5,
                    child: RadioListTile(
                      groupValue: constStyle.indexBaseColor,
                      activeColor: constStyle.secundaryColor,
                      value: 0,
                      title: Text(
                        "Tipo 1",
                        style: TextStyle(fontSize: constraints.maxWidth * 0.04),
                      ),
                      onChanged: (int? value) {
                        setState(() {
                          constStyle.setIndexBaseColor(value!);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: constraints.maxWidth / 2.5,
                    child: RadioListTile(
                      groupValue: constStyle.indexBaseColor,
                      activeColor: constStyle.secundaryColor,
                      value: 1,
                      title: Text(
                        "Tipo 2",
                        style: TextStyle(fontSize: constraints.maxWidth * 0.04),
                      ),
                      onChanged: (int? value) {
                        setState(() {
                          constStyle.setIndexBaseColor(value!);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: constraints.maxWidth / 2.5,
                    child: RadioListTile(
                      groupValue: constStyle.indexBaseColor,
                      activeColor: constStyle.secundaryColor,
                      value: 2,
                      title: Text(
                        "Tipo 3",
                        style: TextStyle(fontSize: constraints.maxWidth * 0.04),
                      ),
                      onChanged: (int? value) {
                        setState(() {
                          constStyle.setIndexBaseColor(value!);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: constraints.maxWidth / 2.5,
                    child: RadioListTile(
                      groupValue: constStyle.indexBaseColor,
                      activeColor: constStyle.secundaryColor,
                      value: 3,
                      title: Text(
                        "Tipo 4",
                        style: TextStyle(fontSize: constraints.maxWidth * 0.04),
                      ),
                      onChanged: (int? value) {
                        setState(() {
                          constStyle.setIndexBaseColor(value!);
                        });
                      },
                    ),
                  ),
                ],
              ),
              Expanded(child: store.admInfo(constraints))
            ],
          ),
        ),
      );
    });
  }
}
