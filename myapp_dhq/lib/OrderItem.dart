import 'package:flutter/material.dart';
import 'package:myapp_dhq/MyOrderInfo.dart';

class OrderItem extends StatefulWidget {
  String? name;

  String? imagPath;

  String? textReading;
  String? hint;

  String? orderDate;

  OrderItem(MyOrderInfo OrderInfo, {super.key}) {
    name = OrderInfo.name;
    imagPath = OrderInfo.imagPath;
    textReading = OrderInfo.textReading;
    hint = OrderInfo.hint;
    orderDate = OrderInfo.orderDate;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OrderItem(name!, imagPath!, textReading!, hint!, orderDate!);
  }
}

class _OrderItem extends State<StatefulWidget> {
  String? name;

  String? imagPath;

  String? textReading;
  String? hint;

  String? orderDate;

  _OrderItem(String this.name, String this.imagPath, String this.textReading,
      String this.hint, String this.orderDate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              imagPath!,
                              width: 100,
                              height: 100,
                            ),
                          )),
                      Expanded(
                        flex: 1,
                        child: Text(
                          name!,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text(
                                  textReading!,
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  hint!,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Text(
                                orderDate!,
                                style: TextStyle(fontSize: 18),
                              ))
                        ],
                      )),
                )
              ],
            )));
  }
}
