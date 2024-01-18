import 'package:complaint_management/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewComplaintCard extends StatefulWidget {
  final Map<String, dynamic> data;
  const ViewComplaintCard({super.key, required this.data});

  @override
  State<ViewComplaintCard> createState() => ViewComplaintCardState();
}

class ViewComplaintCardState extends State<ViewComplaintCard> {
  String date = "";
  Color mainColor = color1;

  @override
  void initState() {
    // TODO: implement initState
    formatter();
    super.initState();
  }

  void formatter() {
    // DateTime data
    DateTime dateTime = widget.data['complaintDate'].toDate();
    date = DateFormat('dd MMM yyyy').format(dateTime);

    if (widget.data['status'] == "Pending") {
      mainColor = yellow;
    }
    if (widget.data['status'] == "Resolved") {
      mainColor = green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 120,
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 13,
              decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.data['complaintTitle'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: color5,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Status : ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          widget.data['status'],
                          style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 35,
                      child: Text(
                        widget.data['complaintMessage'],
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: color5,
                          fontSize: 13,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Category : ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          widget.data['complaintCategory'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
