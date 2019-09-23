// To parse this JSON data, do
//
//     final items = itemsFromJson(jsonString);

import 'dart:convert';

Job itemsFromJson(String str) => Job.fromJson(json.decode(str));

String itemsToJson(Job data) => json.encode(data.toJson());

class Job {
  String jobNumber;
  int estId;
  int estDoc;
  String bomNo;
  String description;
  String salesorder;
  String customerName;
  String qty;
  String note;
  String customerId;
  String fullSearch;

  Job({
    this.jobNumber,
    this.estId,
    this.estDoc,
    this.bomNo,
    this.description,
    this.salesorder,
    this.customerName,
    this.qty,
    this.note,
    this.customerId,
    this.fullSearch,
  });

  factory Job.fromJson(Map<String, dynamic> json) => new Job(
        jobNumber: json["Job"],
        estId: json["EstId"],
        estDoc: json["EstDoc"],
        bomNo: json["BOMItem"],
        description: json["Description"],
        salesorder: json["SalesOrder"],
        customerName: json["CustomerName"],
        qty: json["Qty"].toString(),
        note: json["Note"],
        customerId: json["CustomerID"],
        fullSearch: json["FullSearch"],
      );

  Map<String, dynamic> toJson() => {
        "Job": jobNumber,
        "EstId": estId,
        "EstDoc": estDoc,
        "BOMItem": bomNo,
        "Description": description,
        "SalesOrder": salesorder,
        "CustomerName": customerName,
        "Qty": qty,
        "Note": note,
        "CustomerID": customerId,
        "FullSearch": fullSearch,
      };
}
