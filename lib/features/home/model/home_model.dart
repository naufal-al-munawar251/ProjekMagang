class SampleModel {
  String? name;
  String? Icon;
  String? desc;
  String? Lokasi;
  String? suka;
  String? kalender;
  String? negara;

  SampleModel({this.name, this.Icon, this.desc,this.Lokasi,this.suka,this.kalender,this.negara});

  SampleModel.fromJson(Map<String, dynamic> json) {
    name = json['strTeam'];
    Icon = json['strTeamBadge'];
    desc = json['strDescriptionEN'];
    Lokasi = json['strStadiumLocation'];
    suka = json['strSport'];
    kalender = json['strKeywords'];
    negara = json['strCountry'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strTeam'] = name;
    data['strTeamBadge'] = Icon;
    data['strDescriptionEN'] = desc;
    data['strStadiumLocation'];
    data['strSport'];
    data['strKeywords'];
    data['strCountry'];
    return data;
  }
}