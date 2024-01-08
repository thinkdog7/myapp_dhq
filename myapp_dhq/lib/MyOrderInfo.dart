class MyOrderInfo {
  String _name;
  String _imagPath;
  String _textReading;
  String _hint;
  String _orderDate;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  MyOrderInfo(this._name, this._imagPath, this._textReading, this._hint,
      this._orderDate);

  @override
  String toString() {
    return 'MyOrderInfo{_name: $_name, _imagPath: $_imagPath, _textReading: $_textReading, _hint: $_hint, _orderDate: $_orderDate}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyOrderInfo &&
          runtimeType == other.runtimeType &&
          _name == other._name &&
          _imagPath == other._imagPath &&
          _textReading == other._textReading &&
          _hint == other._hint &&
          _orderDate == other._orderDate;

  @override
  int get hashCode =>
      _name.hashCode ^
      _imagPath.hashCode ^
      _textReading.hashCode ^
      _hint.hashCode ^
      _orderDate.hashCode;



  String get imagPath => _imagPath;

  String get orderDate => _orderDate;

  set orderDate(String value) {
    _orderDate = value;
  }

  String get hint => _hint;

  set hint(String value) {
    _hint = value;
  }

  String get textReading => _textReading;

  set textReading(String value) {
    _textReading = value;
  }

  set imagPath(String value) {
    _imagPath = value;
  }
}
