import 'dart:developer';
import 'package:app_test/src/app/ui/widgets/custom/custom_button.dart';
import 'package:app_test/src/app/ui/widgets/custom/custom_text_form_field.dart';
import 'package:app_test/src/app/ui/widgets/custom/date_text_form_field.dart';
import 'package:app_test/src/app/ui/widgets/shared/app_appbar.dart';
import 'package:app_test/src/core/models/addrees.dart';
import 'package:app_test/src/core/models/user.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/session_ctr.dart';
import '../../controller/shared_ctr.dart';
import '../../widgets/others/shared.dart';

class CompleteRegisterScreen extends StatefulWidget {
  static const routeName = "/UserFormScreen";

  @override
  _CompleteRegisterScreenState createState() => _CompleteRegisterScreenState();
}

class _CompleteRegisterScreenState extends State<CompleteRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _birthDateController;
  late TextEditingController _streetController;
  late TextEditingController _numberController;
  late TextEditingController _neighborhoodController;

  final SharedController _sharedController =
      SharedController.initializeController();

  final SessionController _screenController =
      SessionController.initializeController();

  String date = '';

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _birthDateController = TextEditingController();
    _streetController = TextEditingController();
    _numberController = TextEditingController();
    _neighborhoodController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthDateController.dispose();
    _streetController.dispose();
    _numberController.dispose();
    _neighborhoodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleP: 'Completar registros'),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      placeHolder: "Nombres",
                      onChangedFunction: (p0) {},
                      onSubmittedFunction: (p0) {},
                      inputType: TextInputType.name,
                      inputController: _firstNameController,
                    ),
                    CustomTextFormField(
                      placeHolder: "Apellidos",
                      onChangedFunction: (p0) {},
                      onSubmittedFunction: (p0) {},
                      inputType: TextInputType.name,
                      inputController: _lastNameController,
                    ),
                    DateTextFormField(
                      onChanged: (value) {
                        date = value;
                        log(value);
                      },
                      label: "Fecha de nacimiento",
                      hintText: "seleccione la fecha",
                      textController: _birthDateController,
                    ),
                    TextFormField(
                      controller: _streetController,
                      decoration: const InputDecoration(
                        labelText: 'Calle',
                      ),
                    ),
                    TextFormField(
                      controller: _numberController,
                      decoration: const InputDecoration(
                        labelText: 'Numero',
                      ),
                    ),
                    TextFormField(
                      controller: _neighborhoodController,
                      decoration: const InputDecoration(
                        labelText: 'Barrio',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    CustomButton(
                        label: "Completar",
                        onPressed: () async {
                          User user = User(
                            id: _screenController.user?.uid ?? '',
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            birthDate: DateTime.parse(date),
                            addresses: [
                              Address(
                                  street: _streetController.text,
                                  number: _numberController.text,
                                  neighborhood: _neighborhoodController.text)
                            ],
                          );

                          await _screenController.completeRegister(user);
                        })
                  ],
                ),
              ),
            ),
          ),
          Obx(() => _sharedController.isLoading.value
              ? buildLoadingIndicator()
              : Container())
        ],
      ),
    );
  }
}
