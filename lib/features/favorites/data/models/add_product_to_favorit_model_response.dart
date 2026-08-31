class AddProductToFavoritModelResponse {
  String? status;
  String? message;
  List<String>? data;

  AddProductToFavoritModelResponse({this.status, this.message, this.data});

  AddProductToFavoritModelResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'].cast<String>();
  }
}
