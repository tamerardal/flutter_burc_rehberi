class Horoscope {
  String _name;
  String _date;
  String _detail;
  String _smallPic;
  String _bigPic;

  Horoscope(this._name, this._date, this._detail, this._smallPic, this._bigPic);

  String get bigPic => _bigPic;
  set bigPic(String value) {
    _bigPic = value;
  }

  String get smallPic => _smallPic;
  set smallPic(String value) {
    _smallPic = value;
  }

  String get detail => _detail;
  set detail(String value) {
    _detail = value;
  }

  String get date => _date;
  set date(String value) {
    _date = value;
  }

  String get name => _name;
  set name(String value) {
    _name = value;
  }
}
