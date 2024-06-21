// import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';
//
// class editpage extends StatefulWidget {
//   List blanklist;
//   int index;
//
//   editpage(this.blanklist, this.index);
//
//   @override
//   State<editpage> createState() => _fpState();
// }
//
// class _fpState extends State<editpage> {
//
//
//   List<Color> listcolor = [
//     Colors.red,
//     Colors.pink,
//     Colors.purple,
//     Colors.deepPurple,
//     Colors.indigo,
//     Colors.blue,
//     Colors.lightBlue,
//     Colors.cyan,
//     Colors.teal,
//     Colors.green,
//     Colors.lightGreen,
//     Colors.lime,
//     Colors.yellow,
//     Colors.amber,
//     Colors.orange,
//     Colors.deepOrange,
//     Colors.brown,
//     Colors.grey,
//     Colors.blueGrey,
//     Colors.black,
//     Colors.white,
//   ];
//   List Emoji=["😀 😃 😄 😁 😆","😅 😂 🤣 🥲 🥹","☺ 😊 😇 🙂 🙃","😉 😌 😍 🥰 😘","😗 😙 😚 😋 😛","😝 😜 🤪 🤨 🧐","🤓 😎 🥸 🤩 🥳","😏 😒 😞 😔 😟"];
//   String emoji1 = "😀 😃 😄 😁 😆";
//   Color curentcolor = Colors.yellow;
//   Color curentcolor1 = Colors.red;
//
//   double cfontsize  = 20;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("${widget.blanklist[widget.index]}"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               margin: EdgeInsets.all(20),
//               color: curentcolor,
//               child: Center(
//                 child: Text(
//                   "$emoji1\n${widget.blanklist[widget.index]}\n$emoji1",
//                   style: TextStyle(
//                     fontFamily: "robot",
//                     // fontStyle: FontStyle.italic ,
//                     fontWeight: FontWeight.bold,
//                     fontSize: cfontsize,
//                     color: curentcolor1,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     showModalBottomSheet(
//                       context: context,
//                       builder: (context) {
//                         return Container(
//                           height: 200,
//                           child: GridView.builder(
//                             itemCount: listcolor.length,
//                             gridDelegate:
//                             SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 7),
//                             itemBuilder: (context, index) {
//                               return InkWell(
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                   setState(() {
//                                     curentcolor = listcolor[index];
//                                   });
//                                 },
//                                 child: Container(
//                                   margin: EdgeInsets.all(5),
//                                   color: listcolor[index],
//                                 ),
//                               );
//                             },
//                           ),
//                         );
//                       },
//                     );
//                   },
//                   child: Text("BG color")),
//               ElevatedButton(
//                   onPressed: () {
//                     showModalBottomSheet(
//                       context: context,
//                       builder: (context) {
//                         return Container(
//                           height: 200,
//                           child: GridView.builder(
//                             itemCount: listcolor.length,
//                             gridDelegate:
//                             SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 7),
//                             itemBuilder: (context, index) {
//                               return InkWell(
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                   setState(() {
//                                     curentcolor1 = listcolor[index];
//                                   });
//                                 },
//                                 child: Container(
//                                   margin: EdgeInsets.all(5),
//                                   color: listcolor[index],
//                                 ),
//                               );
//                             },
//                           ),
//                         );
//                       },
//                     );
//                   },
//                   child: Text("TEXT color")),
//               ElevatedButton(onPressed: () {
//                 showModalBottomSheet(context: context, builder: (context) {
//                   return Container(height: 100,child: ListView.builder(itemBuilder: (context, index) {
//
//
//                     return Text("");
//                   },),);
//                 },);
//
//
//
//               }, child: Text("Font"))
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     Share.share("${widget.blanklist[widget.index]}");
//                   },
//                   child: Text("Share")),
//               ElevatedButton(onPressed: () {
//                 showModalBottomSheet(context: context, builder: (context) {
//                   return Container(height: 200,child: StatefulBuilder(builder: (context, setState1) {
//                     return Slider(min: 10,max: 40,value: cfontsize, onChanged: (value) {
//
//                       setState(() {
//                         setState1(() {
//                           cfontsize = value;
//                         });
//                       });
//                     },);
//                   },),);
//                 },);
//
//
//               }, child: Text("Change Text")),
//               ElevatedButton(onPressed: () {
//                 showModalBottomSheet(
//                   context: context,
//                   builder: (context) {
//                     return Container(
//                       height: 200,
//                       child: ListView.builder(itemCount: Emoji.length,itemBuilder: (context, index) {
//                         return  Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Center(child: Text("${Emoji[index]}")),
//                         );
//
//                         return InkWell(
//                           onTap: () {
//                             Navigator.pop(context);
//                             setState(() {
//                               emoji1 = Emoji[index];
//                             });
//                           },
//                           child: Center(
//                             child: Container(
//                               child: Text("${emoji1[index]}",maxLines: 1,),
//                             ),
//                           ),
//                         );
//                       },),
//                     );
//                   },
//                 );
//               }, child: Text("Emoji"))
//             ],
//           )
//
//         ],
//       ),
//     );
//   }
// }