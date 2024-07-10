class VValidator {
  static String? validateTextField(String fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return "$fieldName is required.";
    }

    return null;
  }
}