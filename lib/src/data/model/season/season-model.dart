class SeasonModel {
  String? uuid;
  String? startTime;
  String? endTime;
  String? seasonUuid;
  String? competitiveTiersUuid;
  List<BorderModel>? borders;
  String? assetPath;

  SeasonModel(
      {this.uuid,
      this.startTime,
      this.endTime,
      this.seasonUuid,
      this.competitiveTiersUuid,
      this.borders,
      this.assetPath});

  SeasonModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    seasonUuid = json['seasonUuid'];
    competitiveTiersUuid = json['competitiveTiersUuid'];
    if (json['borders'] != null) {
      borders = <BorderModel>[];
      json['borders'].forEach((v) {
        borders!.add(BorderModel.fromJson(v));
      });
    }
    assetPath = json['assetPath'];
  }
}

class BorderModel {
  String? uuid;
  int? level;
  int? winsRequired;
  String? displayIcon;
  String? smallIcon;
  String? assetPath;

  BorderModel(
      {this.uuid,
      this.level,
      this.winsRequired,
      this.displayIcon,
      this.smallIcon,
      this.assetPath});

  BorderModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    level = json['level'];
    winsRequired = json['winsRequired'];
    displayIcon = json['displayIcon'];
    smallIcon = json['smallIcon'];
    assetPath = json['assetPath'];
  }
}
