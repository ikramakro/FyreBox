/// Checks if a string is a valid phone number.
bool isValidPhone(
  String? inputString, {
  bool isRequired = false,
}) {
  bool isInputStringValid = false;

  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    isInputStringValid = true;
  }

  if (inputString != null && inputString.isNotEmpty) {
    if (inputString.length > 16 || inputString.length < 6) return false;

    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

/// Checks if a string consists only of alphabets (no whitespace).
bool isText(
  String? inputString, {
  bool isRequired = false,
}) {
  bool isInputStringValid = false;

  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    isInputStringValid = true;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^[a-zA-Z]+$';
    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

/// Checks if a string consists only of alphabets (including whitespace).
bool isAlphabetic(
  String? inputString, {
  bool isRequired = false,
}) {
  bool isInputStringValid = false;

  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    isInputStringValid = true;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^[a-zA-Z\s]+$';
    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

bool isValidPassword(
  String? password, {
  bool isRequired = false,
  int minLength = 8,
}) {
  bool isInputStringValid = false;

  if (!isRequired && (password == null || password.isEmpty)) {
    isInputStringValid = true;
  }

  if (password != null && password.isNotEmpty) {
    // Check minimum length
    if (password.length >= minLength) {
      isInputStringValid = true;
    }
  }

  return isInputStringValid;
}

/// Checks if a string is a valid email address.
bool isValidEmail(
  String? inputString, {
  bool isRequired = false,
}) {
  bool isInputStringValid = false;

  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    isInputStringValid = true;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^[^@]+@[^@]+\.[^@]+$';
    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

bool isPasswordConfirmed(
  String? password,
  String? confirmPassword, {
  bool isRequired = false,
}) {
  bool isInputStringValid = false;

  if (!isRequired &&
      (password == null ||
          confirmPassword == null ||
          password.isEmpty ||
          confirmPassword.isEmpty)) {
    isInputStringValid = true;
  }

  if (password != null &&
      confirmPassword != null &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty) {
    isInputStringValid = password == confirmPassword;
  }

  return isInputStringValid;
}

/// Checks if a string is a valid URL.
bool isValidUrl(
  String? inputString, {
  bool isRequired = false,
}) {
  bool isInputStringValid = false;

  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    isInputStringValid = true;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^(https?|ftp)://[^\s/$.?#].[^\s]*$';
    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}
