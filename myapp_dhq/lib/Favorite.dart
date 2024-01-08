// import 'package:flutter/material.dart';
//
//
// /// 自定义收藏组件
// /// isFavorite  默认是否收藏
// /// favoriteNum 默认收藏次数
// class FavoriteWidget extends StatefulWidget {
//   final bool isFavorite;
//   final int favoriteNum;
//
//   FavoriteWidget({
//     Key? key,
//     required this.isFavorite,
//     required this.favoriteNum,
//   }) : super(key: key);
//
//   @override
//   _FavoriteState createState() => _FavoriteState();
// }
//
// class _FavoriteState extends State<FavoriteWidget> {
//   late bool _isFavorite;
//   late int _favoriteNum;
//
//   @override
//   void initState() {
//     super.initState();
//     _isFavorite = widget.isFavorite;
//     _favoriteNum = widget.favoriteNum;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: InkWell(
//         onTap: useDebounce(_favorite, delay: Duration(milliseconds: 300)),
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(
//               _isFavorite ? Icons.favorite : Icons.favorite_border,
//               color: _isFavorite ? Colors.deepOrange : null,
//               size: 18,
//             ),
//             Text(
//               "$_favoriteNum",
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// 收藏&取消收藏
//   void _favorite() {
//     setState(() {
//       _isFavorite ? _favoriteNum -= 1 : _favoriteNum += 1;
//       _isFavorite = !_isFavorite;
//     });
//   }
//
//   useDebounce(void Function() favorite, {required Duration delay}) {}
// }