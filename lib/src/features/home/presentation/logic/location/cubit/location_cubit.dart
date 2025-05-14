import 'package:bloc/bloc.dart';
import 'package:grocery/core/services/location_services.dart';
import 'package:meta/meta.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  getLocation() async {
    emit(LoadingGetLocation());
    try {
      final position = await LocationService().getCurrentLocation();
      if (position != null) {
        final placeName = await LocationService().getPlaceNameFromPosition(
          position,
        );
        emit(
          SuccessGetLocation(
            placeName == null
                ? ''
                : placeName
                    .replaceAll(RegExp(r'[a-zA-Z0-9\+\-]'), '')
                    .trim()
                    .split(RegExp(r'\s+'))
                    .reversed
                    .skip(10)
                    .toList()
                    .reversed
                    .join(' '),
          ),
        );
      } else {
        emit(FailGetLocation('تعذر تحديد الموقع'));
      }
    } catch (e) {
      emit(FailGetLocation('حدث خطأ: $e'));
    }
  }
}
