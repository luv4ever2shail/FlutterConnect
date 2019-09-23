import 'package:ConnectApp/DataModels/workorder.dart';
import 'package:flutter/material.dart';

class WorkOrderDetail extends StatelessWidget {
  final WorkOrder wo;

  WorkOrderDetail({this.wo});
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
                        "Work Order : ${wo.workOrder}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text("Description : ${wo.description}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0)),
                      Text("Job No : ${wo.jobNumber}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0)),
                      Text("Assy No : ${wo.assyNo}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0)),
                      Text("Item : ${wo.itemNo}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0)),
                      Text("Qty : ${wo.qty}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0)),
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
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0.0,
        title: Text('Work Order Detail - ' + wo.workOrder),
      ),
      body: bodyWidget(context),
    );
  }
}
