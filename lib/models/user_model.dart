
class UserModelUser {
/*
{
  "__typename": "User",
  "id": "4efde437-9ce9-41e8-9ffb-3ab2ae83ed50",
  "fullName": "Test User",
  "emailAddress": "testuser@testuser.com",
  "phoneNumber": "+447557771497",
  "isPhoneVerified": true,
  "isPendingRoleChangeRequest": false,
  "role": "PHYSICIAN"
}
*/

  String? Typename;
  String? id;
  String? fullName;
  String? emailAddress;
  String? phoneNumber;
  bool? isPhoneVerified;
  bool? isPendingRoleChangeRequest;
  String? role;

  UserModelUser({
    this.Typename,
    this.id,
    this.fullName,
    this.emailAddress,
    this.phoneNumber,
    this.isPhoneVerified,
    this.isPendingRoleChangeRequest,
    this.role,
  });
  UserModelUser.fromJson(Map<String, dynamic> json) {
    Typename = json["__typename"]?.toString();
    id = json["id"]?.toString();
    fullName = json["fullName"]?.toString();
    emailAddress = json["emailAddress"]?.toString();
    phoneNumber = json["phoneNumber"]?.toString();
    isPhoneVerified = json["isPhoneVerified"];
    isPendingRoleChangeRequest = json["isPendingRoleChangeRequest"];
    role = json["role"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["__typename"] = Typename;
    data["id"] = id;
    data["fullName"] = fullName;
    data["emailAddress"] = emailAddress;
    data["phoneNumber"] = phoneNumber;
    data["isPhoneVerified"] = isPhoneVerified;
    data["isPendingRoleChangeRequest"] = isPendingRoleChangeRequest;
    data["role"] = role;
    return data;
  }
}

class UserModel {
/*
{
  "__typename": "LoginResult",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbEFkZHJlc3MiOiJ0ZXN0dXNlckB0ZXN0dXNlci5jb20iLCJpZCI6IjRlZmRlNDM3LTljZTktNDFlOC05ZmZiLTNhYjJhZTgzZWQ1MCIsImlhdCI6MTYzMDg0ODc0NCwiZXhwIjoxNjMwOTM1MTQ0fQ.jqp80SJSh6XGb0ksp1NE0a--gZEz1vZfdjICW66bqeY",
  "user": {
    "__typename": "User",
    "id": "4efde437-9ce9-41e8-9ffb-3ab2ae83ed50",
    "fullName": "Test User",
    "emailAddress": "testuser@testuser.com",
    "phoneNumber": "+447557771497",
    "isPhoneVerified": true,
    "isPendingRoleChangeRequest": false,
    "role": "PHYSICIAN"
  }
}
*/

  String? Typename;
  String? token;
  UserModelUser? user;

  UserModel({
    this.Typename,
    this.token,
    this.user,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    Typename = json["__typename"]?.toString();
    token = json["token"]?.toString();
    user = (json["user"] != null) ? UserModelUser.fromJson(json["user"]) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["__typename"] = Typename;
    data["token"] = token;
    if (user != null) {
      data["user"] = user!.toJson();
    }
    return data;
  }
}
