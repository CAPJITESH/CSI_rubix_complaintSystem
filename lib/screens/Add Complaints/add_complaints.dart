import 'package:complaint_management/constants.dart';
import 'package:complaint_management/screens/Add%20Complaints/complaint_model.dart';
import 'package:complaint_management/screens/RoleSelection/employeeAppoint.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:complaint_management/widgets/textfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddComplaints extends StatefulWidget {
  const AddComplaints({Key? key}) : super(key: key);

  @override
  State<AddComplaints> createState() => _AddComplaintsState();
}

class _AddComplaintsState extends State<AddComplaints> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController complaintTitleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController complaintMessageController = TextEditingController();

  List<String> categoryList = ["Technical", "Mechanical", "Service", "Other"];

  String imgUrl = '';

  String complaintId = const Uuid().v4();

  bool anony = true;
  String filePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Generate Complaints",
                  style: TextStyle(
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
      backgroundColor: color4,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: !anony,
                      onChanged: (value) {
                        setState(() {
                          anony = !anony;
                        });
                      },
                      activeColor: color1,
                      checkColor: Colors.white,
                    ),
                    Expanded(
                      child: Text(
                        "Do you want to submit complaint Anonymously?",
                        style: TextStyle(
                          color: color2,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
                Divider(
                  color: color3,
                ),
                const SizedBox(
                  height: 10,
                ),
                if (anony)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Contact Details",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextBox(
                        controller: nameController,
                        hinttext: "Name",
                        icon: Icons.person,
                        label: "",
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextBox(
                        controller: phoneNoController,
                        hinttext: "Phone Number",
                        label: "",
                        icon: Icons.phone,
                        isNumber: true,
                      ),
                      Divider(
                        color: color3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                const Text(
                  "Complaint Details",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextBox(
                  controller: complaintTitleController,
                  hinttext: "Complaint Title",
                  label: "",
                  icon: Icons.note_alt_outlined,
                  // icon: Icons.phone,
                ),
                const SizedBox(
                  height: 15,
                ),
                DropdownMenu<String>(
                  width: MediaQuery.of(context).size.width * 0.89,

                  initialSelection: categoryList.first,
                  textStyle: const TextStyle(fontSize: 14),
                  label: Text(
                    "Complaint Category",
                    style: TextStyle(color: color3),
                  ),
                  trailingIcon: Icon(
                    CupertinoIcons.chevron_down,
                    color: color3,
                  ),
                  selectedTrailingIcon: Icon(
                    CupertinoIcons.chevron_up,
                    color: color3,
                  ),
                  menuStyle: const MenuStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  inputDecorationTheme: InputDecorationTheme(
                    constraints: const BoxConstraints(maxHeight: 50),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: color3),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color3),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                  onSelected: (String? value) {
                    setState(() {
                      categoryController.text = value!;
                    });
                  },
                  controller: categoryController,
                  // underline: SizedBox.shrink(),
                  dropdownMenuEntries: categoryList
                      .map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                      value: value,
                      label: value,
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextBox(
                  controller: complaintMessageController,
                  hinttext: "Complaint Message",
                  label: "",
                  height: 90,
                  // icon: Icons.phone,
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload_file_outlined,
                      color: color1,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        "Please upload relevant details doucuments",
                        style: TextStyle(
                          color: color1,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Choose file .jpg, .jpeg, .doc, .pdf, .docx not more than 10MB',
                  style: TextStyle(
                    color: color1,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    filePath == ""
                        ? InkWell(
                            onTap: () {
                              pickFiles(complaintId);
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              color: color5,
                              radius: const Radius.circular(15),
                              child: Container(
                                height: 100,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    "Upload",
                                    style: TextStyle(
                                      color: color5,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : DottedBorder(
                            borderType: BorderType.RRect,
                            color: color5,
                            radius: const Radius.circular(15),
                            child: Container(
                              height: 100,
                              width: 80,
                              decoration: BoxDecoration(
                                border: Border.all(color: color3, width: 2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.file(
                                File(filePath),
                              ),
                            ),
                          ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(150, 40),
                      ),
                      onPressed: () {
                        _submitComplaint();
                      },
                      child: const Text(
                        'Submit Complaint',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitComplaint() async {
    String customerName = !anony ? "Anonymous" : nameController.text;
    String complaintCategory = categoryController.text;
    String complaintMessage = complaintMessageController.text;
    String complaintTitle = complaintTitleController.text;
    String customerPhoneNo = !anony ? "Anonymous" : phoneNoController.text;

    EmployeeAppoint emp = EmployeeAppoint();
    final data = await emp.assignEmployee(complaintCategory);
    String emp_id = data['eid'];
    String emp_name = data['employee_name'];

    print("emp id $emp_id");
    print("emp name $emp_name");

    // Placeholder for complaint model instantiation
    ComplaintModel complaint = ComplaintModel(
        userId: FirebaseAuth.instance.currentUser!.uid,
        customerName: customerName,
        customerPhoneNo: customerPhoneNo,
        complaintTitle: complaintTitle,
        complaintId: complaintId.toString(),
        status: "Pending",
        complaintDate: FieldValue.serverTimestamp(),
        complaintMessage: complaintMessage,
        complaintImages: [imgUrl],
        complaintCategory: complaintCategory,
        isResolved: false,
        isProcessing: true,
        adminResponses: [],
        customerResponses: [],
        resolvedDate: null,
        assignedEmployeeId: emp_id,
        assignedEmployeeName: emp_name);

    await FirebaseFirestore.instance
        .collection('complaints')
        .add(complaint.toJson());
  }

  void pickFiles(String complaintId) async {
    final pickedFiles = await FilePicker.platform.pickFiles();
    if (pickedFiles!.files.isNotEmpty) {
      setState(() {
        filePath = pickedFiles.files[0].path!;
      });

      final ref = FirebaseStorage.instance.ref("ComplaintAttachments");
      final uploadTask = await ref
          .child(complaintId)
          .child("uid${DateTime.now().millisecondsSinceEpoch}")
          .putFile(File(filePath));
      imgUrl = await uploadTask.ref.getDownloadURL();
      print("Image Url = ${imgUrl.toString()}");

      // Save image URL to the complaint in the database or handle it as needed
      // For example, you can add it to the complaintImages field in the ComplaintModel
    }
  }
}
