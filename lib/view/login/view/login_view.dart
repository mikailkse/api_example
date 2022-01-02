import 'package:apiexample/view/login/resources/login_resources.dart';
import 'package:apiexample/view/register/register/register.dart';
import 'package:apiexample/view/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import '../view_model/login_view_model.dart';

class LoginView extends LoginViewModel with LoginResources {
  final EdgeInsets paddingLow = const EdgeInsets.all(8.0);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: paddingLow,
        child: Center(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: buildWrapFormBody(),
          ),
        ),
      ),
    );
  }

  Wrap buildWrapFormBody() {
    return Wrap(
      runSpacing: 5,
      alignment: WrapAlignment.end,
      children: [
        MyFormField(
          title: emailText,
          hint: emailText,
          controller: emailController,
        ),
        MyFormField(
          title: passwordText,
          hint: passwordText,
          controller: passwordController,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Register()));
                setState(() {});
              },
              child: const Text('Kayıt Olmak İçin Tıkla !'),
            ),
            const SizedBox(),
            FloatingActionButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  fetchUserLogin(emailController.text, passwordController.text);
                  setState(() {});
                }
              },
              child: const Icon(Icons.check),
            ),
          ],
        ),
      ],
    );
  }
}
