import 'dart:io';

List<Map<String, dynamic>> patients = [];
List<Map<String, String>> appointments = [];

String readText(String prompt) {
  stdout.write(prompt);
  return stdin.readLineSync()?.trim() ?? '';
}

void registerPatient() {
  print('\n--- Patient Registration ---');

  String name = readText('Enter patient name: ');
  if (name.isEmpty) {
    print('Error: Patient name cannot be empty.');
    return;
  }

  String ageText = readText('Enter patient age: ');
  int? age = int.tryParse(ageText);
  if (age == null || age <= 0) {
    print('Error: Enter a valid positive age.');
    return;
  }

  String phone = readText('Enter phone number: ');
  if (phone.isEmpty) {
    print('Error: Phone number cannot be empty.');
    return;
  }

  patients.add({
    'name': name,
    'age': age,
    'phone': phone,
  });

  print('Patient registered successfully.');
}

void bookAppointment() {
  print('\n--- Book Appointment ---');

  String patientName = readText('Enter patient name: ');
  String doctor = readText('Enter doctor name: ');
  String date = readText('Enter appointment date (e.g. 20/10/2026): ');
  String time = readText('Enter appointment time (e.g. 10:30 AM): ');

  if (patientName.isEmpty ||
      doctor.isEmpty ||
      date.isEmpty ||
      time.isEmpty) {
    print('Error: All appointment fields are required.');
    return;
  }

  appointments.add({
    'patient': patientName,
    'doctor': doctor,
    'date': date,
    'time': time,
  });

  print('Appointment booked successfully.');
}

void viewAppointments() {
  print('\n--- Appointment List ---');

  if (appointments.isEmpty) {
    print('No appointments have been recorded yet.');
    return;
  }

  for (int i = 0; i < appointments.length; i++) {
    Map<String, String> appointment = appointments[i];
    print('\nAppointment ${i + 1}');
    print('Patient: ${appointment['patient']}');
    print('Doctor: ${appointment['doctor']}');
    print('Date: ${appointment['date']}');
    print('Time: ${appointment['time']}');
  }
}

void viewPatients() {
  print('\n--- Registered Patients ---');

  if (patients.isEmpty) {
    print('No patients have been registered yet.');
    return;
  }

  for (int i = 0; i < patients.length; i++) {
    Map<String, dynamic> patient = patients[i];
    print('\nPatient ${i + 1}');
    print('Name: ${patient['name']}');
    print('Age: ${patient['age']}');
    print('Phone: ${patient['phone']}');
  }
}

void main() {
  bool running = true;

  while (running) {
    print('\n===================================');
    print(' COMMUNITY HEALTH CLINIC SYSTEM');
    print('===================================');
    print('1. Register Patient');
    print('2. Book Appointment');
    print('3. View Appointments');
    print('4. View Registered Patients');
    print('5. Exit');

    String choice = readText('Choose an option (1-5): ');

    if (choice == '1') {
      registerPatient();
    } else if (choice == '2') {
      bookAppointment();
    } else if (choice == '3') {
      viewAppointments();
    } else if (choice == '4') {
      viewPatients();
    } else if (choice == '5') {
      running = false;
      print('Thank you for using the clinic system.');
    } else {
      print('Invalid choice. Please select an option from 1 to 5.');
    }
  }
}
