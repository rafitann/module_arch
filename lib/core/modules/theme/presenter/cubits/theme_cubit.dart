import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeStyle { dark, light, blue, purple }

class ThemeCubit extends Cubit<ThemeStyle> {
  ThemeCubit() : super(ThemeStyle.dark);

  bool get isDark => state is ThemeStyle.dark;

  Future<void> next() async {
    var nextIndex = state.index + 1;

    if (nextIndex == ThemeStyle.values.length) {
      nextIndex = 0;
    }

    emit(ThemeStyle.values.elementAt(nextIndex));
  }
}
