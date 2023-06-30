class PublishProductModel {
  Product? product;

  PublishProductModel({this.product});

  PublishProductModel.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  String? id;
  String? stripeProductId;
  String? name;
  String? description;
  List<ProductPrice>? priceList;

  Product(
      {this.id,
      this.stripeProductId,
      this.name,
      this.description,
      this.priceList});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stripeProductId = json['stripeProductId'];
    name = json['name'];
    description = json['description'];
    if (json['priceList'] != null) {
      priceList = <ProductPrice>[];
      json['priceList'].forEach((v) {
        priceList!.add(ProductPrice.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['stripeProductId'] = stripeProductId;
    data['name'] = name;
    data['description'] = description;
    if (priceList != null) {
      data['priceList'] = priceList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductPrice {
  String? id;
  String? stripePriceId;
  String? interval;
  int? intervalCount;
  double? amount;
  String? currency;
  String? purchaseType;

  ProductPrice(
      {this.stripePriceId,
      this.interval,
      this.intervalCount,
      this.amount,
      this.currency,
      required this.id,
      this.purchaseType});

  ProductPrice.fromJson(Map<String, dynamic> json) {
    stripePriceId = json['stripePriceId'];
    interval = json['interval'];
    intervalCount = json['intervalCount'];
    amount = json['amount'];
    currency = json['currency'];
    purchaseType = json['purchaseType'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stripePriceId'] = stripePriceId;
    data['interval'] = interval;
    data['intervalCount'] = intervalCount;
    data['amount'] = amount;
    data['currency'] = currency;
    data['purchaseType'] = purchaseType;
    data['id'] = id;
    return data;
  }
}
