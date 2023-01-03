import 'package:flutter/material.dart';
import 'package:saark/models/society.dart';
import 'package:saark/utils/colors.dart';

class SocietiesList extends StatefulWidget {
  const SocietiesList({Key? key}) : super(key: key);

  @override
  State<SocietiesList> createState() => _SocietiesListState();
}

class _SocietiesListState extends State<SocietiesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Societies',
          style:
              Theme.of(context).textTheme.bodyLarge?.apply(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: societies.length,
        padding: const EdgeInsets.only(
          top: 8,
        ),
        itemBuilder: (context, index) {
          return Card(
            elevation: 8,
            shadowColor: const Color(0xff2da9ef),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  societies[index].name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold, color: kPrimaryColor),
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: kPrimaryColor,
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => TanksOverview(societyName: societies[index].name),
                //   ),
                // );
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 4,
          );
        },
      ),
    );
  }
}
