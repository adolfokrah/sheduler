import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Schedule extends StatelessWidget {
  final schedule;
  const Schedule({Key? key, this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
       children: [
         Container(
           padding: EdgeInsets.only(top: 20, bottom:20),
           width: 60,
           decoration: BoxDecoration(
             border: Border(
               right: BorderSide(width: 0.5, color: Colors.black12)
             )
           ),
           child: Column(
             children: [
                Text(schedule.consultationType!.startTime.trim(), style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 13),),
                Container(
                  margin: EdgeInsets.only(top:5),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Color(0xff78849e),
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
               Container(
                 margin: EdgeInsets.only(top:5),
                 height: 3,
                 width: 3,
                 decoration: BoxDecoration(
                     color: Colors.black12,
                     borderRadius: BorderRadius.circular(10)
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(top:5),
                 height: 3,
                 width: 3,
                 decoration: BoxDecoration(
                     color: Colors.black12,
                     borderRadius: BorderRadius.circular(10)
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(top:5),
                 height: 3,
                 width: 3,
                 decoration: BoxDecoration(
                     color: Colors.black12,
                     borderRadius: BorderRadius.circular(10)
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(top:5,bottom: 5),
                 height: 10,
                 width: 10,
                 decoration: BoxDecoration(
                     color: Colors.black12,
                     borderRadius: BorderRadius.circular(8)
                 ),
               ),
               Text(schedule.consultationType!.endTime.trim(), style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 13),),
             ],
           ),
         ),
         Container(
           padding: EdgeInsets.only(left: 20,right: 20),
           child: Container(
             width: MediaQuery.of(context).size.width - 130,
             padding: EdgeInsets.all(20),
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 color: Color(0xff1ea1f2)
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Meeting with ${schedule.consultationType!.specialist!.fullName}",style: GoogleFonts.poppins(color: Colors.white, fontSize: 17),),
                 Padding(
                   padding: const EdgeInsets.only(top:8.0),
                   child: Wrap(
                     direction: Axis.horizontal,
                     spacing: 5,
                     children:
                     schedule.consultationType!.types!.map<Widget>((type){
                          return Container(
                            width: type == 'CHAT' ? 50 : 70,
                            child: Row(
                              children: [
                                Icon(type == "CHAT" ? CupertinoIcons.chat_bubble_fill : type == "VIDEO_CALL" ? CupertinoIcons.videocam_fill : CupertinoIcons.phone_solid, color: Colors.white,size: 13,),
                                Padding(
                                  padding: const EdgeInsets.only(left:4.0),
                                  child: Text(toBeginningOfSentenceCase(type.replaceAll("_"," ").toString().toLowerCase()).toString(), style: GoogleFonts.poppins(color: Colors.white, fontSize: 10),),
                                )
                              ],
                            ),
                          );
                       }).toList()
                     ,
                   ),
                 )
               ],
             ),
           ),
         )
       ],
    );
  }
}
