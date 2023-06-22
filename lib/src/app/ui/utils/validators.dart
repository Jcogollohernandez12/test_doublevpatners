String? validateEmail(String email) {
  return _generalValidator(
      email,
      RegExp(
          r'^[\w-\.]+[\w-\.](\w)\@\w+((-\w+)|(\w))\.[a-z]{2,}(\.[a-z]{2,})*$'),
      "Esto no es un correo");
}

String? _generalValidator(String text, RegExp regExp, String errorMsj) {
  if (validateEmpty(text) != null) return validateEmpty(text);
  if (!regExp.hasMatch(text)) {
    return errorMsj;
  } else {
    return null;
  }
}

String? validateEmpty(String text) {
  if (text.isEmpty) {
    return "Campo requerido";
  } else {
    return null;
  }
}

String? validateLenght(String value, int number) {
  if (value.length < number) {
    return 'Debe tener al menos $number  caracteres';
  }
  return null; // Sin errores de validación
}
