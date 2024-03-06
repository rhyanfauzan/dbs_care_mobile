class PromoModel {
  bool isSuccess;
  List<DataPromo> data;
  int statusCode;
  String message;

  PromoModel({
    required this.isSuccess,
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory PromoModel.fromJson(Map<String, dynamic> json) {
    return PromoModel(
      isSuccess: json['isSuccess'],
      data: List<DataPromo>.from(json['data'].map((datumJson) => DataPromo.fromJson(datumJson))),
      statusCode: json['status_code'],
      message: json['message'],
    );
  }
}

class DataPromo {
  int dataId;
  String promoCd;
  String promoDesc;
  String promoCategory;
  String promoPeriode;
  String addressLink;
  String photo;

  DataPromo({
    required this.dataId,
    required this.promoCd,
    required this.promoDesc,
    required this.promoCategory,
    required this.promoPeriode,
    required this.addressLink,
    required this.photo,
  });

  factory DataPromo.fromJson(Map<String, dynamic> json) {
    return DataPromo(
      dataId: json['DATA_ID'],
      promoCd: json['PROMO_CD'],
      promoDesc: json['PROMO_DESC'],
      promoCategory: json['PROMO_CATEGORY'],
      promoPeriode: json['PROMO_PERIODE'],
      addressLink: json['ADDRESS_LINK'],
      photo: json['PHOTO'],
    );
  }
}
