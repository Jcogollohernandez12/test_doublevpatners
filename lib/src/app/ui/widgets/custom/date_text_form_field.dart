import 'package:flutter/material.dart';

class DateTextFormField extends StatelessWidget {
  final void Function(String value) onChanged;
  final String? Function(String? value)? validator;
  final String label;
  final EdgeInsets margin;
  final TextEditingController textController;
  final String hintText;

  DateTextFormField({
    Key? key,
    required this.onChanged,
    required this.label,
    required this.hintText,
    required this.textController,
    this.validator,
    this.margin = const EdgeInsets.all(10.0)
  }) : super(key: key);

  String date = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: GestureDetector(
      child: TextField(
        controller: textController,
        enabled: false,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        onChanged: (value){},
      ),
      onTap: () async {
        final DateTime? date = await showDatePicker(
          context: context, 
          initialDate: DateTime.now(), 
          firstDate: DateTime(1999), 
          lastDate: DateTime(2150),
        );
        if(date != null){
          final variable = '${date.year}-${date.month <= 9 ? '0':''}${date.month}-${date.day <= 9 ? '0' : ''}${date.day}';

          textController.text = '${date.day}/${date.month}/${date.year}';
          onChanged(variable.trim());
        }
      } ,
    ),
    );
  }
}
