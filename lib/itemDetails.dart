import 'package:connect/items.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  final Items item;

  ItemDetail({this.item});
  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height - 250,
              width: MediaQuery.of(context).size.width - 30,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Item Number : ${item.itemNumber}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Description : ${item.description}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Family Code : ${item.familyCode}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("OEM : ${item.manufacturer}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("OEM Item Number : ${item.manufacturerItemNumber}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Designed By : ${item.designedBy}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Item Detail - ' + item.itemNumber),
      ),
      body: bodyWidget(context),
    );
  }
}
