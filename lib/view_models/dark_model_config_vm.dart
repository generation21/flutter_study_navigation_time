import 'package:flutter/material.dart';
import 'package:navigation_time/models/dark_mode_config_model.dart';
import 'package:navigation_time/repos/dark_model_config_repo.dart';

class DarkModeConfigViewModel extends ChangeNotifier {
  final DarkModeRepository _repository;
  late final DarkModeConfigModel _model = DarkModeConfigModel(
    isDarkMode: _repository.isDarkMode(),
  );
  DarkModeConfigViewModel(this._repository);

  bool get isDarkMode => _model.isDarkMode;

  void setDarkMode(bool value) {
    _repository.setDarkMode(value);
    _model.isDarkMode = value;
    notifyListeners();
  }
}
