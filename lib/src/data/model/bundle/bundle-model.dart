class BundleModel {
  String? uuid;
  String? displayName;
  String? displayNameSubText;
  String? description;
  String? extraDescription;
  String? promoDescription;
  bool? useAdditionalContext;
  String? displayIcon;
  String? displayIcon2;
  String? verticalPromoImage;
  String? assetPath;

  BundleModel(
      {this.uuid,
      this.displayName,
      this.displayNameSubText,
      this.description,
      this.extraDescription,
      this.promoDescription,
      this.useAdditionalContext,
      this.displayIcon,
      this.displayIcon2,
      this.verticalPromoImage,
      this.assetPath});

  BundleModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    displayNameSubText = json['displayNameSubText'];
    description = json['description'];
    extraDescription = json['extraDescription'];
    promoDescription = json['promoDescription'];
    useAdditionalContext = json['useAdditionalContext'];
    displayIcon = json['displayIcon'];
    displayIcon2 = json['displayIcon2'];
    verticalPromoImage = json['verticalPromoImage'];
    assetPath = json['assetPath'];
  }
}
