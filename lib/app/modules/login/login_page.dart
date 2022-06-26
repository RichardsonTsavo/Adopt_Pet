import 'package:adopt_pet/app/modules/login/login_store.dart';
import 'package:adopt_pet/app/shared/utils/custom_text_form_field/custom_text_form_field.dart';
import 'package:adopt_pet/app/shared/utils/style/style.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();
  ConstStyle constStyle = Modular.get();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        backgroundColor: constStyle.primaryColor,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              padding: const EdgeInsets.all(15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          constStyle.logo,
                          width: constraints.maxWidth / 2,
                          color: constStyle.secundaryColor,
                        ),
                        Text(
                          "AdoptPet",
                          style: TextStyle(
                              color: constStyle.secundaryColor,
                              fontSize: constraints.maxWidth / 10),
                        )
                      ],
                    ),
                    CustomTextFormField(
                      validator: (data) {
                        if (!EmailValidator.validate(data!)) {
                          return "Email inválido";
                        }
                        return null;
                      },
                      cursorColor: constStyle.tertiaryColor,
                      textColor: constStyle.tertiaryColor,
                      hintColor: constStyle.tertiaryColor,
                      needTheSpace: false,
                      obscureText: false,
                      onChanged: (data) {
                        store.filds["email"] = data;
                      },
                      maxLine: 1,
                      minLine: 1,
                      hint: "Email",
                      prefixIcon: Icon(
                        Icons.email,
                        color: constStyle.tertiaryColor,
                      ),
                    ),
                    Observer(
                      builder: (context) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(constraints.maxWidth / 2, 50),
                              primary: constStyle.secundaryColor),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if (store.isLoading) {
                                return;
                              }
                              store.signIn();
                            }
                          },
                          child: store.isLoading
                              ? const CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: constraints.maxWidth / 20),
                                )),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
