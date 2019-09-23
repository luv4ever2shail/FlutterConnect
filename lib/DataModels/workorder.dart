// To parse this JSON data, do
//
//     final items = itemsFromJson(jsonString);

import 'dart:convert';

WorkOrder itemsFromJson(String str) => WorkOrder.fromJson(json.decode(str));

String itemsToJson(WorkOrder data) => json.encode(data.toJson());

class WorkOrder {
  String jobNumber;
  String workOrder;
  String assyNo;
  String itemNo;
  String description;
  String qty;
  String fullSearch;

  WorkOrder({
    this.jobNumber,
    this.workOrder,
    this.assyNo,
    this.itemNo,
    this.description,
    this.qty,
    this.fullSearch,
  });

  factory WorkOrder.fromJson(Map<String, dynamic> json) => new WorkOrder(
        jobNumber: json["Job"],
        workOrder: json["WorkOrder"],
        assyNo: json["AssyNo"],
        itemNo: json["Item"],
        description: json["Description"],
        qty: json["Qty"].toString(),
        fullSearch: json["FullSearch"],
      );

  Map<String, dynamic> toJson() => {
        "Job": jobNumber,
        "WorkOrder": workOrder,
        "AssyNo": assyNo,
        "Item": itemNo,
        "Description": description,
        "Qty": qty,
        "FullSearch": fullSearch,
      };
}
