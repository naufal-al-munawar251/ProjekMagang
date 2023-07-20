import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'detaile_controller.dart';

class Detail extends GetView<DetaileController>{
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(controller.Data.read("NamaTim")),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10),child: Card(child: Padding(padding: EdgeInsets.all(10),child: Column(children: [
            Image(image: NetworkImage(controller.Data.read("UrlImage"))),
            Text(controller.Data.read("NamaTim"),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),)
          ],),),),),

        ],
      ),
    );
  }

}