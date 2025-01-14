import 'package:flutter/material.dart';
import '../models/employee.dart';

class EmployeeList extends StatelessWidget {
  final List<Employee> employees;

  const EmployeeList({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: employees.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(employees[index].name),
          subtitle: Text('Phone: ${employees[index].phone}'),
        );
      },
    );
  }
}
