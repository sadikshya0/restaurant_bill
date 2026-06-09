class Users {
  String? id;
  String? fullName;
  String? phone;
  String? email;
  String? password;
  String? profileImage;
  String? role;
  String? status;
  String? loyaltyPoints;
  String? createdAt;
  String? updatedAt;
  String? token;

  Users({
    this.id,
    this.fullName,
    this.phone,
    this.email,
    this.password,
    this.profileImage,
    this.role,
    this.status,
    this.loyaltyPoints,
    this.createdAt,
    this.updatedAt,
    this.token,
  });

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    profileImage = json['profile_image'];
    role = json['role'];
    status = json['status'];
    loyaltyPoints = json['loyalty_points'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    data['profile_image'] = this.profileImage;
    data['role'] = this.role;
    data['status'] = this.status;
    data['loyalty_points'] = this.loyaltyPoints;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}
