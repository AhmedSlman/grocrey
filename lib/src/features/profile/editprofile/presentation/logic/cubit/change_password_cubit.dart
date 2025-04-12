import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery/core/data/api/dio_consumer.dart';
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
    if (formKey.currentState!.validate()) {
      emit(LoadingChangePassword());
      try {
        var response = await dio.post(
          'https://grocery.mlmcosmo.com/user/user/change-password/1',
          options: Options(
            headers: {
              "Authorization":
                  "Bearer 6|7IoSIrUS6ZEoXbaXfW3DjQURT525GkRn6BYFDYhR0f794554",
            },
          ),
          data: {
            'old_password': currentPassword.text,
            'new_password': newPassword.text,
            'new_password_confirmation': confirmNewPassword.text,
          },
        );
        emit(SuccessChangePassword(response.data['message']));
      } on DioException catch (e) {
        emit(FailChangePassword(e.response!.data['message']));
      }
    } else {}
  }
}
