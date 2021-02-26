import 'package:Moodial/dummy_entries.dart';
import 'package:Moodial/models/entry.dart';
import 'package:Moodial/models/user.dart';
import 'package:Moodial/widgets/calendar_screen/calendar_carousel.dart';
import 'package:Moodial/widgets/navbar.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  final User user;
  final Function navPosCallback;

  CalendarScreen({
    this.user,
    this.navPosCallback,
  });

  @override
  _CalendarScreenState createState() => _CalendarScreenState(
        user: this.user,
        navPosCallback: this.navPosCallback,
      );
}

class _CalendarScreenState extends State<CalendarScreen> {
  int _currentTab = 2;
  User user;
  Function navPosCallback;

  List<Entry> dummyEntries = DummyEntries.getList().list;

  _CalendarScreenState({
    this.user,
    this.navPosCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  FeatherIcons.bell,
                  color: Colors.white,
                ),
                onPressed: () => print('notif pressed'),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Calendar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      Calendar(dummyEntries),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getIndicator(Color(0xFFFBDE60), 'Happy'),
                                getIndicator(Color(0xFFE84A6A), 'Angry')
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getIndicator(Color(0xFF5C8FC1), 'Sad'),
                                getIndicator(Color(0xFF46C365), 'Fearful')
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getIndicator(Color(0xFF3FA5C0), 'Surprised'),
                                getIndicator(Color(0xFF96C895), 'Bad')
                              ],
                            ),
                            getIndicator(Color(0xFF9F78BA), 'Happy'),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: dummyEntries.length == 0
                            ? Text(
                                'You\'ll see a history of your entries here when you start logging your moods',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              )
                            : dummyEntries.length == 1
                                ? Text(
                                    'Congrats on your first entry!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  )
                                : Text(
                                    'You\'re on a roll with ' +
                                        dummyEntries.length.toString() +
                                        ' entries so far!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 220,
                              child: Text(
                                  'Your mood analytics will become more accurate and useful with each entry. You\'re doing great by keeping up with your entries!'),
                            ),
                          ),
                          Expanded(
                            child: Image(
                              image: AssetImage(
                                  'assets/images/undraw_visual_data.png'),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: NavBar(
        currentTab: _currentTab,
        callback: navPosCallback,
      ),
    );
  }

  Widget getIndicator(color, label) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(
            color: Color(0xff7589a2),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
