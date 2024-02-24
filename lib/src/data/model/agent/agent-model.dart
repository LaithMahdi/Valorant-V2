class AgentModel {
  String? uuid;
  String? displayName;
  String? description;
  String? developerName;
  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String? killfeedPortrait;
  String? background;
  List<String>? backgroundGradientColors;
  String? assetPath;
  bool? isFullPortraitRightFacing;
  bool? isPlayableCharacter;
  bool? isAvailableForTest;
  bool? isBaseContent;
  RoleModel? role;
  List<AbilityModel>? abilities;

  AgentModel({
    this.uuid,
    this.displayName,
    this.description,
    this.developerName,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.killfeedPortrait,
    this.background,
    this.backgroundGradientColors,
    this.assetPath,
    this.isFullPortraitRightFacing,
    this.isPlayableCharacter,
    this.isAvailableForTest,
    this.isBaseContent,
    this.role,
    this.abilities,
  });

  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return AgentModel(
      uuid: json['uuid'],
      displayName: json['displayName'],
      description: json['description'],
      developerName: json['developerName'],
      displayIcon: json['displayIcon'],
      displayIconSmall: json['displayIconSmall'],
      bustPortrait: json['bustPortrait'] ?? "",
      fullPortrait: json['fullPortrait'] ??
          "https://media.valorant-api.com/agents/320b2a48-4d9b-a075-30f1-1f93a9b638fa/fullportrait.png",
      fullPortraitV2: json['fullPortraitV2'] ?? "",
      killfeedPortrait: json['killfeedPortrait'] ?? "",
      background: json['background'] ?? "",
      backgroundGradientColors: json['backgroundGradientColors'] != null
          ? List<String>.from(json['backgroundGradientColors'])
          : [],
      assetPath: json['assetPath'],
      isFullPortraitRightFacing: json['isFullPortraitRightFacing'],
      isPlayableCharacter: json['isPlayableCharacter'],
      isAvailableForTest: json['isAvailableForTest'],
      isBaseContent: json['isBaseContent'],
      role: json['role'] != null
          ? RoleModel.fromJson(json['role'])
          : RoleModel(
              uuid: "5fc02f99-4091-4486-a531-98459a3e95e9",
              displayName: "Sentinel",
              description: "Sentinel",
              displayIcon:
                  "https://media.valorant-api.com/agents/roles/1b47567f-8f7b-444b-aae3-b0c634622d10/displayicon.png",
              assetPath:
                  "ShooterGame/Content/Characters/_Core/Roles/Sentinel_PrimaryDataAsset",
            ),
      abilities: json['abilities'] != null
          ? List<AbilityModel>.from(
              json['abilities'].map((x) => AbilityModel.fromJson(x)))
          : [],
    );
  }
}

class RoleModel {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? assetPath;

  RoleModel({
    this.uuid,
    this.displayName,
    this.description,
    this.displayIcon,
    this.assetPath,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
        uuid: json['uuid'],
        displayName: json['displayName'],
        description: json['description'],
        displayIcon: json['displayIcon'],
        assetPath: json['assetPath']);
  }
}

class AbilityModel {
  String? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  AbilityModel({
    this.slot,
    this.displayName,
    this.description,
    this.displayIcon,
  });

  factory AbilityModel.fromJson(Map<String, dynamic> json) {
    return AbilityModel(
      slot: json['slot'],
      displayName: json['displayName'],
      description: json['description'],
      displayIcon: json['displayIcon'] ?? "",
    );
  }
}
