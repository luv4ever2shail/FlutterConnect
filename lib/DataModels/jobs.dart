// To parse this JSON data, do
//
//     final items = itemsFromJson(jsonString);

import 'dart:convert';

Jobs itemsFromJson(String str) => Jobs.fromJson(json.decode(str));

String itemsToJson(Jobs data) => json.encode(data.toJson());

class Jobs {
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

  Jobs({
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

  factory Jobs.fromJson(Map<String, dynamic> json) => new Jobs(
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
