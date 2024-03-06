class HomeModel {
  bool isSuccess;
  Data data;
  int statusCode;
  String message;

  HomeModel({
    required this.isSuccess,
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      isSuccess: json['isSuccess'],
      data: Data.fromJson(json['data']),
      statusCode: json['status_code'],
      message: json['message'],
    );
  }
}

class Data {
  Promos promos;
  List<Model> models;

  Data({
    required this.promos,
    required this.models,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      promos: Promos.fromJson(json['promos']),
      models: List<Model>.from(json['models'].map((modelJson) => Model.fromJson(modelJson))),
    );
  }
}

class Model {
  int dataId;
  String model;
  String type;
  String price;
  String discount;

  Model({
    required this.dataId,
    required this.model,
    required this.type,
    required this.price,
    required this.discount,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      dataId: json['DATA_ID'],
      model: json['MODEL'],
      type: json['TYPE'],
      price: json['PRICE'],
      discount: json['DISCOUNT'],
    );
  }
}

class Promos {
  int dataId;
  String promoCd;
  String promoDesc;
  String promoCategory;
  String promoPeriode;
  String addressLink;
  String photo;

  Promos({
    required this.dataId,
    required this.promoCd,
    required this.promoDesc,
    required this.promoCategory,
    required this.promoPeriode,
    required this.addressLink,
    required this.photo,
  });

  factory Promos.fromJson(Map<String, dynamic> json) {
    return Promos(
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
