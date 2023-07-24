import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../home/model/home_model.dart';

class DetaileController extends GetxController{
  final GetStorage Data = GetStorage();
  final RxList<IconData> widgetIcon = RxList([Icons.favorite_border,Icons.favorite]);
  final RxInt indexIcon = RxInt(0);
  late Map<String, dynamic> list = Map();

  void onLike(){
    try{
      if(Data.read(Get.arguments)){
        indexIcon.value = 0;
        print("oke satu");
        list.remove(Get.arguments);
        Data.write("jsonFavorite", list);
        print("hapus");
        Data.write(Get.arguments, false);
        update();
      }else{
        indexIcon.value = 1;
        Data.write(Get.arguments, true);
        list.addAll({Get.arguments:Get.arguments});
        Data.write("jsonFavorite", list);
        print(Data.read("jsonFavorite"));
        print("Di tambahkan");
        print("oke nol");
        update();
      }
    }
    catch(e){
      if(Data.read(Get.arguments)){
        indexIcon.value = 1;
        print("oke satu");
        Data.write(Get.arguments, false);
        update();
      }else{
        indexIcon.value = 0;
        Data.write(Get.arguments, true);
        print("oke nol");
        update();
      }
    }
  }

  @override
  void onInit() {
    print("Oke Siap ${Get.arguments}");
    try{
      if(Data.read(Get.arguments)){
        indexIcon.value = 1;
        print("icon true");
        list = Data.read("jsonFavorite");
        update();
      }else{
        indexIcon.value = 0;
        list = Data.read("jsonFavorite");
        print("icon false");
        update();
      }
    }catch(e){
      try{
        Data.write(Get.arguments, false);
        list = Data.read("jsonFavorite");
        print("oke error");
      }catch(e){

      }
    }
    super.onInit();

  }

}