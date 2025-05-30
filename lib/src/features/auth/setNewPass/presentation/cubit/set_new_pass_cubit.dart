import 'package:bloc/bloc.dart';
import 'package:grocery/src/features/auth/setNewPass/data/remoteData/set_new_pass_remoteds.dart';
import 'package:meta/meta.dart';

part 'set_new_pass_state.dart';

class SetNewPassCubit extends Cubit<SetNewPassState> {
  final SetNewPassRemoteds setNewPassRemoteds;
  SetNewPassCubit(this.setNewPassRemoteds) : super(SetNewPassInitial());

  Future<void> setNewPass({
    required String email,
    required String password,
    required String confirmPassword,
    required String code,
    }) async {
      emit(SetNewPassLoadingState());
      final result = await setNewPassRemoteds.setNewPass(
        email,
        password,
        confirmPassword,
        code,
      );
      result.fold(
        (error) => emit(SetNewPassErrorState(error: error.message)),
        (message) => emit(SetNewPassSuccessState(message: message)),
      );
    }
    
    
  
}
