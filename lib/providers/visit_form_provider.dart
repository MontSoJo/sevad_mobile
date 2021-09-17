import 'package:flutter/material.dart';
import 'package:sevad_mobile/models/models.dart';
import 'package:sevad_mobile/models/visit_model.dart';

class VisitFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Visit visit;

  VisitFormProvider(this.visit);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
