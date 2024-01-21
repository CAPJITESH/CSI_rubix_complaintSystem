import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complaint_management/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'view_complaints_card.dart';

class ViewComplaintsByType extends StatefulWidget {
  final String status;

  const ViewComplaintsByType({
    super.key,
    required this.status,
  });

  @override
  State<ViewComplaintsByType> createState() => _ViewComplaintsByTypeState();
}

class _ViewComplaintsByTypeState extends State<ViewComplaintsByType> {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color4,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 80),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: color2,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {},
                padding: const EdgeInsets.all(0),
                icon: SvgPicture.asset(
                  "assets/drawer_svg.svg",
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  width: 17,
                  height: 19,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "${widget.status} Complaints",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("complaints")
                .where("userId", isEqualTo: uid)
                .where("status", isEqualTo: widget.status)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: color1,
                  ),
                );
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text(
                    "You don't have any complaints of this category",
                    style: TextStyle(
                      color: color2,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                List<dynamic> complaints = [];

                for (var doc in snapshot.data!.docs) {
                  if (doc.data().isNotEmpty) {
                    final temp = doc.data() as Map<String, dynamic>;
                    print(doc.data());
                    // print(temp['songData']);
                    complaints.add(temp);
                  }
                }
                complaints.sort((a, b) {
                  Timestamp timestampA = a['complaintDate'];
                  Timestamp timestampB = b['complaintDate'];
                  return timestampB.compareTo(timestampA);
                });
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: complaints.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ViewComplaintCard(data: complaints[index]);
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
