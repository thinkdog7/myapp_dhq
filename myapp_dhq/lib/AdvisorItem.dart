import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Counselor.dart';
import 'GradientButton.dart';
import 'models/Advisor.dart';
import 'models/Service.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 30.0;
    Path path = Path()
      ..addRRect(RRect.fromRectAndCorners(
          Rect.fromLTWH(0, 0, size.width, size.height),
          topLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius)))
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class AdvisorItem extends StatefulWidget {
  String? id;
  String? name;
  String? avatar;
  String? desc;
  List<Service>? services;

  AdvisorItem(var advisorMap, {super.key}) {
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
    return _AdvisorItem(id, name, avatar, desc, services);
  }
}

class _AdvisorItem extends State<StatefulWidget> {
  bool _favoriteResult = false;
  String? id;
  String? name;
  String? avatar;
  String? desc;
  List<Service>? services;
  @override
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
  Box? box;
  _AdvisorItem(this.id, this.name, this.avatar, this.desc, this.services);
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
              color: Colors.white70,
              child: Column(
                children: <Widget>[
                  ClipPath(
                      clipper: MyClipper(),
                      child: Stack(
                        children: [
                          Image.network(
                            avatar!,
                            width: MediaQuery.of(context).size.width,
                            height: 215,
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
                                  height: 30,
                                  width: 30,
                                ),
                              ))
                        ],
                      )),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: double.infinity),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              textScaleFactor: 1.5,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  foreground: Paint()
                                    ..shader = LinearGradient(colors: [
                                      Colors.orangeAccent,
                                      Colors.orange.shade700
                                    ]).createShader(
                                        const Rect.fromLTWH(0, 0, 100, 100))),
                              textAlign: TextAlign.left,
                              name!,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              textScaleFactor: 1.0,
                              style: TextStyle(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              desc!,
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
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: GradientButton(
                          borderRadius: BorderRadius.circular(30),
                          height: 50.0,
                          width: 150,
                          onPressed: () async {
                            _favoriteResult = await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Counselor(id);
                              }),
                            );
                            print("favorite = $_favoriteResult");
                            setState(() {});
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
