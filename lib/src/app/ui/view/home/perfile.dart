import 'package:app_test/src/app/ui/widgets/custom/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../context/app_assets.dart';
import '../../controller/session_ctr.dart';
import '../../controller/shared_ctr.dart';
import '../../widgets/custom/custom_title_text.dart';
import '../../widgets/others/shared.dart';

class PerfileUserView extends StatelessWidget {
  static const routeName = "/PerfileUserView";
  PerfileUserView(
      {super.key,
      required this.name,
      required this.lastName,
      required this.date});

  final String name;
  final String lastName;
  final String date;

  final SharedController _sharedController =
      SharedController.initializeController();

  final SessionController _screenController =
      SessionController.initializeController();
  @override
  Widget build(BuildContext context) {
    return buildMyAccountBody(context);
  }

  Widget buildMyAccountBody(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        buildAccountDetail(size),
        Column(
          children: [
            Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                constraints:
                    const BoxConstraints(maxWidth: 200.0, maxHeight: 60),
                child: CustomButton(
                  label: "Cerrar Sesion",
                  onPressed: () {
                    _screenController.logOut();
                  },
                )),
            Obx(() => _sharedController.isLoading.value
                ? buildLoadingIndicator()
                : Container())
          ],
        ),
      ],
    );
  }

  Widget buildAccountDetail(Size size) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          constraints: const BoxConstraints(maxWidth: 80.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              AppAssets.loginBackgroundImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText("$name $lastName",
                margin: EdgeInsets.zero, alignment: Alignment.topLeft),
            const Text(
              "Nacimiento",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              date,
              style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ],
    );
  }
}
