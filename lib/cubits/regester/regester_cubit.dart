import 'package:flutter_bloc/flutter_bloc.dart';

part 'regester_state.dart';

class RegesterCubit extends Cubit<RegesterState> {
  RegesterCubit() : super(RegesterInitial());
}
