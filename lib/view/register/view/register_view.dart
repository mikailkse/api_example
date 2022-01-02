import 'package:apiexample/view/login/login/login.dart';
import 'package:apiexample/view/register/resources/register_resources.dart';
import 'package:apiexample/view/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import '../view_model/register_view_model.dart';

class RegisterView extends RegisterViewModel with RegisterResources {
  final EdgeInsets paddingLow = const EdgeInsets.all(8.0);
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: paddingLow,
        child: Center(
          child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: buildWrapRegisterFormBody()),
        ),
      ),
    );
  }

  Wrap buildWrapRegisterFormBody() {
    return Wrap(
      alignment: WrapAlignment.end,
      runSpacing: 10,
      children: [
        MyFormField(
          title: fullName,
          hint: fullName,
          controller: fullNameController,
        ),
        MyFormField(
          title: email,
          hint: email,
          controller: emailController,
        ),
        MyFormField(
          title: password,
          hint: password,
          controller: passwordController,
        ),
        MyFormField(
          title: country,
          hint: country,
          controller: countryController,
        ),
        FloatingActionButton(
          onPressed: () {
            fetchUserRegister(emailController.text, passwordController.text,
                fullNameController.text, countryController.text);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
                (route) => false);
          },
          child: const Icon(Icons.check),
        ),
      ],
    );
  }
}
