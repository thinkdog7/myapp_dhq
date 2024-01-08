import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'Counselor.dart';
import 'GradientButton.dart';
import 'models/Advisor.dart';
import 'models/Service.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 10.0;
    Path path = Path()
      ..addRRect(RRect.fromRectAndCorners(
          Rect.fromLTWH(0, 0, size.width, size.height),
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius)))
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class TabItem extends StatefulWidget {
  String? id;
  String? name;
  String? avatar;
  String? desc;
  List<Service>? services;

  TabItem(var advisorMap, {super.key}) {
    Advisor advisor = Advisor.fromJson(advisorMap);
    id = advisor.advisor_id;
    name = advisor.advisor_name;
    avatar = advisor.advisor_avatar;
    desc = advisor.advisor_desc;
    services = advisor.services;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabItem(id, name, avatar, desc, services);
  }
}

class _TabItem extends State<StatefulWidget> {
  String? id;
  String? name;
  String? avatar;
  String? desc;
  List<Service>? services;
  Box? box;
  bool _favoriteResult = false;
  _TabItem(this.id, this.name, this.avatar, this.desc, this.services);

  void initState() {
    // TODO: implement initState
    super.initState();
    box = Hive.box("userInfo");
    if(box!=null){
      if(id!=null){
        if (box!.containsKey(id)) {
          print(id);
          _favoriteResult = box!.get(id);
          print("get:$_favoriteResult");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ClipPath(
      clipper: MyClipper(),
      child: Container(
          padding: EdgeInsets.all(3),
          color: Colors.orange,
          child: ClipPath(
            clipper: MyClipper(),
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  ClipPath(
                      clipper: MyClipper(),
                      child: Stack(
                        children: [
                          Image.network(
                            avatar ?? "NUll",
                            width: MediaQuery.of(context).size.width,
                            height: 230,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: Visibility(
                                    visible: _favoriteResult,
                                    child: Image.asset(
                                      "imags/smallSquare.png",
                                      fit: BoxFit.fill,
                                      height: 50,
                                      width: 50,
                                    ),
                              )),
                          Positioned(
                            left: 0,
                            bottom: 20,
                            child: Text(
                              textScaleFactor: 1.5,
                              style: TextStyle(
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.left,
                              name ?? "NULL",
                            ),
                          ),
                          Positioned(
                            left: 0,
                            bottom: 8,
                            child: Text(
                              textScaleFactor: 1.0,
                              style: TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              desc ?? "NULL",
                            ),
                          ),
                          Positioned(
                            left: 5,
                            top: 5,
                            child: Text(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                background: new Paint()..color = Colors.yellow,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.left,
                              "Top Accuracy",
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 5,
                            child: Container(
                              width: 30,
                              height: 30,
                              color: Colors.white,
                              child: Icon(Icons.account_balance),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 40,
                            child: Container(
                              width: 30,
                              height: 30,
                              color: Colors.white,
                              child: Icon(Icons.access_time),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 75,
                            child: Container(
                              width: 30,
                              height: 30,
                              color: Colors.white,
                              child: Icon(Icons.ac_unit_outlined),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 110,
                            child: Container(
                              width: 30,
                              height: 30,
                              color: Colors.white,
                              child: Icon(Icons.accessible_forward),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 145,
                            child: Container(
                              width: 30,
                              height: 30,
                              color: Colors.white,
                              child: Icon(Icons.account_circle),
                            ),
                          ),
                        ],
                      )),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: double.infinity),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text(
                                    "707",
                                    style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                Text(
                                  "Readings",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                                    child: Text(
                                      "=3.2h",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )),
                                Text(
                                  "Response in",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: GradientButton(
                          borderRadius: BorderRadius.circular(10),
                          height: 50.0,
                          width: 150,
                          onPressed: () async {
                           // print("in");
                            _favoriteResult = await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Counselor(id);
                              }),
                            );
                            //print("out");
                           // box!.put("favorite", favoriteResult.value);
                            print("TabItemResult: ${_favoriteResult}");
                          },
                          colors: const [
                            Colors.orangeAccent,
                            Colors.deepOrangeAccent
                          ],
                          child: const Text(
                            "Consult Now",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    ));
  }
}
