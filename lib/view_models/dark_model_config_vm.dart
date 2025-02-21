import 'package:navigation_time/models/dark_mode_config_model.dart';
import 'package:navigation_time/repos/dark_model_config_repo.dart';
import 'package:riverpod/riverpod.dart';

class DarkModeConfigViewModel extends Notifier<DarkModeConfigModel> {
  final DarkModeRepository _repository;

  DarkModeConfigViewModel(this._repository);

  void setDarkMode(bool value) {
    _repository.setDarkMode(value);
    state = DarkModeConfigModel(isDarkMode: value);
  }

  @override
  DarkModeConfigModel build() {
    return DarkModeConfigModel(
      isDarkMode: _repository.isDarkMode(),
    );
  }
}

final darkModeConfigProvider =
    NotifierProvider<DarkModeConfigViewModel, DarkModeConfigModel>(
  () => throw UnimplementedError(),
);
