class SampleModel {
  String? name;
  String? Icon;
  String? desc;
  String? Lokasi;

  SampleModel({this.name, this.Icon, this.desc,this.Lokasi});

  SampleModel.fromJson(Map<String, dynamic> json) {
    name = json['strTeam'];
    Icon = json['strTeamBadge'];
    desc = json['strGender'];
    Lokasi = json['lokasi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strTeam'] = name;
    data['strTeamBadge'] = Icon;
    data['strGender'] = desc;
    data['lokasi'];
    return data;
  }
}