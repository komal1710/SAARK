import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:saark/models/tank.dart';
import 'package:saark/screens/login_page.dart';
import 'package:saark/utils/colors.dart';
import 'package:saark/utils/api_calls.dart';

class TanksOverview1 extends StatefulWidget {
  final String username, password;

  const TanksOverview1({
    Key? key,
    required this.username,
    required this.password,
  }) : super(key: key);

  @override
  State<TanksOverview1> createState() => _TanksOverview1State();
}

class _TanksOverview1State extends State<TanksOverview1> {
  //late Future<List<Tank>> _tanks;

  // @override
  // void initState() {
  //   super.initState();
  //   _tanks = updateTanks(username: widget.username, password: widget.password);
  // }

  List<bool> isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    // List<Tank> _tanks = societies
    //     .firstWhere((element) => element.name == widget.societyName)
    //     ._tanks;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.location_pin),
            Text('Society'),
          ],
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<int>(value: 0, child: Text('Logout')),
              const PopupMenuItem<int>(value: 1, child: Text('Settings')),
            ],
          ),
        ],
      ),
      drawer: const Drawer(),
      body: Container(
        alignment: Alignment.center,
        child: StreamBuilder<List<Tank>>(
          stream: streamTanks(
              username: widget.username,
              password: widget.password,
              refreshTime: const Duration(seconds: 5)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return AlertDialog(
                    alignment: Alignment.center,
                    title: Text(
                      'Error',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.left,
                    ),
                    content: Text(
                      'Invalid Credentials!',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    actions: [
                      TextButton(
                        child: const Text("GO BACK"),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                      )
                    ],
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) => Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5,
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].name,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Text(
                                      'Last Update: ${snapshot.data![index].lastUpdate}',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      /*Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage1(),));*/
                                    },
                                    icon: const Icon(Icons.more_vert))
                                /* PopupMenuButton(
                                  itemBuilder: (BuildContext context) => [
                                    const PopupMenuItem(child: Text("form"),),
                                  ],
                                ),*/
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                side: BorderSide(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Container(
                                          width: 120,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,

                                              //color: Colors.white,
                                              width: 5,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20)),
                                          ),
                                          /*child: FractionallySizedBox(
                                  widthFactor: 1,
                                  heightFactor: _tanks[index].volumePercent / 100,
                                  child: Container(
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: _tanks[index].volumePercent <= 20
                                          ? kRedColor
                                          : kGreenColor,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          20,
                                        ),
                                      ),
                                    ),
                                    //height: _tanks[index].volumePercent.toDouble(),
                                  ),
                                ),*/
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              /* ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        237, 255, 255, 255)),
                                            onPressed: () {},
                                            child: Text(
                                              '${snapshot.data![index].volumePercent}%',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.apply(color: Colors.black),
                                            ),
                                          ),*/
                                              const Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 10)),
                                              Text(
                                                '${snapshot.data![index].volumePercent}%',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.apply(
                                                        color: Colors.black),
                                              ),
                                              const SizedBox(height: 0.5),
                                              LayoutBuilder(
                                                builder: (BuildContext context,
                                                    BoxConstraints
                                                        constraints) {
                                                  return Container(
                                                    margin:
                                                        const EdgeInsets.all(2),
                                                    decoration: BoxDecoration(
                                                      color: snapshot
                                                                  .data![index]
                                                                  .volumePercent <=
                                                              20
                                                          ? kRedColor
                                                          : kGreenColor,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(
                                                          10,
                                                        ),
                                                      ),
                                                    ),
                                                    height: 140 *
                                                        (snapshot.data![index]
                                                                .volumePercent /
                                                            100), // Setting the height for water level percentage
                                                  );
                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  if (snapshot.data![index]
                                                          .volumePercent >
                                                      40)
                                                    const Icon(
                                                      Icons.check_circle,
                                                      color: kGreenColor,
                                                      size: 30,
                                                    )
                                                  else if (snapshot.data![index]
                                                              .volumePercent >
                                                          20 &&
                                                      snapshot.data![index]
                                                              .volumePercent <=
                                                          40)
                                                    const Icon(
                                                      Icons.check_circle,
                                                      color: Colors.brown,
                                                      size: 30,
                                                    )
                                                  else if (snapshot.data![index]
                                                              .volumePercent >
                                                          0 &&
                                                      snapshot.data![index]
                                                              .volumePercent <=
                                                          20)
                                                    const Icon(
                                                      Icons.cancel_outlined,
                                                      color: kRedColor,
                                                      size: 30,
                                                    ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    snapshot.data![index]
                                                        .volumeWords,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),

                                              /*Text(
                                            '${snapshot.data![index].volumePercent}%',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.apply(color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),*/
                                              Text(
                                                '${NumberFormat('#,##,000').format(snapshot.data![index].volumeLitres)} Ltr',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.apply(color: Colors.grey),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Available',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.apply(color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Container(
                                            color:
                                                Colors.green.withOpacity(0.5),
                                            child: ToggleButtons(
                                              isSelected: isSelected,
                                              selectedColor: Colors.white,
                                              color: Colors.black,
                                              fillColor:
                                                  Colors.lightBlue.shade900,
                                              renderBorder: false,
                                              //splashColor: Colors.red,
                                              // highlightColor: Colors.orange,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 12),
                                                  child: Text('Auto',
                                                      style: TextStyle(
                                                          fontSize: 18)),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 12),
                                                  child: Text('on',
                                                      style: TextStyle(
                                                          fontSize: 18)),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 12),
                                                  child: Text('off',
                                                      style: TextStyle(
                                                          fontSize: 18)),
                                                ),
                                              ],
                                              onPressed: (int newIndex) {
                                                setState(() {
                                                  for (int index = 0;
                                                      index < isSelected.length;
                                                      index++) {
                                                    if (index == newIndex) {
                                                      isSelected[index] = true;
                                                    } else {
                                                      isSelected[index] = false;
                                                    }
                                                  }
                                                });
                                              },
                                            )),
                                        /* ElevatedButton(
                                          onPressed: () {},
                                          child: const Text("ramm"),
                                        ),
                                        const SizedBox(width: 20),
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            overlayColor: MaterialStateProperty
                                                .resolveWith<Color?>(
                                              (Set<MaterialState> states) {
                                                if (states.contains(
                                                    MaterialState.hovered)) {
                                                  return Colors.redAccent;
                                                } //<-- SEE HERE
                                                return null; // Defer to the widget's default.
                                              },
                                            ),
                                          ),
                                          child: const Text(
                                            'On',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        ElevatedButton(
                                            onPressed: () {},
                                            child: const Text("Off")),*/
                                      ],
                                    )
                                  ])),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    /* Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        side: BorderSide(
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Water Height',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.apply(color: Colors.grey),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              snapshot.data![index].height,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),*/
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    /* Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        side: BorderSide(
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Type',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.apply(color: Colors.grey),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              snapshot.data![index].type,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        side: BorderSide(
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Date',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.apply(color: Colors.grey),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              DateFormat.yMMMEd().format(
                                                  snapshot.data![index].date),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),*/
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
    // ignore: dead_code
    /* MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
      final getColor = (Set<MaterialState> States) {
        if (States.contains(MaterialState.pressed)) {
          return colorPressed;
        } else {
          return Color;
        }
      };
    }

   // return MaterialStateProperty.resolveWith();
  }*/
  }
}
