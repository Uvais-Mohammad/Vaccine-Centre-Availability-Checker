import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  const DataCard({
    Key? key,
    required this.vaccine,
    required this.centreId,
    required this.name,
    required this.address,
    required this.nDate,
    required this.fee,
    required this.minAge,
    required this.dose1,
    required this.dose2,
  }) : super(key: key);

  final String vaccine;
  final String centreId;
  final String name;
  final String address;
  final String nDate;
  final String fee;
  final String minAge;
  final String dose1;
  final String dose2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Vaccine: "),
                          Text(vaccine),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Centre ID: "),
                          Text('$centreId'),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Name: "),
                          Text(name),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Text("Address: "),
                            Text(address),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text("Date: "),
                          Text(nDate),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Fee Type: "),
                          Text(fee),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Minimum Age Limit: "),
                          Text(minAge),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Available Capacity for Dose 1: "),
                          Text(dose1),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Available Capacity for Dose 2: "),
                          Text(dose2),
                        ],
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
}
