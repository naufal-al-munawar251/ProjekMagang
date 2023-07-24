import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../components/config/app_route.dart';
import '../../detaile/presentation/detaile_screen.dart';
import '../model/home_model.dart';
import 'home_controller.dart';
import 'home_state.dart';
import 'package:animation_search_bar/animation_search_bar.dart';

class DummyScreen extends GetView<HomeController> {
  const DummyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(),
      bottomNavigationBar: Obx(()=>BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
        currentIndex: controller.index.value,
        selectedItemColor: Colors.blue,
        onTap: (a){
          controller.ecreement();
          controller.index.value = a;
        },
      ),)
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: AnimationSearchBar(
          searchBarWidth: MediaQuery.of(context).size.width - 27,
          backIconColor: Colors.white,
          isBackButtonVisible: false,
          searchFieldDecoration: BoxDecoration(
            color: Colors.white,),
          closeIconColor: Colors.white,
          centerTitleStyle: const TextStyle(color: Colors.white),
          centerTitle: 'Esport',
          searchIconColor: Colors.white,
          hintStyle: const TextStyle(color: Colors.black),
          textStyle: TextStyle(color: Colors.black),
          onChanged: (text){
            controller.search(text);
          },
          searchTextEditingController: controller.textController),
      backgroundColor: Colors.blue,
    );
  }

  Widget _body() {
        return GetBuilder<HomeController>(
          builder: (ctrl) {
            final state = controller.clubBola;

            if (state is DummyFoodLoading) {
              return _loading();
            }

            if (state is DummyFoodLoadSuccess) {
              if(controller.index.value == 0) {

                return _contentBody(state.listLigaClub);
              }
              else{
                return Favorite();
              }
            }

            return Container();
          },
        );
  }

  Widget _loading() => const Center(child: CircularProgressIndicator());

  Widget _contentBody(List<SampleModel> listData) {

    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(3.0),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        children: controller.filteredClubs.map((club) => _itemClub(club)).toList());
  }

  Widget _itemClub(SampleModel Club) {
    return GestureDetector(
      onTap: () {
        controller.Data.write("NamaTim", Club.name!);
        controller.Data.write("UrlImage", Club.Icon!);
        controller.Data.write("Lokasi", Club.Lokasi!);
        controller.Data.write("Suka", Club.suka!);
        controller.Data.write("kalender", Club.kalender!);
        controller.Data.write("deskripsi", Club.desc!);
        controller.Data.write("DataFavorite", Club);
        print("Ini adalah : ${jsonEncode(Club)}");
        Get.toNamed(AppRoute.detail,arguments: controller.Data.read("NamaTim"));
      },
      child: Padding(
        padding: EdgeInsets.all(1),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(20),
              child: Image(image: NetworkImage(Club.Icon!),width: 100,height: 100,),),
              Text(Club.name!)
            ],
          ),
        ),
      )
    );
  }
  Widget Favorite(){

    return GetBuilder<HomeController>(
      builder: (ctr){
        if(controller.favorite.isEmpty){
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: NetworkImage("https://cdn-icons-png.flaticon.com/512/7486/7486744.png"),width: 200,),
              Container(height: 50,),
              Text("Tidak ada daftar favorite")
            ],
          ),);
        }
        else{
          return ListView.builder(
            itemCount: controller.favorite.length,
            itemBuilder: (context, index) {
              // Ambil key dan value dari elemen Map pada indeks tertentu
              String key = controller.favorite.keys.elementAt(index);
              dynamic value = controller.favorite[key];
              return ListTile(
                onTap: (){
                  print(controller.Data.read("jsonFavorite"));
                },
                leading: Icon(Icons.favorite,color: Colors.red,),
                title: Text(value),
                subtitle: Text("Tersimpan"),
              );
            },
          );
        }
      },
    );
  }
}
