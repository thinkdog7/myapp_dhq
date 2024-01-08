import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class editMyInfo extends StatefulWidget {
  String? name;

  String? bio;

  String? aboutMe;

  editMyInfo(String name, String bio, String aboutMe) {
    this.name = name;
    this.bio = bio;
    this.aboutMe = aboutMe;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _editMyInfo(name!, bio!, aboutMe!);
  }
}

class _editMyInfo extends State<StatefulWidget> {
  String imagePath = "";
  bool haveFlieImage = false;

  final _unameController = TextEditingController();
  final _ubioController = TextEditingController();
  final _ubrithController = TextEditingController();
  final _uaboutController = TextEditingController();
  late FocusNode unameFocusNode;
  late FocusNode ubioFocusNode;
  late FocusNode ubrithFocusNode;
  late FocusNode uaboutFocusNode;
  late final Box box;

  String? name;
  String? bio;
  String brith = "1999-01-01";
  String? aboutMe;
  final GlobalKey _formKey = GlobalKey<FormState>();

  _editMyInfo(this.name, this.bio, this.aboutMe);

  @override
  void dispose() {
    _unameController.dispose();
    _ubioController.dispose();
    _ubrithController.dispose();
    _uaboutController.dispose();
    unameFocusNode.dispose();
    ubioFocusNode.dispose();
    ubrithFocusNode.dispose();
    uaboutFocusNode.dispose();
    // Hive.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Hive.initFlutter();
    unameFocusNode = FocusNode();
    ubioFocusNode = FocusNode();
    ubrithFocusNode = FocusNode();
    uaboutFocusNode = FocusNode();
    box = Hive.box("userInfo");
    //_getInfo();
    _unameController.text =name!;
    _ubioController.text = bio!;
    _ubrithController.text = brith;
    _uaboutController.text = aboutMe!;
  }

  _addInfo() async {
    box.put("name", name);
    box.put("bio", bio);
    box.put("brith", brith);
    box.put("about", aboutMe);
    print("add");
    print("$name,$bio,$brith,$aboutMe");
  }

  _getInfo() {
    name = box.get("name");
    bio = box.get("bio");
    brith = box.get("brith");
    aboutMe = box.get("about");
    print("get");
    print("$name,$bio,$brith,$aboutMe");
  }

  _updateInfo() {}

  _deleteInfo() {}

  @override
  Widget build(BuildContext context) {
    int _selectedValue = 1;

    return Scaffold(
        //resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  unameFocusNode.unfocus();
                  ubioFocusNode.unfocus();
                  ubrithFocusNode.unfocus();
                  uaboutFocusNode.unfocus();
                  if ((_formKey.currentState as FormState).validate()) {
                    name = _unameController.text;
                    bio = _ubioController.text;
                    brith = _ubrithController.text;
                    aboutMe = _uaboutController.text;
                    _addInfo();
                  } else if (name!.isEmpty) {
                    FocusScope.of(context).requestFocus(unameFocusNode);
                  } else if (bio!.isEmpty) {
                    FocusScope.of(context).requestFocus(ubioFocusNode);
                  } else if (brith.isEmpty) {
                    FocusScope.of(context).requestFocus(ubrithFocusNode);
                  } else if (aboutMe!.isEmpty) {
                    FocusScope.of(context).requestFocus(uaboutFocusNode);
                  }
                }),
          ],
          centerTitle: true,
          title: Text("Profile Edit"),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                child: Row(children: [
                  Expanded(
                      child: Image(
                    height: 200,
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fe097b292-1c06-4e13-8524-2d0af9c19bed%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1706432489&t=1dee0ceab34ff28225d623dc4f725557"),
                  ))
                ]),
              ),
              Positioned(
                  left: 150,
                  top: 150,
                  child: ClipOval(
                      child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("选择头像"),
                              actions: [
                                TextButton(
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                      final pickedImage = await ImagePicker()
                                          .pickImage(
                                              source: ImageSource.gallery);
                                      imagePath = pickedImage!.path;
                                      haveFlieImage = true;
                                      setState(() {});
                                    },
                                    child: Text("从相册选择"))
                              ],
                            );
                          });
                    },
                    child: Image(
                      fit: BoxFit.fill,
                      width: 100,
                      height: 100,
                      image: haveFlieImage
                          ? FileImage(new File(imagePath)) as ImageProvider
                          : NetworkImage(
                              "https://img0.baidu.com/it/u=3121974779,1726178990&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"),
                    ),
                  ))),
            ],
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
              child: GestureDetector(
                  onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  validator: (v) {
                                    return v!.trim().isNotEmpty
                                        ? null
                                        : "姓名不能为空";
                                  },
                                  focusNode: unameFocusNode,
                                  onSaved: (value) {
                                    name = value!;
                                  },
                                  maxLength: 10,
                                  controller: _unameController,
                                  decoration: InputDecoration(
                                      labelText: "Name",
                                      hintText: "Enter your name",
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                                TextFormField(
                                  maxLength: 100,
                                  maxLines: 2,
                                  controller: _ubioController,
                                  focusNode: ubioFocusNode,
                                  // autofocus: true,
                                  onSaved: (value) {
                                    bio = value!;
                                  },
                                  validator: (v) {
                                    return v!.trim().isNotEmpty
                                        ? null
                                        : "Bio不能为空";
                                  },
                                  decoration: InputDecoration(
                                      labelText: "Bio",
                                      hintText: "Enter your bio",
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                                Text(
                                  "Gender",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: RadioListTile(
                                          title: Text("Male"),
                                          value: 1,
                                          groupValue: _selectedValue,
                                          onChanged: (value) {
                                            print("chageTo Male");
                                            setState(() {
                                              _selectedValue = value as int;
                                              print("$_selectedValue");
                                            });
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                          title: Text("Female"),
                                          value: 2,
                                          groupValue: _selectedValue,
                                          onChanged: (value) {
                                            print("chageTo Female");
                                            setState(() {
                                              _selectedValue = value as int;
                                              print("$_selectedValue");
                                            });
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                          title: Text("Not Specified"),
                                          value: 0,
                                          groupValue: _selectedValue,
                                          onChanged: (value) {
                                            print("chageTo Not Specified");
                                            setState(() {
                                              _selectedValue = value as int;
                                              print("$_selectedValue");
                                            });
                                          },
                                        ),
                                      ),
                                    ]),
                                TextFormField(
                                  controller: _ubrithController,
                                  focusNode: ubrithFocusNode,
                                  onTap: () async {
                                    var data = await showDatePicker(
                                        context: context,
                                        helpText: "选择日期",
                                        cancelText: "取消",
                                        confirmText: "确定",
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1890),
                                        lastDate: DateTime(2099));
                                    String yearString = data!.year.toString();
                                    String monthString = data!.month.toString();
                                    String dayString = data!.day.toString();
                                    brith =
                                        "$yearString-$monthString-$dayString";
                                    _ubrithController.text = brith;
                                    print("Brith：$brith");
                                  },
                                  onSaved: (value) {
                                    brith = value!;
                                  },
                                  // autofocus: true,
                                  validator: (v) {
                                    return v!.trim().isNotEmpty
                                        ? null
                                        : "生日不能为空";
                                  },
                                  decoration: InputDecoration(
                                      labelText: "Date of Birth",
                                      hintText: "Enter your Birth",
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: TextFormField(
                                    maxLength: 299,
                                    maxLines: 7,
                                    controller: _uaboutController,
                                    focusNode: uaboutFocusNode,
                                    onSaved: (value) {
                                      aboutMe = value!;
                                    },
                                    //autofocus: true,
                                    validator: (v) {
                                      return v!.trim().isNotEmpty
                                          ? null
                                          : "About Me不能为空";
                                    },
                                    decoration: InputDecoration(
                                        labelText: "About Me",
                                        hintText: "Enter your about",
                                        labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  ),
                                ),
                              ],
                            )),
                      ])))
        ])));
  }
}
