import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/employee.dart';

class EmployeeService {
  static const String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<Employee>> fetchEmployees() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Employee> employees =
          body.map((dynamic item) => Employee.fromJson(item)).toList();
      return employees;
    } else {
      throw Exception(
          'Failed to load employees. Status code: ${response.statusCode}');
    }
  }
}
