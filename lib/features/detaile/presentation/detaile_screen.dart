import 'package:expandable_text/expandable_text.dart';
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
        title: Row(
          children: [
            Image(image: NetworkImage(controller.Data.read("UrlImage")),width: 25,),
            Container(width: 10,),
            Text(controller.Data.read("NamaTim"))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10),child: Card(child: Padding(padding: EdgeInsets.all(10),child: Column(children: [
              Image(image: NetworkImage(controller.Data.read("UrlImage"))),
              Text(controller.Data.read("NamaTim"),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),)
            ],),),),),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(padding: EdgeInsets.only(left: 10,right: 10),child: Card(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(10),child: Row(children: [
                    Icon(Icons.sports_esports,color: Colors.red,),
                    Padding(padding: EdgeInsets.all(5),child: Text(controller.Data.read("Suka")),)
                  ],),),

                  Padding(padding: EdgeInsets.all(10),child: Row(children: [
                    Icon(Icons.calendar_month,color: Colors.blue,),
                    Padding(padding: EdgeInsets.all(5),child: Text(controller.Data.read("kalender")),)
                  ],),),

                  Padding(padding: EdgeInsets.all(10),child: Row(children: [
                    Icon(Icons.flag,color: Colors.orange,),
                    Padding(padding: EdgeInsets.all(5),child: Text(controller.Data.read("Lokasi")),)
                  ],),),

                ],
              ),),),
            ),
            Padding(padding: EdgeInsets.only(left: 10,right: 10),child: Card(child: Column(
              children: [
                Padding(padding: EdgeInsets.all(5),child: Column(
                  children: [
                      ExpandableText(
                        controller.Data.read("deskripsi"),
                        expandText: "Tampilkan...",
                        collapseText: "Sembunyikan...",
                        linkColor: Colors.black45,
                        maxLines: 10,
                      )
                  ],
                ),)
              ],
            ),),),
          ],
        ),
      )
    );
  }

}