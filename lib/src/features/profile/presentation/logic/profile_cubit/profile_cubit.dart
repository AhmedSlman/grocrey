import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:grocery/core/data/api/dio_consumer.dart';
import 'package:grocery/core/data/cached/cache_helper.dart';
import 'package:grocery/core/errors/exceptions.dart';
import 'package:grocery/src/features/profile/data/data_source/profile_data_source.dart';
import 'package:grocery/src/features/profile/data/model/profile_model.dart';
import 'package:grocery/src/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:grocery/src/features/profile/domain/usecases/edit_profile_use_case.dart';
import 'package:grocery/src/features/profile/domain/usecases/get_profile_use_cases.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(InitialProfileState());

  final dio = DioConsumer(dio: Dio());
  getProfileData() async {
    final getProfileDataUsecase = GetProfileUseCases(
      ProfileRepoImpl(ProfileDataSourceImpl(dio)),
    );
    final id = await CacheHelper.getData(key: 'id');

    try {
      emit(LoadingProfileState());

      final result = await getProfileDataUsecase.call(id);
      result.fold(
        (failure) => emit(FailProfileState(failure.message)),
        (success) => emit(SuccessProfileState(success)),
      );
    } on ServerException catch (e) {
      emit(FailProfileState(e.errorModel.message));
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  updateProfile() async {
    final update_profile_usecase = UpdateProfileUseCases(
      ProfileRepoImpl(ProfileDataSourceImpl(dio)),
    );
    final id = await CacheHelper.getData(key: 'id');

    try {
      emit(LoadingUpdateProfileState());

      final result = await update_profile_usecase.call(
        id.toString(),
        nameController.text,
        emailController.text,
        imagePath ?? '',
      );
      result.fold(
        (failure) => emit(FailProfileState(failure.message)),
        (success) => emit(SuccessUpdateProfile()),
      );
    } catch (e) {
      emit(FailProfileState(e.toString()));
    }
  }

  final ImagePicker picker = ImagePicker();
  String? imagePath;

  chooseImageFromCamera() async {
    XFile? file = await picker.pickImage(source: ImageSource.camera);
    imagePath = file?.path;
  }

  chooseImageFromGallery() async {
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    imagePath = file?.path;
    print(file?.path);
  }
}
