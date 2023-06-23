import 'package:app_test/src/app/context/app_assets.dart';
import 'package:app_test/src/app/ui/widgets/custom/custom_button.dart';
import 'package:app_test/src/app/ui/widgets/shared/app_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/models/addrees.dart';
import '../../controller/session_ctr.dart';
import '../../widgets/custom/custom_loading.dart';
import 'address_user.dart';
import 'perfile.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/HomePage";
  HomePage({super.key});

  final SessionController _screenController =
      SessionController.initializeController();

  TextEditingController streetController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: CustomAppBar(
            titleP: '',
            bottomT: PreferredSize(
              preferredSize: const Size.fromHeight(5.0),
              child: Column(
                children: [
                  TabBar(
                    tabs: const [
                      Tab(
                        child: Text(
                          'Mis Direcciones',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Perfil',
                        ),
                      ),
                    ],
                    labelStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                    unselectedLabelColor: Colors.white.withOpacity(0.54),
                    labelColor: AppAssets.whiteColor,
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(children: [
            Obx(
              () => SingleChildScrollView(
                child: Column(
                  children: [
                    ..._screenController.address_user.map((e) => AddressCard(
                          index: 0,
                          neighborhood: e['neighborhood'],
                          number: e['number'],
                          street: e['street'],
                        )),
                    Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: streetController,
                              decoration: const InputDecoration(
                                labelText: 'Calle',
                              ),
                            ),
                            TextFormField(
                              controller: numberController,
                              decoration: const InputDecoration(
                                labelText: 'Numero',
                              ),
                            ),
                            TextFormField(
                              controller: neighborhoodController,
                              decoration: const InputDecoration(
                                labelText: 'Barrio',
                              ),
                            ),
                            CustomButton(
                                label: "Agregar",
                                onPressed: (true)
                                    ? () async {
                                        final addresses = Address(
                                          street: streetController.text,
                                          number: numberController.text,
                                          neighborhood:
                                              neighborhoodController.text,
                                        );
                                        _screenController.address_user
                                            .add(addresses.toJson());
                                        streetController.clear();
                                        numberController.clear();
                                        neighborhoodController.clear();

                                        await _screenController.updateListItem(
                                            _screenController.user?.uid ?? "");
                                      }
                                    : null)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            FutureBuilder<dynamic>(
                future: _screenController
                    .getDocumentById(_screenController.user?.uid ?? ""),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    if (_screenController.dataMap.isNotEmpty) {
                      String name = _screenController.dataMap["lastName"];
                      String lastName = _screenController.dataMap["firstName"];
                      DateTime date = DateTime.parse(
                          _screenController.dataMap["birthDate"].toString());

                      return SingleChildScrollView(
                          child: PerfileUserView(
                        lastName: lastName,
                        name: name,
                        date:
                            "Dia ${date.day} de ${getNameMount(date.month)} del ${date.year}",
                      ));
                    } else {
                      return Container();
                    }
                  } else {
                    return const CustomLoadingPage();
                  }
                }),
          ])),
    );
  }

  String getNameMount(int caso) {
    String nombreMes;
    switch (caso) {
      case 1:
        nombreMes = 'Enero';
        break;
      case 2:
        nombreMes = 'Febrero';
        break;
      case 3:
        nombreMes = 'Marzo';
        break;
      case 4:
        nombreMes = 'Abril';
        break;
      case 5:
        nombreMes = 'Mayo';
        break;
      case 6:
        nombreMes = 'Junio';
        break;
      case 7:
        nombreMes = 'Julio';
        break;
      case 8:
        nombreMes = 'Agosto';
        break;
      case 9:
        nombreMes = 'Septiembre';
        break;
      case 10:
        nombreMes = 'Octubre';
        break;
      case 11:
        nombreMes = 'Noviembre';
        break;
      case 12:
        nombreMes = 'Diciembre';
        break;
      default:
        nombreMes = '';
    }
    return nombreMes;
  }
}
