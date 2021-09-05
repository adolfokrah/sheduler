import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scheduler/components/calender.dart';
import 'package:scheduler/components/schedule.dart';
import 'package:scheduler/contollers/schedule_controller.dart';
import 'package:scheduler/contollers/users_controller.dart';
import 'package:scheduler/models/schedule_model.dart';
import 'package:scheduler/models/user_model.dart';

class Scheduler extends StatelessWidget {
  final specialistID;
  final color;
  final avatarText;
  final specialistName;
  const Scheduler({Key? key, this.specialistID, this.color, this.avatarText, this.specialistName}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    UserController userController = Get.find();
    ScheduleController scheduleController = Get.put(ScheduleController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back, color: Colors.black,),
        ),
        title: Text("Dr. $specialistName",style: GoogleFonts.poppins(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),),
        backgroundColor: Colors.white,
        elevation: 0.5,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:20.0),
            child: CircleAvatar(
              radius: 17,
              child: Text(avatarText),
              backgroundColor: color,
            ),
          )
        ],
      ),
      body: Obx((){
        if(userController.loading.value){
          return Text("load");
        }
        return Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Calender(
                minDate: DateTime.now().subtract(Duration(days:1)),
                currentDate: DateTime.now(),
                onDateSelected: (date){
                  var startDate = "${date.toString().replaceAll(" ","T")}Z";
                  var userModel = UserModel.fromJson(jsonDecode(userController.user.value));
                  scheduleController.getSpecialistSchedule(specialistID, startDate, startDate, userModel.token);
                },),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left:15.0,right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Text("Time",style: GoogleFonts.poppins(color: Color(0xffc2c6cf)),),
                        ),
                        Text("Course",style: GoogleFonts.poppins(color:Color(0xffc2c6cf) ),)
                      ],
                    ),
                    Image.asset("assets/images/filter.png")
                  ],
                ),
              ),
              Expanded(
                child: scheduleController.loading.value ? Center(child: CupertinoActivityIndicator(),) : scheduleController.schedules.length < 1 ? Center(child: Text("No Consultations scheduled for this day", style: GoogleFonts.poppins(color: Colors.black38),),) :  ListView.builder(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  itemCount: scheduleController.schedules.length,
                  itemBuilder: (context, index){
                    var scheduleModel = ScheduleModel.fromJson(scheduleController.schedules[index]);
                    return Schedule(schedule: scheduleModel,);
                  },
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
