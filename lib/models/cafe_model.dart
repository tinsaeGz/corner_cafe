import 'package:flutter/material.dart';

class CafeModel {
  TextEditingController? textController;
  FocusNode? textFieldFocusNode;

  // Constructor
  CafeModel({this.textController, this.textFieldFocusNode});

  // Dispose method to clean up the controllers and focus node
  void dispose() {
    textController?.dispose();
    textFieldFocusNode?.dispose();
  }

   String? textControllerValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a drink name';
    }
    // Add any additional validation logic if needed
    return null;
  }

  
}
