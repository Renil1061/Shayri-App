import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class fp extends StatefulWidget {
  List blanklist;
  int index;

  fp(this.blanklist, this.index);

  @override
  State<fp> createState() => _fpState();
}

class _fpState extends State<fp> {
  List<Color> listcolor = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.black,
    Colors.white,
  ];

  Color curentcolor = Colors.yellow;
  Color col = Colors.black;
  List<String> Emoji = [
    "😀 😃 😄 😁 😆 ",
    "😂 🤣 🥲 🥹 ☺️ ",
    "😇 🙂 🙃 😉 😌",
    "😍 🥰 😘 😗 😙",
    "😚 😋 😛 😝 😜",
    "🤪 🤨 🧐 🤓 😎",
    "🥸 🤩 🥳 😏 😒"
  ];
  String s = "😀 😃 😄 😁 😆 😅";
  double fsize = 20;
  WidgetsToImageController controller = WidgetsToImageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createFolder();
  }
  _createFolder()async {
    final folderName = "some_name";
    final path = Directory("storage/emulated/0/DCIM/$folderName");
    if ((await path.exists())) {
      // TODO:
      print("exist");
    } else {
      // TODO:
      print("not exist");
      path.create();
    }
    setState(() {
      STpath =path.path;
    });
    print('$STpath');
  }

  String STpath = "";
  String IMGname ="IMG${Random().nextInt(10000)}.jpeg";
  String IMpath ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.blanklist[widget.index]}"),
      ),
      body: Column(
        children: [
          Expanded(
            child: WidgetsToImage(
              controller: controller,
              child: Container(
                margin: EdgeInsets.all(20),
                color: curentcolor,
                child: Center(
                  child: Text(
                    "$s\n${widget.blanklist[widget.index]}\n$s",
                    style: TextStyle(
                      fontSize: fsize,
                      color: col,
                      fontFamily: "new",
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 200,
                          child: GridView.builder(
                            itemCount: listcolor.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 7),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pop(context);

                                  setState(() {
                                    curentcolor = listcolor[index];
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  color: listcolor[index],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  child: Text("BG color")),
              ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 200,
                          child: GridView.builder(
                            itemCount: listcolor.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 7),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pop(context);

                                  setState(() {
                                    col = listcolor[index];
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  color: listcolor[index],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  child: Text("Text color")),
              ElevatedButton(
                  onPressed: () {
                    controller.capture().then((value) {
                      print("===${value}");
                    });
                  String imn ="IMG${Random().nextInt(10000)}.jpg";
                  String imgp="$STpath/";
                  },
                  child: Text("Share"))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 200,
                          child: StatefulBuilder(
                            builder: (context, setState1) {
                              return Slider(
                                min: 10,
                                max: 40,
                                value: fsize,
                                onChanged: (value) {
                                  setState(() {
                                    setState1(() {
                                      fsize = value;
                                    });
                                  });
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  child: Text("Font size")),
              ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 200,
                          child: ListView.builder(
                            itemCount: Emoji.length,
                            itemBuilder: (context, index) {
                              // return  Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Center(child: Text("${Emoji[index]}")),
                              // );

                              return InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    s = Emoji[index];
                                  });
                                },
                                child: Center(
                                  child: Container(
                                    child: Text(
                                      "${Emoji[index]}",
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  child: Text("Emoji")),
              ElevatedButton(onPressed: () {}, child: Text("Fonts"))
            ],
          )
        ],
      ),
    );
  }
}
