import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart'; // Add this import

import 'fp.dart';

class tp extends StatefulWidget {
  List blanklist;
  int index;

  tp(this.blanklist, this.index);

  @override
  State<tp> createState() => _tpState();
}

class _tpState extends State<tp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Card(
              margin: EdgeInsets.all(20),
              color: Colors.black,
              child: Center(
                child: Text(
                  "${widget.blanklist[widget.index]}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                            text: "${widget.blanklist[widget.index]}"))
                        .then((value) => Fluttertoast.showToast(
                            msg: "COPIED",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 20.0));
                  },
                  icon: Icon(Icons.copy)),
            ),
            Expanded(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (widget.index <
                          (widget.blanklist.length -
                              1)) if (widget.index != 0) {
                        {
                          widget.index--;
                        }
                      }
                    });
                  },
                  icon: Icon(Icons.arrow_back)),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return fp(widget.blanklist, widget.index);
                    },
                  ));
                },
              ),
            ),
            Expanded(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (widget.index < (widget.blanklist.length - 1)) {
                        widget.index++;
                      }
                    });
                  },
                  icon: Icon(Icons.arrow_forward)),
            ),
            Expanded(
              child: IconButton(
                  onPressed: () {
                    Share.share('${widget.blanklist[widget.index]}');
                  },
                  icon: Icon(Icons.share)),
            )
          ],
        )
      ],
    ));
  }
}
