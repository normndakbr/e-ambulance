import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  String alamat;
  String statusPerjalanan;
  String noInvoice;
  String tglPerjalanan;

  HistoryItem({
    Key? key,
    required this.alamat,
    required this.statusPerjalanan,
    required this.noInvoice,
    required this.tglPerjalanan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/images/ambulance2.png'),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.5,
                    child: Text(
                      alamat,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(statusPerjalanan),
                  Text(noInvoice),
                  SizedBox(
                    height: 10,
                  ),
                  Text(tglPerjalanan),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
