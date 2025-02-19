
import 'package:flutter/cupertino.dart';

import '../../models/home_page/card_doctor_model.dart';
import 'cards/card_of_doctor.dart';

class Doctors extends StatelessWidget {
  const Doctors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.width * 0.656,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: DoctorsList.length,
            itemBuilder: (context, index) => CardOfDoctor(
              doctor: DoctorsList[index],
            )));
  }
}