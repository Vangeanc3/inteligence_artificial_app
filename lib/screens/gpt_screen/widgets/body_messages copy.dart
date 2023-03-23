// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:inteligence_artificial_app/themes/theme_colors.dart';

// import '../../../components/box_card.dart';

// class BodyMessages extends StatefulWidget {
//   const BodyMessages({super.key});

//   @override
//   State<BodyMessages> createState() => _BodyMessagesState();
// }

// class _BodyMessagesState extends State<BodyMessages> {
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         SliverList(
//           delegate: SliverChildBuilderDelegate((context, index) {
//             return Align(
//               alignment: (widget.boxs[index]["receveid"])
//                   ? Alignment.topLeft
//                   : Alignment.bottomRight,
//               child: Padding(
//                 padding: EdgeInsets.only(
//                   bottom: 8,
//                   left: (!widget.boxs[index]["receveid"]) ? 50 : 0,
//                   right: (widget.boxs[index]["receveid"]) ? 50 : 0,
//                 ),
//                 child: BoxCard(
//                   widget: (widget.boxs[index]["loading"])
//                       ? ConstrainedBox(
//                           constraints: const BoxConstraints(maxWidth: 35),
//                           child: const SpinKitThreeBounce(
//                               color: Colors.white, size: 10.0),
//                         )
//                       : Text(widget.boxs[index]["text"]),
//                   receveid: widget.boxs[index]["receveid"],
//                   color: (widget.boxs[index]["receveid"])
//                       ? null
//                       : ThemeColors.msgSendColor,
//                 ),
//               ),
//             );
//           }, childCount: widget.boxs.length),
//         ),
//       ],
//     );
//   }
// }
