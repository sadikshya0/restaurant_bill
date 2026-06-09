List<Bills> billsFromJson(List<dynamic> billsJson) => List<Bills>.from(
  billsJson.map((billsListJson) => Bills.fromJson(billsListJson)),
);

class Bills {
  String? id;
  String? customerId;
  String? billNumber;
  String? billImage;
  String? billDate;
  String? verificationStatus;
  String? createdAt;

  Bills({
    this.id,
    this.customerId,
    this.billNumber,
    this.billImage,
    this.billDate,
    this.verificationStatus,
    this.createdAt,
  });

  Bills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    billNumber = json['bill_number'];
    billImage = json['bill_image'];
    billDate = json['bill_date'];
    verificationStatus = json['verification_status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['bill_number'] = this.billNumber;
    data['bill_image'] = this.billImage;
    data['bill_date'] = this.billDate;
    data['verification_status'] = this.verificationStatus;
    data['created_at'] = this.createdAt;
    return data;
  }
}
