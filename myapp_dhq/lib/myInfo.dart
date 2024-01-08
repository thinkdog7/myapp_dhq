import 'package:flutter/material.dart';
import 'package:myapp_dhq/models/Me.dart';
import 'editMyInfo.dart';
import 'package:dio/dio.dart';

class myInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _myInfo();
  }
}

class _myInfo extends State<StatefulWidget> {
  Me? me;

  request() async {
    try {
      Dio dio = Dio();
      String baseUrl =
          "https://c5qyslgwde.execute-api.us-east-1.amazonaws.com/prod";
      Response meJson = await dio.get("$baseUrl/me");
      var meMap = meJson.data;
      me = Me.fromJson(meMap);
      dio.close();
    } catch (e) {
      String _text = "请求失败：$e";
    } finally {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    request();
  }

  @override
  void dispose() {

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   leading: BackButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        // ),
        body: FutureBuilder(
      future: request(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("imags/bg2.png"), fit: BoxFit.fill),
            ),
            child: Stack(
              children: [
                Positioned(
                    right: 20,
                    top: 20,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return editMyInfo(me!.name, me!.bio, me!.aboutMe);
                        }));
                      },
                      icon: Image(
                        image: AssetImage("imags/edit.png"),
                      ),
                    )),
                Positioned(
                  left: 20,
                  top: 100,
                  child: Image(
                    image: AssetImage("imags/defaultAvatar.png"),
                  ),
                ),
                Positioned(
                  child: Text(
                    me?.name??"NULL",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  left: 20,
                  top: 200,
                ),
                Positioned(
                    left: 10,
                    top: 300,
                    child: Row(mainAxisSize: MainAxisSize.max, children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Image(
                            image: AssetImage("imags/buy.png"),
                          ),
                          label: Text(
                            "Buy coins",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(200, 0, 0, 0),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Image.asset("imags/arrow.png")))
                    ])),
                Positioned(
                    left: 10,
                    top: 400,
                    child: Row(mainAxisSize: MainAxisSize.max, children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Image(
                            image: AssetImage("imags/Feedback.png"),
                          ),
                          label: Text(
                            "Feedback",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(200, 0, 0, 0),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Image.asset("imags/arrow.png")))
                    ])),
                Positioned(
                    left: 10,
                    top: 500,
                    child: Row(mainAxisSize: MainAxisSize.max, children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Image(
                            image: AssetImage("imags/logout.png"),
                          ),
                          label: Text(
                            "Logout",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(225, 0, 0, 0),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Image.asset("imags/arrow.png")))
                    ])),
              ],
            ));
      },
    ));
  }
}
