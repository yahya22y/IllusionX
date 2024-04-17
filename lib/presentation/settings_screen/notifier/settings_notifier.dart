import 'package:equatable/equatable.dart';
import '/core/app_export.dart';
import 'package:yahya_s_application1/presentation/settings_screen/models/settings_model.dart';
part 'settings_state.dart';

final settingsNotifier = StateNotifierProvider<SettingsNotifier, SettingsState>(
    (ref) =>
        SettingsNotifier(SettingsState(settingsModelObj: SettingsModel())));

/// A notifier that manages the state of a Settings according to the event that is dispatched to it.
class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier(SettingsState state) : super(state);
}
