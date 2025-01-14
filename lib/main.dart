import 'package:flutter/material.dart';
import 'package:employee_app/services/employee_service.dart';
import 'package:employee_app/widgets/employee_list.dart';
import 'package:employee_app/models/employee.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmployeeScreen(),
    );
  }
}

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  late Future<List<Employee>> futureEmployees;

  @override
  void initState() {
    super.initState();
    futureEmployees = EmployeeService().fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: Center(
        child: FutureBuilder<List<Employee>>(
          future: futureEmployees,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${snapshot.error}'),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        futureEmployees = EmployeeService().fetchEmployees();
                      });
                    },
                    child: Text('Retry'),
                  ),
                ],
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No data found');
            } else {
              return EmployeeList(employees: snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}
