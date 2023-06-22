import 'dart:developer';
import 'package:app_test/src/app/ui/widgets/custom/custom_button.dart';
import 'package:app_test/src/app/ui/widgets/custom/custom_text_form_field.dart';
import 'package:app_test/src/app/ui/widgets/custom/date_text_form_field.dart';
import 'package:app_test/src/app/ui/widgets/shared/app_appbar.dart';
import 'package:app_test/src/core/models/user.dart';

import 'package:flutter/material.dart';

import '../../controller/session_ctr.dart';
import '../../controller/shared_ctr.dart';

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
  late TextEditingController _addressController;

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
    _addressController = TextEditingController();
    _birthDateController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _addressController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleP: 'Completar registros'),
      body: Padding(
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
              CustomTextFormField(
                placeHolder: "Direccion Principal",
                onChangedFunction: (p0) {},
                onSubmittedFunction: (p0) {},
                inputType: TextInputType.text,
                inputController: _addressController,
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
                      addresses: [_addressController.text],
                    );

                    await _screenController.completeRegister(user);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
