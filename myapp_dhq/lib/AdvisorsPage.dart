import 'package:flutter/material.dart';
import 'package:myapp_dhq/AdvisorItem.dart';
import 'package:dio/dio.dart';
import 'package:myapp_dhq/TabPage.dart';
import 'myInfo.dart';

class AdvisorsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AdvisorsPage();
  }
}

class _AdvisorsPage extends State<StatefulWidget> {
  List advisorsList = [];

  request() async {
    try {
      Dio dio = Dio();
      String baseUrl =
          "https://c5qyslgwde.execute-api.us-east-1.amazonaws.com/prod";
      Response response = await dio!.get("$baseUrl/advisor-list");
      advisorsList = response.data;
      dio.close();
    } catch (e) {
      String _text = "请求失败：$e";
    } finally {}
  }

  @override
  void initState() {
    request();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: request(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text("Error: ${snapshot.error}");
            } else {
              // 请求成功，显示数据
              return Scaffold(
                body: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("imags/bg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 50, 20, 30),
                          child: Row(children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                "Advisors",
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.amber),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    )),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return TabPage();
                                  }));
                                },
                                child: Text(
                                  "Lili",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                              ),
                            )
                          ]),
                        ),
                        Expanded(
                          child: GridView.builder(
                            itemCount: advisorsList!.length,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              crossAxisCount: 2,
                              childAspectRatio: 0.54,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return AdvisorItem(advisorsList![index]);
                            },
                          ),
                        ),
                      ],
                    )),
              );
            }
          } else {
            // 请求未结束，显示loading
            return Text("Laoding");
          }
        }); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
