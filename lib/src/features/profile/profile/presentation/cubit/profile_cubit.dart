import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:grocery/core/data/api/dio_consumer.dart';
import 'package:grocery/src/features/profile/profile/data/model/profile_model.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(InitialProfileState());

  final dio = DioConsumer(dio: Dio());
  getProfileData() async {
    try {
      emit(LoadingProfileState());
      Response response = await Dio().get(
        'https://grocery.mlmcosmo.com/user/user/profile/2',
        options: Options(
          headers: {
            "Authorization":
                "Bearer 6|7IoSIrUS6ZEoXbaXfW3DjQURT525GkRn6BYFDYhR0f794554",
          },
        ),
      );

      ProfileModel data = ProfileModel.fromJson(response.data['message']);
      emit(SuccessProfileState(data));
    } catch (e) {
      emit(FailProfileState(e.toString()));
    }
  }
}
