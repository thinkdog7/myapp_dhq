import 'package:flutter/material.dart';

class PlaceOrder extends StatefulWidget {
  String? imagPath;

  String? name;

  PlaceOrder(this.name, this.imagPath);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlaceOrder(name, imagPath);
  }
}

class _PlaceOrder extends State<StatefulWidget> {
  List<String> placeOrderList = [];

  bool _situationEnough=false;

  bool _questionEnough=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _situatonFocusNode = FocusNode();
    _questionFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _situatonController.dispose();
    _questionController.dispose();
    _situatonFocusNode.dispose();
    _questionFocusNode.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  String? imagPath;

  final _situatonController = TextEditingController();
  final _questionController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  late FocusNode _situatonFocusNode;
  late FocusNode _questionFocusNode;
  String? name;

  _PlaceOrder(this.name, this.imagPath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Counseling Form"),
          centerTitle: true,
          leading: BackButton(
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text("确定退出吗？"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                ..pop()
                                ..pop();
                            },
                            child: Text("确定")),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("取消")),
                      ],
                    );
                  });
              //Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.network(
                        imagPath ??
                            "https://p.qqan.com/up/2020-12/16070652276806379.jpg",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(
                            name ?? "NULL",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ))
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(
                        "Name",
                        style: TextStyle(fontSize: 30),
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 30),
                      child: Text(
                        "Lili",
                        style: TextStyle(fontSize: 20),
                      )),
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "General Situation",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            onChanged: (value){
                              setState(() {
                                if(value.isNotEmpty){
                                  _situationEnough=true;
                                }else{
                                _situationEnough=false;}
                              });

                            },
                            autovalidateMode: AutovalidateMode.always,
                            validator: (v) {
                              return v!.trim().isNotEmpty
                                  ? null
                                  : "Situation不能为空";
                            },
                            focusNode: _situatonFocusNode,
                            controller: _situatonController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(style: BorderStyle.none)),
                              fillColor: Colors.white70,
                              filled: true,
                              //labelText: "General Situation",
                              hintText: "Describe your situation",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Text(
                              "Specific Question",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          TextFormField(
                            onChanged: (value){
                              setState(() {
                                if(value.isNotEmpty){
                                  _questionEnough=true;
                                }else{
                                _questionEnough=false;}
                              });
                            },
                            autovalidateMode: AutovalidateMode.always,
                            validator: (v) {
                              return v!.trim().isNotEmpty
                                  ? null
                                  : "Question不能为空";
                            },
                            focusNode: _questionFocusNode,
                            controller: _questionController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(style: BorderStyle.none)),
                              //labelText: "Specific Question",
                              hintText: "One Question only",
                            ),
                          ),
                        ],
                      )),

                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          onPressed: _situationEnough&&_questionEnough ? () {} : null,
                          child: Column(
                            children: [
                              Text(
                                "Submit",
                                style: TextStyle(fontSize: 30),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(140, 0, 0, 0),
                                    child: Image.asset("imags/coin.png"),
                                  ),
                                  Text(
                                    "30",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              )
                            ],
                          )))
                ],
              )),
        ));
  }
}
