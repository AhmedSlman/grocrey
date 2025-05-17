import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:grocery/core/data/api/dio_consumer.dart';
import 'package:grocery/core/data/cached/cache_helper.dart';
import 'package:grocery/core/services/service_locator.dart';
import 'package:grocery/src/features/profile/domain/usecases/change_password_use_case.dart';
import 'package:grocery/src/features/profile/domain/usecases/get_profile_use_cases.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmNewPassword = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final api = DioConsumer(dio: Dio());
  var dio = Dio();
  bool isObscure = true;
  toggleObscurePassword() {
    isObscure = !isObscure;
    emit(ChangePasswordInitial());
  }

  changePassword() async {
    final change_password_use_case = getIt.get<ChangePasswordUseCase>();
    if (formKey.currentState!.validate()) {
      emit(LoadingChangePassword());
      final id = await CacheHelper.getData(key: 'id');
      final result = await change_password_use_case.changePassword(
        id: id,
        currentPassword: currentPassword.text,
        newPassword: newPassword.text,
        confirmNewPassword: confirmNewPassword.text,
      );
      result.fold(
        (failure) => emit(FailChangePassword(failure.message)),
        (succes) => emit(SuccessChangePassword('Success change password')),
      );
      try {} catch (e) {
        emit(FailChangePassword(e.toString()));
      }
      // try {
      //   var response = await dio.post(
      //     'https://grocery.mlmcosmo.com/user/user/change-password/4',
      //     options: Options(
      //       headers: {
      //         "Authorization":
      //             "Bearer 3|6CAagv1fcoKSjqGodlmaxLTfKWyrMOdmUUnSJprm63cecf9d",
      //       },
      //     ),
      //     data: {
      //       'old_password': currentPassword.text,
      //       'new_password': newPassword.text,
      //       'new_password_confirmation': confirmNewPassword.text,
      //     },
      //   );
      //   emit(SuccessChangePassword(response.data['message']));
      // } on DioException catch (e) {
      //   emit(FailChangePassword(e.response!.data['message']));
      // }
    } else {}
  }
}
