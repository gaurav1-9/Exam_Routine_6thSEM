import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timetable',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: const Color.fromRGBO(40, 40, 40, 1),
      ),
      home: const MyHomePage(title: 'Timetable'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void showToast() {
    Fluttertoast.showToast(
        msg: '© Gaurav Kumar Das',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: const Color.fromRGBO(100, 100, 100, 0.3));
  }

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    var day = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    var month = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    String examMonth = month[5];
    var timetable = [
      [
        (day[(DateTime.parse("20230612").weekday - 1) % day.length]),
        "${DateTime.parse("20230612").day} ${month[(DateTime.parse("20230612").month - 1) % month.length]}",
        "COMPILER",
        "DESIGN"
      ],
      [
        (day[(DateTime.parse("20230614").weekday - 1) % day.length]),
        "${DateTime.parse("20230614").day} ${month[(DateTime.parse("20230614").month - 1) % month.length]}",
        "COMPUTER",
        "NETWORKS"
      ],
      [
        (day[(DateTime.parse("20230616").weekday - 1) % day.length]),
        "${DateTime.parse("20230616").day} ${month[(DateTime.parse("20230616").month - 1) % month.length]}",
        "DATA MINING"
      ],
      [
        (day[(DateTime.parse("20230619").weekday - 1) % day.length]),
        "${DateTime.parse("20230619").day} ${month[(DateTime.parse("20230619").month - 1) % month.length]}",
        "IMAGE",
        "PROCESSING"
      ],
      [
        (day[(DateTime.parse("20230621").weekday - 1) % day.length]),
        "${DateTime.parse("20230621").day} ${month[(DateTime.parse("20230621").month - 1) % month.length]}",
        "SOFTWARE",
        "ENGINEERING"
      ],
      [
        (day[(DateTime.parse("20230623").weekday - 1) % day.length]),
        "${DateTime.parse("20230623").day} ${month[(DateTime.parse("20230623").month - 1) % month.length]}",
        "ACCOUNTANCY"
      ]
    ];
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //HUD
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(100, 100, 100, 0.2),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Today is,",
                          style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.w100,
                            color: Color.fromRGBO(170, 170, 170, 1),
                          ),
                        ),
                        IconButton(
                          onPressed: showToast,
                          icon: const Icon(
                            CupertinoIcons.info,
                            color: Color.fromRGBO(170, 170, 170, 1),
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${day[(time.weekday - 1) % day.length]}, ${time.day < 10 ? ('0${time.day}') : time.day} ${month[(time.month - 1) % month.length]}",
                    style: const TextStyle(
                      fontSize: 21,
                      color: Color.fromRGBO(100, 100, 100, 1),
                    ),
                  ),
                  Text(
                    "${time.hour < 10 ? ('0${time.hour}') : time.hour}:${time.minute < 10 ? ('0${time.minute}') : time.minute}:${time.second < 10 ? ('0${time.second}') : time.second}",
                    style: const TextStyle(
                      fontSize: 28,
                      color: Color.fromRGBO(100, 100, 100, 1),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // Timetable
            month[(time.month - 1) % month.length] == examMonth
                ? Flexible(
                    fit: FlexFit.loose,
                    child: Column(
                      children: [
                        subjects(timetable[0][1], timetable[0][0],
                            timetable[0][2], time,
                            subjectNextLine: timetable[0][3]),
                        subjects(timetable[1][1], timetable[1][0],
                            timetable[1][2], time,
                            subjectNextLine: timetable[1][3]),
                        subjects(timetable[2][1], timetable[2][0],
                            timetable[2][2], time),
                        subjects(timetable[3][1], timetable[3][0],
                            timetable[3][2], time,
                            subjectNextLine: timetable[3][3]),
                        subjects(timetable[4][1], timetable[4][0],
                            timetable[4][2], time,
                            subjectNextLine: timetable[4][3]),
                        subjects(timetable[5][1], timetable[5][0],
                            timetable[5][2], time),
                      ],
                    ),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width - 50,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(100, 100, 100, 0.3),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Column(children: [
                      Text(
                        "Exams are over!!",
                        style: TextStyle(
                          color: Color.fromRGBO(170, 170, 170, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            "If you are seeing this, then thank you for using this STUPID app...now you can uninstall it as I have not handled any more error exections from now on 👀\n\n~Gaurav~",
                            style: TextStyle(
                              color: Color.fromRGBO(170, 170, 170, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          )),
                    ]),
                  ),
            //Refresh Button
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => {
                      setState(
                        () => time = DateTime.now(),
                      )
                    },
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.refresh_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Refresh"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget subjects(String date, String day, String subject, DateTime currentTime,
      {String subjectNextLine = ""}) {
    List formatDate = date.split(" ");
    Color textColor =
        (formatDate[1] == 'June' && currentTime.day > int.parse(formatDate[0])
            ? const Color.fromRGBO(255, 95, 95, .3)
            : const Color.fromRGBO(140, 140, 140, 1));
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(100, 100, 100, .2),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      width: MediaQuery.of(context).size.width - 50,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: 20,
                  color: textColor,
                ),
              ),
              Text(
                "($day)",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          ),
          subjectNextLine == ""
              ? Text(
                  subject,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontSize: 16,
                  ),
                )
              : Column(
                  children: [
                    Text(
                      subject,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      subjectNextLine,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
