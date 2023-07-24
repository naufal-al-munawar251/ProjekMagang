import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SampleModel {
  String? name;
  String? Icon;
  String? desc;
  String? Lokasi;
  String? suka;
  String? kalender;
  String? negara;
  bool? isFavorite;
  GetStorage Data = GetStorage();
  Map<String,dynamic> list = Map();

  SampleModel({this.name, this.Icon, this.desc,this.Lokasi,this.suka,this.kalender,this.negara,this.isFavorite});

  SampleModel.fromJson(Map<String, dynamic> json) {
    name = json['strTeam'];
    Icon = json['strTeamBadge'];
    desc = json['strDescriptionEN'];
    Lokasi = json['strStadiumLocation'];
    suka = json['strSport'];
    kalender = json['strKeywords'];
    negara = json['strCountry'];
    isFavorite = json["isFavorite"];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strTeam'] = name;
    data['strTeamBadge'] = Icon;
    data['strDescriptionEN'] = desc;
    data['strStadiumLocation'] = Lokasi;
    data['strSport'] = suka;
    data['strKeywords'] = kalender;
    data['strCountry'] = negara;
    return data;
  }
}