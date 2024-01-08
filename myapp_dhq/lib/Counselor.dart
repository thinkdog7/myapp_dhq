import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:myapp_dhq/models/index.dart';
import 'PlaceOrder.dart';

class Counselor extends StatefulWidget {
  String? id;

  Counselor(String? id, {super.key}) {
    this.id = id;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Counselor(id);
  }
}

class _Counselor extends State<StatefulWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  //ValueNotifier<bool> favoriteResult = ValueNotifier<bool>(false);
  bool favoriteResult = false;
  List<Service>? services;
  Advisor? advisor;

  //final AsyncMemoizer _memoizer = AsyncMemoizer();

  request() async {
    //return _memoizer.runOnce(() async {
    try {
      Dio dio = Dio();
      String baseUrl =
          "https://c5qyslgwde.execute-api.us-east-1.amazonaws.com/prod";
      Response advisorJson = await dio
          .get("$baseUrl/advisor-detail", queryParameters: {"advisor_id": id});
      var advisorMap = advisorJson.data;
      advisor = Advisor.fromJson(advisorMap);
      services = advisor?.services ?? [];
      dio.close();
      if(box!=null){
        if(advisor!=null){
          if (box!.containsKey(advisor!.advisor_id)) {
            print(advisor!.advisor_id);
            favoriteResult = box!.get(advisor!.advisor_id);
            print("get:$favoriteResult");
          }
        }
      }
    } catch (e) {
      String _text = "请求失败：$e";
    } finally {}
    //  }
    // );
  }

  String? id;

  _Counselor(this.id);

  Box? box;

  @override
  void initState() {
    request();
    // TODO: implement initState
    super.initState();
    box = Hive.box("userInfo");

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context, favoriteResult);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: request(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // 请求成功，显示数据
              return Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      //borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage("imags/bg3.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 150, 5, 5),
                      child: Container(
                          width: 400,
                          height: 400,
                          //padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                          color: Colors.white,
                          child: Stack(
                            clipBehavior: Clip.none,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Positioned(
                                left: 10,
                                top: -30,
                                child: ClipOval(
                                  child: Image.network(
                                    advisor?.advisor_avatar ??
                                        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202007%2F07%2F20200707113705_VFJvw.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1706236537&t=1cfecd89c171f4cf7a79f95bb3dbbcd6",
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                  right: 10,
                                  top: 10,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: favoriteResult
                                          ? MaterialStateProperty.all(
                                              Colors.red)
                                          : MaterialStateProperty.all(
                                              Colors.grey),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      )),
                                    ),
                                    onPressed: () {
                                      favoriteResult = !favoriteResult;
                                      box!.put(advisor?.advisor_id ?? "NULL",
                                          favoriteResult);
                                      var a = box!.get(advisor?.advisor_id ?? "NULL");
                                      print("put:$a");
                                      setState(() {
                                        if (favoriteResult) {
                                          print(advisor?.advisor_id ?? "NULL");
                                          print(advisor?.advisor_avatar ??
                                              "NULL");
                                          Fluttertoast.showToast(
                                              msg: "收藏成功",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.black45,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                      }
                                      );
                                    },
                                    child: Text(favoriteResult ? "已收藏" : "收藏"),
                                  )),
                              Positioned(
                                left: 10,
                                top: 100,
                                child: Text(
                                  advisor?.advisor_name ?? "NULL",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                top: 150,
                                child: Text(
                                  advisor?.advisor_desc ?? "NULL",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.grey),
                                ),
                              ),
                              Positioned(
                                top: 190,
                                left: 10,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Container(
                                      width: 360,
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      color: Colors.orange,
                                      child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 110, 0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 0, 0, 0),
                                                          child: Text(
                                                            services?[0]
                                                                    .service_name ??
                                                                "null",
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          services?[0]
                                                                  .service_desc ??
                                                              "NULL",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  ElevatedButton.icon(
                                                    label: Text(services?[0]
                                                            .service_price
                                                            .toString() ??
                                                        "NULL"),
                                                    icon: Image.asset(
                                                        "imags/coin.png"),
                                                    onPressed: () {
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) {
                                                        return PlaceOrder(
                                                            advisor?.advisor_name ??
                                                                "NULL",
                                                            advisor?.advisor_avatar ??
                                                                "NULL");
                                                      }));
                                                    },
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  Colors.green),
                                                      shape: MaterialStateProperty
                                                          .all(
                                                              RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 20, 0, 20),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 100, 0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                    0, 0, 0, 0),
                                                            child: Text(
                                                              services?[1]
                                                                      .service_name
                                                                      .toString() ??
                                                                  "NULL",
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            services?[1]
                                                                    .service_desc
                                                                    .toString() ??
                                                                "NULL",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    ElevatedButton.icon(
                                                      label: Text(services?[1]
                                                              .service_price
                                                              .toString() ??
                                                          "NULL"),
                                                      icon: Image.asset(
                                                          "imags/coin.png"),
                                                      onPressed: () {
                                                        print("pressed");
                                                        Navigator.push(context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          return PlaceOrder(
                                                              advisor?.advisor_name ??
                                                                  "NULL",
                                                              advisor?.advisor_avatar ??
                                                                  "NULL");
                                                        }));
                                                      },
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .green),
                                                        shape: MaterialStateProperty
                                                            .all(
                                                                RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 100, 0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 0, 0, 0),
                                                          child: Text(
                                                            services?[2]
                                                                    .service_name
                                                                    .toString() ??
                                                                "NULL",
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          services?[2]
                                                                  .service_desc
                                                                  .toString() ??
                                                              "NULL",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  ElevatedButton.icon(
                                                    label: Text(services?[2]
                                                            .service_price
                                                            .toString() ??
                                                        "NULL"),
                                                    icon: Image.asset(
                                                        "imags/coin.png"),
                                                    onPressed: () {
                                                      print("pressed");
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) {
                                                        return PlaceOrder(
                                                            advisor?.advisor_name ??
                                                                "NULL",
                                                            advisor?.advisor_avatar ??
                                                                "NULL");
                                                      }));
                                                    },
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  Colors.green),
                                                      shape: MaterialStateProperty
                                                          .all(
                                                              RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          child: Text(
                            "About Me",
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          child: Text(
                            "$str",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }

  String str =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ";
}
