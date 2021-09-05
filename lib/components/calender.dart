import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:quiver/time.dart';

class Calender extends StatefulWidget {
  final onDateSelected;
  final minDate;
  final currentDate;
  const Calender({Key? key, this.onDateSelected, this.minDate, this.currentDate}) : super(key: key);

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {

  final PreloadPageController _controller = PreloadPageController(initialPage: 0);

  var currentMonth = 8;
  var minDate = DateTime.now();
  var currentDate = DateTime.now();
  var selectedDate;
  var pages = 0;
  var pagesFilled = 0;
  var daysInAMonth = 0;
  var currentYear = 2021;
  var months = ['January','February','March','April','May','June','July','August','September','October','November','December'];

  @override
  void initState(){
    if(!mounted) return;
    setState(() {
      minDate = widget.minDate;
      currentDate = widget.currentDate;
    });
    getDaysInMonth();
    super.initState();
  }


  getDaysInMonth(){
    var days = daysInMonth(currentYear, currentMonth+1);
    if(!mounted) return;
    //get number of pages to view

    setState(() {
      daysInAMonth = days;
      pages = (days / 7).ceil();
    });

  }


  increaseMonth(){
     if(!mounted) return;

     setState(() {
       currentYear =currentMonth  == 11 ? currentYear+=1 : currentYear;
       currentMonth = currentMonth == (months.length -1) ? 0 : currentMonth+=1;
     });
     getDaysInMonth();
     _controller.jumpToPage(0);
  }

  decreaseMonth(){
    if(!mounted) return;
    setState(() {
      currentMonth = currentMonth == 0 ? 11 : currentMonth-=1;
      currentYear = currentMonth == (months.length -1) ? currentYear-=1 : currentYear;
    });
    getDaysInMonth();
    _controller.jumpToPage(0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
         Center(
           child: Container(
             width: 290,
             margin: EdgeInsets.only(top: 10),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 IconButton(
                   onPressed: (){
                     decreaseMonth();
                   },
                   icon: Icon(CupertinoIcons.left_chevron, color: Colors.black,size: 20,),
                 ),
                 Text("${months[currentMonth]} $currentYear",style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18),),
                 IconButton(
                   onPressed: (){
                     increaseMonth();
                   },
                   icon: Icon(CupertinoIcons.right_chevron, color: Colors.black,size: 20,),
                 ),
               ],
             ),
           ),
         ),
         Container(
           height: 100,
           child: PreloadPageView.builder(
             controller: _controller,
             itemCount: pages,
             preloadPagesCount: pages,
             itemBuilder: (context,index){
                return Container(
                  child: Row(
                    children: list(index),
                  ),
                );
             },
           ),
         )
       ],
    );
  }

  List<Widget> list(index){
    List <Widget> days = <Widget>[];
    switch(index){
      case 0:
        for(var i=1;i<=7;i++){
          days.add(dayWidget(i,index));
        }
        break;
      case 1:
        for(var i=8;i<=14;i++){
          days.add(dayWidget(i,index));
        }
        break;
      case 2:
        for(var i=15;i<=21;i++){
          days.add(dayWidget(i,index));
        }
        break;
      case 3:
        for(var i=22;i<=28;i++){
          days.add(dayWidget(i,index));
        }
        break;
      case 4:
        for(var i=29;i<=daysInAMonth;i++){
          days.add(dayWidget(i,index));
        }
        break;
    }
    return days;
  }

  Widget dayWidget(day,index){
    var date = new DateFormat("yyyy-MM-dd").parse("$currentYear-${currentMonth+1}-$day");
    var dayName  = DateFormat('EEEE').format(date);
    var isPastDate = minDate.isAfter(date);
    var  datePicked = selectedDate == date;

    if(DateFormat("yyyy-MM-dd").format(currentDate) == DateFormat("yyyy-MM-dd").format(date)){
      if(selectedDate == null){
        new Timer(const Duration(milliseconds: 100), () {
          _controller.jumpToPage(index);
        });
      }
    }
    return InkWell(
      onTap: (){
        if(!mounted || isPastDate) return;
        setState(() {
          selectedDate = date;
        });
        widget.onDateSelected(date);
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 7 -5,
        margin: EdgeInsets.only(right: 2.5,left:2.5),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: datePicked ? Color(0xff1ea1f2) :  isPastDate ? Color(0xfff1f1f1) : Colors.white
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:12.0),
              child: Text(dayName[0].toUpperCase(), style: GoogleFonts.poppins(color: datePicked ? Colors.white : isPastDate ? Color(0xffdadada) : Colors.black45, fontWeight: FontWeight.w500),),
            ),
            Text(day.toString(), style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500, color: datePicked ?  Colors.white : isPastDate ? Color(0xffdadada) :  Colors.black) ,)
          ],
        ),
      ),
    );
  }
}