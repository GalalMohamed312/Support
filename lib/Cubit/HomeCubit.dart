import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../presentation/utils/app_strings.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInitialStates());
  static HomeCubit get(context)=>BlocProvider.of(context);
  int roomsIndex=1;
  int adultsIndex=1;
  int childrenIndex=0;
  bool serviceEnabled=false;
  String pickedDate=TextApp.selectDate;
  String selectNationality=TextApp.selectNationality;
  final List<String> nationalities = [
    'Egypt',
    'United States',
    'Canada',
    'United Kingdom',
    'Germany',
    'France',
    'Italy',
    'Spain',
    'Australia',
    'Japan',
    'China',
  ];
  String selectedNationality='Egypt';
void addRoomsIndex(){
  roomsIndex>=5?roomsIndex:roomsIndex++;
  emit(AddIndexState());
}
  void subtractRoomsIndex(){

    roomsIndex<=1?roomsIndex:roomsIndex--;
    emit(SubtractIndexState());
  }
  void addAdultsIndex(){
    adultsIndex>=4?adultsIndex:adultsIndex++;
    emit(AddIndexState());
  }
  void subtractAdultsIndex(){

    adultsIndex<=1?adultsIndex:adultsIndex--;
    emit(SubtractIndexState());
  }
  void addChildrenIndex(){
    childrenIndex>=4?childrenIndex:childrenIndex++;
    emit(AddIndexState());
  }
  void subtractChildrenIndex(){

    childrenIndex==0?childrenIndex:childrenIndex--;
    emit(SubtractIndexState());
  }
  void serviceEnabledOrNot(){
  serviceEnabled=!serviceEnabled;
    emit(ServiceEnabledState());
  }

  void selectDateTime(BuildContext context){
    showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
      initialDateRange: DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now().add(const Duration(days: 7)),
      ),
    ).then((pickedDateRange) {
      if (pickedDateRange != null) {
        pickedDate = DateFormat('yyyy-MM-dd').format(pickedDateRange.start);
        pickedDate+=" ==> ";
        pickedDate+= DateFormat('yyyy-MM-dd').format(pickedDateRange.end);
        print('Start: ${pickedDateRange.start}');
        print('End: ${pickedDateRange.end}');
        emit(SelectDateTimeState());
      }
    });
  }
  void setSelectedNationality(newValue){
    selectedNationality=newValue;
  emit(SelectNationalityState());
  }
  DropdownButton<String> dropDownList() {
    // return DropdownButton<String>(
    //   value: selectedNationality,
    //   onChanged: (newValue) {
    //     if (newValue != null) {
    //       // Set the selected nationality when the user makes a selection
    //       selectedNationality = newValue;
    //     }
    //   },
    //   items: nationalities.map((nationality) {
    //     return DropdownMenuItem<String>(
    //       value: nationality,
    //       child: Text(nationality),
    //     );
    //
    //   }).toList(),
    //
    // );
    return DropdownButton<String>(
      value: selectedNationality,
      onChanged: (newValue) {
        if (newValue != null) {
          // Set the selected nationality when the user makes a selection
          selectNationality=newValue;
          setSelectedNationality(newValue);
        }
      },
      items: nationalities.map((nationality) {
        return DropdownMenuItem<String>(
          value: nationality,
          child: Text(nationality),
        );
      }).toList(),
    );
  }

  // void dropDownList(){
  //   DropdownButton<String>(
  //     value: selectedNationality,
  //     onChanged: (newValue) {
  //       if (newValue != null) {
  //         // Set the selected nationality when the user makes a selection
  //         selectedNationality = newValue;
  //       }
  //     },
  //     items: nationalities.map((nationality) {
  //       return DropdownMenuItem<String>(
  //         value: nationality,
  //         child: Text(nationality),
  //       );
  //     }).toList(),
  //   );
  // }

}