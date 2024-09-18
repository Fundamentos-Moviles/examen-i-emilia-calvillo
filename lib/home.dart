import 'package:flutter/material.dart';
import 'package:examen1/utils/constants.dart' as con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: con.background,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10.0),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'SEGUNDA VISTA: EMILIA NATHALIE CALVILLO RAYÓN',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 10.0),

              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Lista de tareas pendientes',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: con.titles,
                    ),
                    textAlign: TextAlign.center, // Centrar el texto en el contenedor
                  ),
                ),
              ),

              const SizedBox(height: 25.0),

              // First Card
              Container(
                padding: EdgeInsets.all(15.0),
                height: 150.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0), // Corner radius
                ),
                // Container for rows
                child: Column(
                  children: [
                    // First Row
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('2', style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: con.background)),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                  Icons.task,
                                  size: 30.0,
                                  color: con.background4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Second Row
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('Título tarea',
                            style: TextStyle(fontSize: 22.0),
                          ),
                          ),
                        ],
                      ),
                    ),
                    // Third Row
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('descripción de la actividad',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.star,
                                size: 20.0,
                                color: Colors.yellow,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25.0),

            ],
          ),
        ),
      ),
    );
  }
}
