import 'dart:convert';

import 'package:get/get.dart';
import 'package:scheduler/services/graphQl_services.dart';

class ScheduleController extends GetxController{
   var schedules = [].obs;
   var loading = false.obs;
   GraphQLServices graphQL = new GraphQLServices();

   getSpecialistSchedule(specialistID,startDate,endDate,token)async{
     try{
       const query = r'''
                query GetSpecialistCalendar(
                  $startDate: DateTime!
                  $endDate: DateTime!
                  $specialistId: String!
                ) {
                  getSpecialistCalendar(
                    getSpecialistCalendarInput: {
                      startDate: $startDate
                      endDate: $endDate
                      specialistId: $specialistId
                    }) {
                        consultationType{
                        id
                        specialist {
                            id
                            fullName
                            emailAddress
                            phoneNumber
                        }
                        types
                        availableDate
                        startTime
                        endTime
                        unAllocatedSlotInMinutes
                        appointmentId
                      }
                      isFree
                  }
                }
             ''';
       //loading.value = true;
       final data = <String, dynamic>{
         "startDate": startDate,
         "endDate": endDate,
         "specialistId": specialistID
       };
       loading.value = true;
       final responds = await graphQL.query(query,token,data);
       schedules.value = responds.data['getSpecialistCalendar'];
     }catch(e){
      print(e);
     }finally{
       loading.value = false;
     }
   }
}