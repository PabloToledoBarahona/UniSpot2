import 'package:flutter/material.dart';
import '/views/reservation/notification_page.dart';

class ReservacionDetailsForm extends StatefulWidget {
  @override
  _ReservacionDetailsFormState createState() => _ReservacionDetailsFormState();
}

class _ReservacionDetailsFormState extends State<ReservacionDetailsForm> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool useMaterial = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.deepPurple,
            colorScheme: ColorScheme.light(
              primary: const Color.fromARGB(255, 129, 40, 75),
            ),
          ),
          child: child ?? const SizedBox(),
        );
      },
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.brown,
        colorScheme: ColorScheme.light(
          primary: const Color.fromARGB(255, 129, 40, 75),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(const Color.fromARGB(255, 129, 40, 75)),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Detalles de la Reserva',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 129, 40, 75),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                color: Color.fromARGB(255, 250, 250, 250),
                child: CalendarDatePicker(
                  initialDate: selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025),
                  onDateChanged: (newDate) {
                    setState(() {
                      selectedDate = newDate;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Hora de Reserva'),
                subtitle: Text('${selectedTime.format(context)}'),
                onTap: () => _selectTime(context),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Motivo de la Reserva',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: const Color.fromARGB(255, 129, 40, 75)),
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Detalles Adicionales',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: const Color.fromARGB(255, 129, 40, 75)),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: useMaterial,
                    onChanged: (bool? value) {
                      setState(() {
                        useMaterial = value ?? false;
                      });
                    },
                  ),
                  const Text('Utilizar Material de la Sala'),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => NotificationPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 129, 40, 75),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Confirmar Reserva'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
