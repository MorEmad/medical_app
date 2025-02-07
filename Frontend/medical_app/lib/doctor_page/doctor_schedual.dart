import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/date_picker_timeline-1.2.3/date_picker_timeline.dart';
import 'package:medical_app/reuseable_widgets/main_button.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';

import '../models/doctor_appointments/appointments.dart';
import '../reuseable_widgets/break_line.dart';

class DoctorSchedual extends StatefulWidget {
  const DoctorSchedual({super.key});

  @override
  State<DoctorSchedual> createState() => _DoctorSchedualState();
}

class _DoctorSchedualState extends State<DoctorSchedual> {
  DateTime selectedDate = timeSchedual.keys.first;
  TimeOfDay? time;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadLineText(
          text: 'جدول المواعيد',
          size: 24,
          color: Colors.black,
        ),
        DatePicker(
          daysCount: 30,
          width: 80,
          height: 110,
          DateTime.now(),
          initialSelectedDate: selectedDate,
          selectionColor: Colors.black,

          selectedTextColor: Colors.white,
          activeDates: timeSchedual.keys.toList(),
          dateTextStyle: GoogleFonts.vazirmatn(fontSize: 18),
          monthTextStyle: GoogleFonts.vazirmatn(fontSize: 18),
          dayTextStyle: GoogleFonts.vazirmatn(fontSize: 18),
          deactivatedColor: Colors.grey,

          // inactiveDates: [DateTime(2022,9,12)],

          onDateChange: (date) {
            setState(() {
              selectedDate = date;
              // print(selectedDate);
            });
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child:
              Breakline(color: Color.fromARGB(255, 208, 208, 208), height: 2),
        ),
        Center(
          child: SizedBox(
            height: 200,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (1 / .5),
                crossAxisCount: 3,
              ),
              itemCount: timeSchedual[selectedDate]!.length, //timeSchedual[selectedDate]!.length
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    time = timeSchedual[selectedDate]![index];
                    print(DateTime(selectedDate.year, selectedDate.month,
                        selectedDate.day, time!.hour, time!.minute));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          timeSchedual[selectedDate]![index].format(
                              context), //"${selectedDate.year}-${selectedDate.month}-${selectedDate.day}"
                          style: GoogleFonts.vazirmatn(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        MainButton(
            onPressed: () {
              time == null
                  ? print("can't make appointment")
                  : Navigator.pop(context);
            },
            buttonTitle: "احجز")
      ],
    );
  }
}
