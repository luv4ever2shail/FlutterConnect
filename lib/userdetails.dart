import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  final List user;
  final int position;

  UserDetail({this.user, this.position});

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Name : ${user[position]['Name']}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("User Name : ${user[position]['UserName']}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Department : ${user[position]['Department']}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Employee Id : ${user[position]['Emp_Id']}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      "Active Block Number : ${user[position]['ActiveBlockNumber']}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Email : ${user[position]['Email']}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Shares Folder : ${user[position]['SharedFolder']}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      "Admin : " +
                          (user[position]['Admin'].toString() == '1'
                              ? 'Yes'
                              : 'No'),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      "Developer : " +
                          (user[position]['Developer'].toString() == '1'
                              ? 'Yes'
                              : 'No'),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      "Management : " +
                          (user[position]['Management'].toString() == '1'
                              ? 'Yes'
                              : 'No'),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      "Quote : " +
                          (user[position]['Quote'].toString() == '1'
                              ? 'Yes'
                              : 'No'),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      "PurchaseReq : " +
                          (user[position]['PurchaseReq'].toString() == '1'
                              ? 'Yes'
                              : 'No'),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      "PurchaseReqApproval : " +
                          (user[position]['PurchaseReqApproval'].toString() ==
                                  '1'
                              ? 'Yes'
                              : 'No'),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      "PurchaseReqApproval2 : " +
                          (user[position]['PurchaseReqApproval2'].toString() ==
                                  '1'
                              ? 'Yes'
                              : 'No'),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      "PurchaseReqBuyer : " +
                          (user[position]['PurchaseReqBuyer'].toString() == '1'
                              ? 'Yes'
                              : 'No'),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      "PriceRight : " +
                          (user[position]['PriceRight'].toString() == '1'
                              ? 'Yes'
                              : 'No'),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      "Shipping : " +
                          (user[position]['Shipping'].toString() == '1'
                              ? 'Yes'
                              : 'No'),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      "WOScan : " +
                          (user[position]['WOScan'].toString() == '1'
                              ? 'Yes'
                              : 'No'),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      "CribCheckout : " +
                          (user[position]['CribCheckout'].toString() == '1'
                              ? 'Yes'
                              : 'No'),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      "CribShort : " +
                          (user[position]['CribShort'].toString() == '1'
                              ? 'Yes'
                              : 'No'),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      "Supervisor : " +
                          (user[position]['Supervisor'].toString() == '1'
                              ? 'Yes'
                              : 'No'),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        title: Text('User Details'),
      ),
      body: bodyWidget(context),
    );
  }
}
