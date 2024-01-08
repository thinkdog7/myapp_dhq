import 'package:flutter/material.dart';
import 'package:myapp_dhq/MyOrderInfo.dart';
import 'package:myapp_dhq/OrderItem.dart';

class Orders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Orders();
  }
}

class _Orders extends State<StatefulWidget> {
  List<MyOrderInfo> myOrderInfo = [];

  @override
  void dispose() {
    // Hive.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("My Order"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemExtent: 200,
        //shrinkWrap: true,
        itemCount: myOrderInfo.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: OrderItem(myOrderInfo[index]));

          //return Text("$index");
        },
      ),
    );
  }

  void initDate() {
    MyOrderInfo order1 = MyOrderInfo(
        "Dam",
        "https://img0.baidu.com/it/u=3510476007,2937706385&fm=253&fmt=auto&app=138&f=JPEG?w=501&h=500",
        "Text Reading",
        "Wsc",
        "1999-01-01");
    MyOrderInfo order2 = MyOrderInfo(
        "Why",
        "https://img2.baidu.com/it/u=2858080314,6149206&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
        "Text Reading",
        "Qqq",
        "1998-01-01");
    MyOrderInfo order3 = MyOrderInfo(
        "Sam",
        "https://img0.baidu.com/it/u=602580414,1995124374&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=502",
        "Text Reading",
        "Www",
        "1997-01-01");
    MyOrderInfo order4 = MyOrderInfo(
        "Dark",
        "https://img2.baidu.com/it/u=915570222,2594128026&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
        "Text Reading",
        "Eee",
        "1996-01-01");
    MyOrderInfo order5 = MyOrderInfo(
        "Top",
        "https://img2.baidu.com/it/u=1762441315,2644817457&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=501",
        "Text Reading",
        "Rtt",
        "1995-01-01");
    myOrderInfo.addAll([order1, order2, order3, order4, order5]);
  }
}
