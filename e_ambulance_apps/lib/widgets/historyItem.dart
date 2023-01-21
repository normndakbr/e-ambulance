import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryItem extends StatefulWidget {
  late String alamat = "test";
  late String statusPerjalanan = "";
  late String noInvoice = "";
  late String tglPerjalanan = "";

  HistoryItem({
    Key? key,
    required this.alamat,
    required this.statusPerjalanan,
    required this.noInvoice,
    required this.tglPerjalanan,
  }) : super(key: key);

  @override
  State<HistoryItem> createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
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
                      widget.alamat,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.statusPerjalanan,
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.noInvoice,
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tanggal : " +
                        DateFormat("dd-MM-yyyy")
                            .format(DateTime.parse(widget.tglPerjalanan)),
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
