import 'dart:convert';

import 'package:get/get.dart';
import 'package:scheduler/models/user_model.dart';
import 'package:scheduler/services/graphQl_services.dart';

class UserController extends GetxController{
  var user = "".obs;
  var specialists = [].obs;
  var loading = false.obs;
  var failed = false.obs;
  GraphQLServices graphQL = new GraphQLServices();

  @override
  void onInit(){
    login();
    super.onInit();
  }

  login()async{
    try {
      const mutation  = r'''
        mutation Login(
          $emailAddress:String!
          $password:String!
        ) {
          login(loginInput :{
            emailAddress:$emailAddress
            password:$password
          }){
              token
              user{
                id,
                fullName,
                emailAddress,
                phoneNumber,
                isPhoneVerified,
                isPendingRoleChangeRequest,
                role
              }
          }
        }
      ''';

      final data = <String, dynamic>{
        "emailAddress": "testuser@testuser.com",
        "password": "Ghana10#"
      };
      loading.value = true;
      final responds = await graphQL.mutation(mutation,data);
      user.value = jsonEncode(responds.data['login']);
      getAllSpecialists();
    }catch(e){
      failed.value = true;
      print(e);
    }finally{
      //loading.value = false;
    }
  }

  getAllSpecialists()async{
    try{
      const query = r'''
               query GetAllSpecialists {
                  getAllSpecialists {
                        id
                        fullName
                        emailAddress
                        phoneNumber,
                        role
                    }
                }
             ''';
      //loading.value = true;
      var userModel = UserModel.fromJson(jsonDecode(user.value));
      final responds = await graphQL.query(query,userModel.token);
      specialists.value = responds.data['getAllSpecialists'];
    }catch(e){

    }finally{
      loading.value = false;
    }
  }
}