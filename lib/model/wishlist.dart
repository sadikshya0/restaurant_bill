List<Wishlist> wishlistFromJson(List<dynamic> json) {
  return json.map((e) => Wishlist.fromJson(e)).toList();
}

class Wishlist {
  String? wishlistId;
  String? billId;
  String? billNumber;
  String? billImage;
  String? verificationStatus;
  String? billDate;
  String? createdAt;

  Wishlist({
    this.wishlistId,
    this.billId,
    this.billNumber,
    this.billImage,
    this.verificationStatus,
    this.billDate,
    this.createdAt,
  });

  Wishlist.fromJson(Map<String, dynamic> json) {
    wishlistId = json['wishlist_id'];
    billId = json['bill_id'];
    billNumber = json['bill_number'];
    billImage = json['bill_image'];
    verificationStatus = json['verification_status'];
    billDate = json['bill_date'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wishlist_id'] = this.wishlistId;
    data['bill_id'] = this.billId;
    data['bill_number'] = this.billNumber;
    data['bill_image'] = this.billImage;
    data['verification_status'] = this.verificationStatus;
    data['bill_date'] = this.billDate;
    data['created_at'] = this.createdAt;
    return data;
  }
}
