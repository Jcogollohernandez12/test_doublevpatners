import 'package:flutter/material.dart';

import '../../../context/app_assets.dart';

class AddressCard extends StatelessWidget {
  final String street;
  final String number;
  final String neighborhood;
  final int index;

  AddressCard({
    required this.street,
    required this.number,
    required this.neighborhood,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: size.width * 0.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Direccion $index',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text('Calle : $street'),
                  Text('Numero : $number'),
                  Text('Barrio : $neighborhood'),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                constraints: const BoxConstraints(maxWidth: 40.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    AppAssets.navigation,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
