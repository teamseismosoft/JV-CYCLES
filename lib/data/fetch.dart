import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
    Data({
        required this.id,
        required this.name,
        required this.actualPrice,
        required this.currentPrice,
        required this.discount,
        required this.image,
    });

    String id;
    String name;
    String actualPrice;
    String currentPrice;
    String discount;
    String image;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        actualPrice: json["actualPrice"],
        currentPrice: json["currentPrice"],
        discount: json["discount"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "actualPrice": actualPrice,
        "currentPrice": currentPrice,
        "discount": discount,
        "image": image,
    };
}
