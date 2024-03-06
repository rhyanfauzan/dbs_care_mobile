class ModelModel {
  bool isSuccess;
  List<DataModel> data;
  int statusCode;
  String? message;

  ModelModel({
    required this.isSuccess,
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory ModelModel.fromJson(Map<String, dynamic> json) {
    return ModelModel(
      isSuccess: json['isSuccess'],
      data: List<DataModel>.from(json['data'].map((dataModelJson) => DataModel.fromJson(dataModelJson))),
      statusCode: json['status_code'],
      message: json['message'],
    );
  }
}

class DataModel {
  int dataId;
  String? model;
  String? type;
  String? price;
  String? discount;

  DataModel({
    required this.dataId,
    required this.model,
    required this.type,
    required this.price,
    required this.discount,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      dataId: json['DATA_ID'],
      model: json['MODEL'],
      type: json['TYPE'],
      price: json['PRICE'],
      discount: json['DISCOUNT'],
    );
  }
}
