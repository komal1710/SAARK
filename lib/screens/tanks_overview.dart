import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:saark/models/tank.dart';
import 'package:saark/screens/login_page.dart';
import 'package:saark/utils/colors.dart';
import 'package:saark/utils/api_calls.dart';

class TanksOverview extends StatefulWidget {
  final String username, password;

  const TanksOverview({
    Key? key,
    required this.username,
    required this.password,
  }) : super(key: key);

  @override
  State<TanksOverview> createState() => _TanksOverviewState();
}

class _TanksOverviewState extends State<TanksOverview> {
  //late Future<List<Tank>> _tanks;

  // @override
  // void initState() {
  //   super.initState();
  //   _tanks = updateTanks(username: widget.username, password: widget.password);
  // }

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
                          children: [
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
                                PopupMenuButton(
                                  itemBuilder: (BuildContext context) => [],
                                ),
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
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,

                                          //color: Colors.white,
                                          width: 5,
                                        ),
                                        borderRadius: const BorderRadius.all(
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
                                        children: [
                                          LayoutBuilder(
                                            builder: (BuildContext context,
                                                BoxConstraints constraints) {
                                              return Container(
                                                margin: const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  color: snapshot.data![index]
                                                              .volumePercent <=
                                                          20
                                                      ? kRedColor
                                                      : kGreenColor,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(
                                                      20,
                                                    ),
                                                  ),
                                                ),
                                                height: 180 *
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
                                      padding: const EdgeInsets.only(left: 8),
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
                                                snapshot
                                                    .data![index].volumeWords,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '${snapshot.data![index].volumePercent}%',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.apply(color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
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
                              ),
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
                                    ),
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
  }
}
