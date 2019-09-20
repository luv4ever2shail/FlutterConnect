// To parse this JSON data, do
//
//     final items = itemsFromJson(jsonString);

import 'dart:convert';

Items itemsFromJson(String str) => Items.fromJson(json.decode(str));

String itemsToJson(Items data) => json.encode(data.toJson());

class Items {
  String itemNumber;
  String description;
  String familyCode;
  String manufacturer;
  String manufacturerItemNumber;
  String designedBy;
  String dateCreated;
  String lastSavedBy;
  String lastEdited;
  String material;
  String fullSearch;

  Items({
    this.itemNumber,
    this.description,
    this.familyCode,
    this.manufacturer,
    this.manufacturerItemNumber,
    this.designedBy,
    this.dateCreated,
    this.lastSavedBy,
    this.lastEdited,
    this.material,
    this.fullSearch,
  });

  factory Items.fromJson(Map<String, dynamic> json) => new Items(
        itemNumber: json["ItemNumber"],
        description: json["Description"],
        familyCode: json["FamilyCode"],
        manufacturer: json["Manufacturer"],
        manufacturerItemNumber: json["ManufacturerItemNumber"],
        designedBy: json["DesignedBy"],
        dateCreated: json["DateCreated"],
        lastSavedBy: json["LastSavedBy"],
        lastEdited: json["LastEdited"],
        material: json["Material"],
        fullSearch: json["FullSearch"],
      );

  Map<String, dynamic> toJson() => {
        "ItemNumber": itemNumber,
        "Description": description,
        "FamilyCode": familyCode,
        "Manufacturer": manufacturer,
        "ManufacturerItemNumber": manufacturerItemNumber,
        "DesignedBy": designedBy,
        "DateCreated": dateCreated,
        "LastSavedBy": lastSavedBy,
        "LastEdited": lastEdited,
        "Material": material,
        "FullSearch": fullSearch,
      };
}
