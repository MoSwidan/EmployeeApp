# Employee App

This Flutter application fetches employee data from a public API and displays it in a list.

## Features

- Fetches employee data from `https://jsonplaceholder.typicode.com/users`.
- Parses JSON responses and maps them to an Employee model.
- Displays the list of employees with their name, age, and salary.
- Includes a retry button in case of an error.

## Screenshot

![Screenshot](screenshot.png)

## How to Run

1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Run `flutter run` to start the app.

## Code Structure

- `lib/main.dart`: Main entry point of the application.
- `lib/models/employee.dart`: Employee model.
- `lib/services/employee_service.dart`: Service to fetch employee data.
- `lib/widgets/employee_list.dart`: Widget to display the list of employees.
