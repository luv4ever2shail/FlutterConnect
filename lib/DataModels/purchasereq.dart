// To parse this JSON data, do
//
//     final items = itemsFromJson(jsonString);

import 'dart:convert';

PurchaseReq itemsFromJson(String str) => PurchaseReq.fromJson(json.decode(str));

String itemsToJson(PurchaseReq data) => json.encode(data.toJson());

class PurchaseReq {
  String reqNumber;
  String jobNumber;
  String requestedBy;
  String subAssyNo;
  String itemNo;
  String description;
  String qty;
  String fullSearch;

  PurchaseReq({
    this.reqNumber,
    this.jobNumber,
    this.requestedBy,
    this.subAssyNo,
    this.itemNo,
    this.description,
    this.qty,
    this.fullSearch,
  });

  factory PurchaseReq.fromJson(Map<String, dynamic> json) => new PurchaseReq(
        jobNumber: json["ReqNumber"],
        reqNumber: json["JobNumber"],
        requestedBy: json["WorkOrder"],
        subAssyNo: json["AssyNo"],
        itemNo: json["Item"],
        description: json["Description"],
        qty: json["Qty"].toString(),
        fullSearch: json["FullSearch"],
      );

  Map<String, dynamic> toJson() => {
        "Job": jobNumber,
        "WorkOrder": requestedBy,
        "AssyNo": subAssyNo,
        "Item": itemNo,
        "Description": description,
        "Qty": qty,
        "FullSearch": fullSearch,
      };
}
