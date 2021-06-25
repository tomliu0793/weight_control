import 'package:flutter/material.dart';
import 'package:weight_control/screens/person_page.dart';
import '/screens/calendar_page.dart';
import '/theme/colors/light_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../widgets/task_column.dart';
import '/widgets/active_project_card.dart';
import '/widgets/top_container.dart';
import './create_new_task_page.dart';

class HomePage extends StatelessWidget {
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.add,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 200,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: LightColors.kBlue,
                            radius: 35.0,
                            child: Icon(
                              Icons.tag_faces,
                              size: 35.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PersonPage()),
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: LightColors.kBlue,
                                radius: 35.0,
                                child: Icon(
                                  Icons.add,
                                  size: 35.0,
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    // Container(
                    //   color: Colors.transparent,
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: 20.0, vertical: 10.0),
                    //   child: Column(
                    //     children: <Widget>[
                    //       Row(
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: <Widget>[
                    //           subheading('My Tasks'),
                    //           GestureDetector(
                    //             onTap: () {
                    //               Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                     builder: (context) => CalendarPage()),
                    //               );
                    //             },
                    //             child: calendarIcon(),
                    //           ),
                    //         ],
                    //       ),
                    //       SizedBox(height: 15.0),
                    //       TaskColumn(
                    //         icon: Icons.alarm,
                    //         iconBackgroundColor: LightColors.kRed,
                    //         title: 'To Do',
                    //         subtitle: '5 tasks now. 1 started',
                    //       ),
                    //       SizedBox(
                    //         height: 15.0,
                    //       ),
                    //       TaskColumn(
                    //         icon: Icons.blur_circular,
                    //         iconBackgroundColor: LightColors.kDarkYellow,
                    //         title: 'In Progress',
                    //         subtitle: '1 tasks now. 1 started',
                    //       ),
                    //       SizedBox(height: 15.0),
                    //       TaskColumn(
                    //         icon: Icons.check_circle_outline,
                    //         iconBackgroundColor: LightColors.kBlue,
                    //         title: 'Done',
                    //         subtitle: '18 tasks now. 13 started',
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              subheading('Active Projects'),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreateNewTaskPage()),
                                  );
                                },
                                child: calendarIcon(),
                              )
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor: LightColors.kGreen,
                                loadingPercent: 0.25,
                                title: 'Medical App',
                                subtitle: '9 hours progress',
                              ),
                              SizedBox(width: 20.0),
                              ActiveProjectsCard(
                                cardColor: LightColors.kRed,
                                loadingPercent: 0.6,
                                title: 'Making History Notes',
                                subtitle: '20 hours progress',
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor: LightColors.kDarkYellow,
                                loadingPercent: 0.45,
                                title: 'Sports App',
                                subtitle: '5 hours progress',
                              ),
                              SizedBox(width: 20.0),
                              ActiveProjectsCard(
                                cardColor: LightColors.kBlue,
                                loadingPercent: 0.9,
                                title: 'Online Flutter Course',
                                subtitle: '23 hours progress',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
