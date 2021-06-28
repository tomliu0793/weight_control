import 'package:flutter/material.dart';
import 'package:weight_control/widgets/my_text_field.dart';
import '../dates_list.dart';
import '../theme/colors/light_colors.dart';
import '../widgets/calendar_dates.dart';
import '../widgets/task_container.dart';
import '../screens/create_new_task_page.dart';
import '../widgets/back_button.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<PersonPage> {
  Widget _dashedText() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        '------------------------------------------',
        maxLines: 1,
        style:
            TextStyle(fontSize: 20.0, color: Colors.black12, letterSpacing: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            0,
          ),
          child: Column(
            children: <Widget>[
              MyBackButton(),
              SizedBox(height: 30.0),
              MyTextField(
                label: 'name',
                icon: Icon(Icons.ac_unit),
              ),
              MyTextField(
                label: 'age',
                icon: Icon(Icons.ac_unit),
              ),
              MyTextField(
                label: 'sex',
                icon: Icon(Icons.ac_unit),
              ),
              SizedBox(height: 100.0),
              MaterialButton(
                color: LightColors.kDarkYellow,
                textColor: Colors.white,
                child: Text('add'),
                onPressed: () {
                  print('add person');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
