import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scheduler/contollers/users_controller.dart';
import 'package:scheduler/models/specialist_model.dart';
import 'package:scheduler/screens/schedular.dart';

class Specialists extends StatelessWidget {
  const Specialists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    UserController userController = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Specialists",style: GoogleFonts.poppins(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: Obx((){
        if(userController.loading.value){
          return Center(child: CupertinoActivityIndicator());
        }else if(userController.failed.value){
          return Center(child: Text("Failed, please connect to the internet and try again", style: GoogleFonts.poppins(color: Colors.black38, fontSize: 18),));
        }else{
          return Container(
            color: Colors.white,
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: userController.specialists.length,
              itemBuilder: (context,index){

                var specialistModel = SpecialistModel.fromJson(userController.specialists[index]);

                String avatarText = specialistModel.fullName.toString().split(" ")[0][0].toUpperCase()+""+specialistModel.fullName.toString().split(" ")[1][0].toUpperCase();

                var color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

                return InkWell(
                  onTap: (){
                    Get.to(()=>Scheduler(specialistID: specialistModel.id, color: color, avatarText: avatarText, specialistName: specialistModel.fullName,));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(avatarText),
                      backgroundColor: color,
                    ),
                    title: Text("Dr. ${specialistModel.fullName.toString()}",style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14),),
                    subtitle: Text(specialistModel.role.toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 14),),
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
