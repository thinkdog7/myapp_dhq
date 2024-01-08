import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:myapp_dhq/TabItem.dart';
import 'GradientButton.dart';

class TabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabPagePage();
  }
}

class _TabPagePage extends State<StatefulWidget> {
  List? advisorsList;
  List? myFavoriteList = [];
  Box? box;

  request() async {
    try {
      Dio dio = Dio();
      String baseUrl =
          "https://c5qyslgwde.execute-api.us-east-1.amazonaws.com/prod";
      Response response = await dio.get("$baseUrl/advisor-list");
      advisorsList = response.data;
      dio.close();
    } catch (e) {
      String _text = "请求失败：$e";
    } finally {}
  }

  @override
  void initState() {
    super.initState();
    Hive.box("userInfo");
    if (box != null) {
      for(var i=100001;1<100014;i++){
        box!.containsKey("$i");
        myFavoriteList?.add(box!.get("$i"));
      }

    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 0, 10),
                child: Row(children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Soulight",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Icon(Icons.ac_unit_rounded),
                        Icon(Icons.access_alarm_sharp),
                        Icon(Icons.search),
                      ],
                    ),
                  )
                ]),
              ),
              Stack(
                children: [
                  Image.network(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw%2F22012974-f648-4a17-aec5-2e7f376fcbd2%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1707028239&t=ecf5ea7370f0e24bb57dc45de768d387"),
                  Positioned(
                      left: 20,
                      top: 150,
                      child: ClipOval(
                          child: Container(
                              width: 60,
                              height: 60,
                              color: Colors.white,
                              padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                              child: ClipOval(
                                child: Image.network(
                                  "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F9e18d14b-8a44-41b0-97d9-6aed05b70e7f%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1707019547&t=f8ba195837c1cc7bc9736a60e0c19e01",
                                  width: 50,
                                  height: 50,
                                ),
                              )))),
                  Positioned(
                      left: 100,
                      top: 160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Stella Malone",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Container(
                            width: 300,
                            child: Text(
                              "A metaverse is a network of 3D virtual worlds focused on social connection.",
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.white,
                      child: Icon(Icons.access_time_filled),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 40,
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.white,
                      child: Icon(Icons.access_time),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 75,
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.white,
                      child: Icon(Icons.access_time),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 110,
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.white,
                      child: Icon(Icons.account_balance),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        color: Colors.white,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
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
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: GradientButton(
                                    borderRadius: BorderRadius.circular(10),
                                    // height: 50.0,
                                    // width: 150,
                                    onPressed: () async {},
                                    colors: const [
                                      Colors.orangeAccent,
                                      Colors.deepOrangeAccent
                                    ],
                                    child: const Text(
                                      "Consult Now",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      )),
                ],
              ),
              Text(
                textAlign: TextAlign.start,
                "New Advisor",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Expanded(
                flex: 5,
                child: FutureBuilder(
                  future: request(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return GridView.builder(
                      itemCount: advisorsList?.length ?? 0,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 2,
                        childAspectRatio: 0.59,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return TabItem(advisorsList?[index] ?? "NUll");
                      },
                    );
                  },
                ),
              ),
              Text(
                textAlign: TextAlign.start,
                "My Favorites",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Column(
                            children: [
                              ClipOval(
                                  child: Image.network(
                                "https://img0.baidu.com/it/u=2916995796,2805233325&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              )),
                              Text(
                                "qwereqw",
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          )
                        ],
                      );

                      //   Row(
                      //   children: [
                      //     Padding(
                      //         padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      //         child: Row(
                      //           children: [
                      //             Padding(
                      //               padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      //               child: Column(
                      //                 children: [
                      //                   ClipOval(
                      //                       child: Image.network(
                      //                     "https://img0.baidu.com/it/u=2916995796,2805233325&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                      //                     width: 40,
                      //                     height: 40,
                      //                   )),
                      //                   Text(
                      //                     "qwereqw",
                      //                     overflow: TextOverflow.ellipsis,
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //             Padding(
                      //               padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      //               child: Column(
                      //                 children: [
                      //                   ClipOval(
                      //                       child: Image.network(
                      //                     "https://img0.baidu.com/it/u=2916995796,2805233325&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                      //                     width: 40,
                      //                     height: 40,
                      //                   )),
                      //                   Text(
                      //                     "qwereqw",
                      //                     overflow: TextOverflow.ellipsis,
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //             Padding(
                      //               padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      //               child: Column(
                      //                 children: [
                      //                   ClipOval(
                      //                       child: Image.network(
                      //                     "https://img0.baidu.com/it/u=2916995796,2805233325&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                      //                     width: 40,
                      //                     height: 40,
                      //                   )),
                      //                   Text(
                      //                     "qwereqw",
                      //                     overflow: TextOverflow.ellipsis,
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //             Padding(
                      //               padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      //               child: Column(
                      //                 children: [
                      //                   ClipOval(
                      //                       child: Image.network(
                      //                     "https://img0.baidu.com/it/u=2916995796,2805233325&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                      //                     width: 40,
                      //                     height: 40,
                      //                   )),
                      //                   Text(
                      //                     "qwereqw",
                      //                     overflow: TextOverflow.ellipsis,
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //             Padding(
                      //               padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      //               child: Column(
                      //                 children: [
                      //                   ClipOval(
                      //                       child: Image.network(
                      //                     "https://img0.baidu.com/it/u=2916995796,2805233325&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                      //                     width: 40,
                      //                     height: 40,
                      //                   )),
                      //                   Text(
                      //                     "qwereqw",
                      //                     overflow: TextOverflow.ellipsis,
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //             Padding(
                      //               padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      //               child: Column(
                      //                 children: [
                      //                   ClipOval(
                      //                       child: Image.network(
                      //                     "https://img0.baidu.com/it/u=2916995796,2805233325&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                      //                     width: 40,
                      //                     height: 40,
                      //                   )),
                      //                   Text(
                      //                     "qwereqw",
                      //                     overflow: TextOverflow.ellipsis,
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //             Padding(
                      //               padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      //               child: Column(
                      //                 children: [
                      //                   ClipOval(
                      //                       child: Image.network(
                      //                     "https://img0.baidu.com/it/u=2916995796,2805233325&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                      //                     width: 40,
                      //                     height: 40,
                      //                   )),
                      //                   Text(
                      //                     "qwereqw",
                      //                     overflow: TextOverflow.ellipsis,
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //             Padding(
                      //               padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      //               child: Column(
                      //                 children: [
                      //                   ClipOval(
                      //                       child: Image.network(
                      //                     "https://img0.baidu.com/it/u=2916995796,2805233325&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                      //                     width: 40,
                      //                     height: 40,
                      //                   )),
                      //                   Text(
                      //                     "qwereqw",
                      //                     overflow: TextOverflow.ellipsis,
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //             Padding(
                      //               padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      //               child: Column(
                      //                 children: [
                      //                   ClipOval(
                      //                       child: Image.network(
                      //                     "https://img0.baidu.com/it/u=2916995796,2805233325&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
                      //                     width: 40,
                      //                     height: 40,
                      //                   )),
                      //                   Text(
                      //                     "qwereqw",
                      //                     overflow: TextOverflow.ellipsis,
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         )),
                      //   ],
                      // );
                    },
                  )),
            ],
          )),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
