import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:grocery/core/data/api/api_consumer.dart';
import 'package:grocery/core/data/api/dio_consumer.dart';
import 'package:grocery/src/features/profile/data/data_source/update_profile_data_source.dart';
import 'package:grocery/src/features/profile/data/model/profile_model.dart';
import 'package:grocery/src/features/profile/data/repositories/update_profile_repo_impl.dart';
import 'package:grocery/src/features/profile/domain/usecases/edit_profile_use_cases.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(InitialProfileState());

  final dio = DioConsumer(dio: Dio());
  getProfileData() async {
    final ApiConsumer api = dio;
    final usecase = EditProfileUseCases(
      EditProfileRepoImpl(EditProfileDataSourceImpl(api)),
    );

    try {
      print('+++++++++++++++++++++++++++++++++++');
      emit(LoadingProfileState());

      final result = await usecase.call(1);
      result.fold(
        (failure) => emit(FailProfileState(failure.toString())),
        (success) => emit(SuccessProfileState(success)),
      );
    } catch (e) {
      print('--------------------------------------------');
      print(e.toString());
      emit(FailProfileState(e.toString()));
    }
  }
}
