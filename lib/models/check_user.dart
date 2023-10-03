class CheckUserLoginSaveToken {
  bool? _success;
  Data? _data;
  String? _message;

  CheckUserLoginSaveToken({bool? success, Data? data, String? message}) {
    _success = success;
    _data = data;
    _message = message;
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
  Data? get data => _data;
  set data(Data? data) => _data = data;
  String? get message => _message;
  set message(String? message) => _message = message;

  CheckUserLoginSaveToken.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = _success;
    if (_data != null) {
      data['data'] = _data!.toJson();
    }
    data['message'] = _message;
    return data;
  }
}

class Data {
  String? _accessToken;
  String? _tokenType;
  String? _name;

  Data({String? accessToken, String? tokenType, String? name}) {
    _accessToken = accessToken;
    _tokenType = tokenType;
    _name = name;
  }

  String? get accessToken => _accessToken;
  set accessToken(String? accessToken) => _accessToken = accessToken;
  String? get tokenType => _tokenType;
  set tokenType(String? tokenType) => _tokenType = tokenType;
  String? get name => _name;
  set name(String? name) => _name = name;

  Data.fromJson(Map<String, dynamic> json) {
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = _accessToken;
    data['token_type'] = _tokenType;
    data['name'] = _name;
    return data;
  }
}
