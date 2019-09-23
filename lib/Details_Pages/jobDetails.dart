import 'package:ConnectApp/DataModels/jobs.dart';
import 'package:flutter/material.dart';

class JobDetail extends StatelessWidget {
  final Job job;

  JobDetail({this.job});
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
                        "Job Number : ${job.jobNumber}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.0),
                      ),
                      Text("Description : ${job.description}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0)),
                      Text("Customer : ${job.customerName}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0)),
                      Text("BOM No : ${job.bomNo}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0)),
                      Text("EST Id : ${job.estId}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0)),
                      Text("Qty : ${job.qty}",
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
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0.0,
        title: Text('Job Detail - ' + job.jobNumber),
      ),
      body: bodyWidget(context),
    );
  }
}
