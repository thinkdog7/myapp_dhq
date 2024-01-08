// class counselorInfo {
//   String _name;
//   String _introduction;
//   String _imagPath;
//
//   counselorInfo(
//     this._imagPath,
//     this._name,
//     this._introduction,
//   );
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is counselorInfo &&
//           runtimeType == other.runtimeType &&
//           _name == other._name &&
//           _introduction == other._introduction &&
//           _imagPath == other._imagPath;
//
//   @override
//   int get hashCode =>
//       _name.hashCode ^ _introduction.hashCode ^ _imagPath.hashCode;
//
//   @override
//   String toString() {
//     return 'counselorInfo{_name: $_name, _introduction: $_introduction, _imagPath: $_imagPath}';
//   }
//
//   String get imagPath => _imagPath;
//
//   set imagPath(String value) {
//     _imagPath = value;
//   }
//
//   String get introduction => _introduction;
//
//   set introduction(String value) {
//     _introduction = value;
//   }
//
//   String get name => _name;
//
//   set name(String value) {
//     _name = value;
//   }
// }
