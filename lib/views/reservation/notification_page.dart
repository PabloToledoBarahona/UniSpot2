import 'package:flutter/material.dart';
import 'package:unispot/views/spaces/spaces_page.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Fondo más suave
      body: Center(
        child: Container(
          margin: EdgeInsets.all(40), // Margen para dar espacio
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20), // Bordes más redondeados
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60, // Icono grande para dar énfasis
              ),
              SizedBox(height: 20),
              Text(
                'Su reserva se ha confirmado con éxito!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => SpacesListPage()),
                    ModalRoute.withName('package:unispot/views/spaces/spaces_page.dart'), // Asegúrate de que '/' es la ruta a la que quieres regresar
                  );
                },
                child: Text('OK', 
                style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 129, 40, 75), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
