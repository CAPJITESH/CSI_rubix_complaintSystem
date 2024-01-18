import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeAppoint {
  addEmployee(String role, employeeInfo) async {
    final get = await FirebaseFirestore.instance
        .collection("Employee")
        .doc("Complaints")
        .get();
    print(employeeInfo);
    List listOfEmployees = get.exists ? get.data()!["listOf$role"] : [];
    listOfEmployees.add(employeeInfo);
    print(listOfEmployees);
    await FirebaseFirestore.instance
        .collection("Employee")
        .doc("Complaints")
        .update({
      "listOf$role": listOfEmployees,
    });
  }

  assignEmployee(String role) async {
    final get = await FirebaseFirestore.instance
        .collection("Employee")
        .doc("Complaints")
        .get();

    List listOfEmployees = get.exists ? get.data()!["listOf$role"] : [];
    listOfEmployees.sort(
        (a, b) => a["assignedComplaints"].compareTo(b["assignedComplaints"]));

    print(listOfEmployees);
    print("assigned ${listOfEmployees.first["assignedComplaints"]}");

    listOfEmployees.first["assignedComplaints"] =
        listOfEmployees.first["assignedComplaints"].toInt() + 1;

    await FirebaseFirestore.instance
        .collection("Employee")
        .doc("Complaints")
        .update({
      "listOf$role": listOfEmployees,
    });

    return listOfEmployees.first;
  }
}
