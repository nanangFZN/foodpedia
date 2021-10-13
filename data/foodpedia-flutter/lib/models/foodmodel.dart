// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

List<FoodModel> foodModelFromJson(String str) => List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));

String foodModelToJson(List<FoodModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodModel {
    FoodModel({
        this.id,
        this.menu,
        this.desc,
        this.price,
        this.quantity,
        this.category,
        this.image,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String menu;
    String desc;
    int price;
    int quantity;
    String category;
    String image;
    DateTime createdAt;
    DateTime updatedAt;

    factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json["id"],
        menu: json["menu"],
        desc: json["desc"],
        price: json["price"],
        quantity: json["quantity"],
        category: json["category"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "menu": menu,
        "desc": desc,
        "price": price,
        "quantity": quantity,
        "category": category,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
