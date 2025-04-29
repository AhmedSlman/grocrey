part of 'offers_cubit.dart';

@immutable
sealed class OffersState {}

final class OffersInitial extends OffersState {}

final class GetOffersLoading extends OffersState {}

final class GetOffersSuccess extends OffersState {
  final List<OfferProduct> offer_producs;
  GetOffersSuccess(this.offer_producs);
}

final class GetOffersFail extends OffersState {
  final ErrorModel errorModel;
  GetOffersFail(this.errorModel);
}
