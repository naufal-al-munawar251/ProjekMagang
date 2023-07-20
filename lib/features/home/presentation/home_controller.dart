import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../components/util/helper.dart';
import '../../../components/util/state.dart';
import '../repository/home_repository.dart';
import 'home_state.dart';

class HomeController extends GetxController {
  final DummyRepository _repository;
  TextEditingController textController = TextEditingController();

  DummyState clubBola = DummyFoodIdle();
  RxInt index = RxInt(0);
  final GetStorage Data = GetStorage();
  int inde = 0;
  final _logger = Logger();
  HomeController(this._repository);

  @override
  void onInit() {
    _loadAllFood();
    super.onInit();
  }

  void ecreement(){
    _loadAllFood();
    update();
  }

  void _loadAllFood() {
    clubBola = DummyFoodLoading();
    update();
    _repository.loadFoods(
        response: ResponseHandler(
            onSuccess: (listFood) {
              clubBola = DummyFoodLoadSuccess(listFood);
            },
            onFailed: (e, message){
              _logger.e(e);
              AlertModel.showBasic("Error", message);
              clubBola = DummyFoodError();

            },
            onDone: () {
              update();
            })
    );
  }
}