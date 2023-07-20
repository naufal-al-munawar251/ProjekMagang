import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import '../../../components/config/app_route.dart';
import '../../detaile/presentation/detaile_screen.dart';
import '../model/home_model.dart';
import 'home_controller.dart';
import 'home_state.dart';

class DummyScreen extends GetView<DummyController> {
  const DummyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
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

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text("Esport"),
      backgroundColor: Colors.blue,
    );
  }

  Widget _body() {
        return GetBuilder<DummyController>(
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
        children: listData.map((food) => _itemFood(food)).toList());
  }

  Widget _itemFood(SampleModel Club) {
    return GestureDetector(
      onTap: () {
        controller.Data.write("NamaTim", Club.name!);
        controller.Data.write("UrlImage", Club.Icon!);
        print(controller.Data.read("NamaTim"));
        Get.toNamed(AppRoute.detail);
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
    return GetBuilder<DummyController>(
      builder: (ctr){
        return Column(children: [
          ElevatedButton(onPressed: (){
          }, child: Text("Button ${controller.inde}"))
        ],);
      },
    );
  }
}
