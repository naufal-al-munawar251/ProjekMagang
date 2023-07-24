import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../components/util/helper.dart';
import '../../../components/util/state.dart';
import '../model/home_model.dart';
import '../repository/home_repository.dart';
import 'home_state.dart';

class HomeController extends GetxController {
  final DummyRepository _repository;
  TextEditingController textController = TextEditingController();
  late Map<String,dynamic> favorite = Map();

  DummyState clubBola = DummyFoodIdle();
  RxInt index = RxInt(0);
  final GetStorage Data = GetStorage();
  final _logger = Logger();
  int ec = 0;

  //------------------Ini search (1)------------------//
  List<SampleModel> allClubs = [];
  RxList<SampleModel> filteredClubs = RxList<SampleModel>();
  //--------------------------------------------------//

  HomeController(this._repository);

  @override
  void onInit() {
    _loadAllFood();
    try{
      favorite = Data.read("jsonFavorite");
      print("ini isinya : ${Data.read("jsonFavorite")}");
    }catch(e){

    }
    super.onInit();
  }
  @override
  void dispose() {
    try{
      favorite = Data.read("jsonFavorite");
    }catch(e){

    }
    super.dispose();
  }

  void ecreement(){
    _loadAllFood();
    update();
  }

  //--------------------ini search (2) --------------------//
  // Function to apply the search filter
  void search(String searchText) {
    // Check if the search text is empty
    if (searchText.isEmpty) {
      // If empty, display all clubs from the allClubs list
      filteredClubs.value = allClubs;
    } else {
      // If not empty, apply the filter and update the filteredClubs list
      filteredClubs.value = allClubs.where((club) {
        return club.name!.toLowerCase().contains(searchText.toLowerCase());
      }).toList();
    }
    update();
  }
  //-----------------------------------------------------//

  void _loadAllFood() {
    clubBola = DummyFoodLoading();
    update();
    _repository.loadFoods(
      response: ResponseHandler(
        onSuccess: (listFood) {
          allClubs = listFood; // Store the entire list of clubs
          clubBola = DummyFoodLoadSuccess(listFood);
          // Display all clubs before search
          //-----------------ini search (3)-------------------//
          filteredClubs.value = listFood;

          //--------------------------------------------------//
        },
        onFailed: (e, message) {
          _logger.e(e);
          AlertModel.showBasic("Error", message);
          clubBola = DummyFoodError();
        },
        onDone: () {
          update();
        },
      ),
    );
  }


}