import '../model/home_model.dart';

abstract class DummyState {}
class DummyFoodLoadSuccess extends DummyState {
  final List<SampleModel> listLigaClub;
  DummyFoodLoadSuccess(this.listLigaClub);
}

class DummyFoodLoading extends DummyState {}

class DummyFoodIdle extends DummyState {}

class DummyFoodError extends DummyState {}

