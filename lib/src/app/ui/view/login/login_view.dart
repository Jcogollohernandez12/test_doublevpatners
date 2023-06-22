import 'package:app_test/src/app/ui/controller/session_ctr.dart';
import 'package:app_test/src/app/ui/view/register/complete_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../context/app_assets.dart';
import '../../controller/shared_ctr.dart';
import '../../utils/validators.dart';

import '../../widgets/custom/custom_button.dart';
import '../../widgets/custom/custom_text_form_field.dart';
import '../../widgets/custom/custom_title_text.dart';
import '../../widgets/others/shared.dart';
import '../register/register_user.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/loginScreen";

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final SharedController _sharedController =
      SharedController.initializeController();

  final SessionController _screenController =
      SessionController.initializeController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildBackground(context),
          buildBody(context),
          Obx(() => _sharedController.isLoading.value
              ? buildLoadingIndicator()
              : Container())
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 70.0,
      ),
      child: Column(
        children: [
          Image.asset(
            AppAssets.colorLogo,
            width: 80.0,
          ),
          Text(
            "Practica",
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceSansPro(
                color: AppAssets.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 40.0),
          ),
          TitleText(
            "Iniciar Sesion",
            margin: const EdgeInsets.only(top: 50.0),
            textStyle: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppAssets.whiteColor),
          ),
          Obx(
            () => CustomTextFormField(
              placeHolder: "Correo electronico",
              errorText: _sharedController.findErrorMessage("email"),
              focusNode: _emailFocusNode,
              margin: const EdgeInsets.only(top: 20.0),
              constraints: const BoxConstraints(maxWidth: 300.0),
              onChangedFunction: (value) {
                String? error = validateEmail(value);
                _sharedController.setErrorMessage("email", error);
                if (error == null) {
                  _screenController.credentials.email = value;
                }
              },
              onSubmittedFunction: (value) {
                String? error = validateEmail(value);
                _sharedController.setErrorMessage("email", error);
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              },
              inputType: TextInputType.text,
              fillColor: AppAssets.whiteColor,
              inputBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          Obx(
            () => CustomTextFormField(
              suffixIcon: _screenController.isObscured.value
                  ? const Icon(Icons.visibility_off)
                  : null,
              placeHolder: "Contraseña",
              errorText: _sharedController.findErrorMessage("password"),
              obscurer: _screenController.isObscured.value,
              focusNode: _passwordFocusNode,
              margin: const EdgeInsets.only(top: 10.0),
              constraints: const BoxConstraints(maxWidth: 300.0),
              onChangedFunction: (value) {
                String? error = validateEmpty(value);
                _sharedController.setErrorMessage("password", error);
                if (error == null) {
                  _screenController.credentials.password = value;
                }
              },
              isPasswordInput: true,
              suffixIconFunction: () {
                _screenController.isObscured.value =
                    !_screenController.isObscured.value;
              },
              onSubmittedFunction: (value) {
                String? error = validateEmpty(value);
                _sharedController.setErrorMessage("password", error);
                if (error == null &&
                    _sharedController.findErrorMessage("email") == null) {
                  _screenController.logIn();
                }
                FocusScope.of(context).unfocus();
              },
              inputType: TextInputType.text,
              fillColor: AppAssets.whiteColor,
              inputBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: TextButton(
              onPressed: () {},
              child: Text(""),
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(RegisterScreen.routeName),
            child: TitleText(
              "Registrarte",
              margin: const EdgeInsets.only(top: 10.0),
              textStyle: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppAssets.tertiaryColor),
            ),
          ),
          CustomButton(
              label: "Iniciar",
              margin: const EdgeInsets.symmetric(vertical: 15.0),
              constraints: const BoxConstraints(maxWidth: 300.0),
              backgroundColor: AppAssets.blackColor,
              onPressed: (_sharedController.findErrorMessage("email") != null ||
                      _sharedController.findErrorMessage("password") != null)
                  ? null
                  : () => _screenController.logIn()),
        ],
      ),
    ));
  }

  Widget buildBackground(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    AppAssets.primaryColor,
                    AppAssets.primaryColor,
                    AppAssets.tertiaryColor,
                  ]),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AppAssets.loginBackgroundImage))),
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.black38),
        )
      ],
    );
  }
}
