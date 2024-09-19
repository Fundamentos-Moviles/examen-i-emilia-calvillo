import 'package:flutter/material.dart';
import 'package:examen1/utils/constants.dart' as con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> listaTareas = List.from(con.listaExamen);

  void eliminarCard(int index) {
    String id = listaTareas[index].split('#')[0];

    if (id == '010') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Se eliminó la card con ID=$id'),
        ),
      );
    } else {
      setState(() {
        listaTareas.removeAt(index);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Se eliminó la card con ID=$id'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: con.background,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'SEGUNDA VISTA: EMILIA NATHALIE CALVILLO RAYÓN',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
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
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 25.0),

            // ListView.builder
            Expanded(
              child: ListView.builder(
                itemCount: listaTareas.length,
                itemBuilder: (context, index) {
                  List<String> data = listaTareas[index].split('#');
                  String id = data[0];
                  String numero = data[1];
                  String titulo = data[2];
                  String descripcion = data[3];
                  int estrellas = int.parse(data[4]);

                  bool isSecondCard = int.parse(numero) % 2 == 0; //Según número (par=botones, impar=sin botones)

                  return Column(
                    children: [
                      if (isSecondCard)
                        CreateSecondCard(
                          numero: numero,
                          titulo: titulo,
                          descripcion: descripcion,
                          estrellas: estrellas,
                          onDelete: () => eliminarCard(index),
                        )
                      else
                        CreateFirstCard(
                          numero: numero,
                          titulo: titulo,
                          descripcion: descripcion,
                          estrellas: estrellas,
                          onDelete: () => eliminarCard(index),
                        ),
                      const SizedBox(height: 10.0),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// FirstCard class
class CreateFirstCard extends StatelessWidget {
  final String numero;
  final String titulo;
  final String descripcion;
  final int estrellas;
  final VoidCallback onDelete;

  const CreateFirstCard({
    super.key,
    required this.numero,
    required this.titulo,
    required this.descripcion,
    required this.estrellas,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      height: 150.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0), // Corner radius
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    numero,
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: con.background,
                    ),
                  ),
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
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    titulo,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    descripcion,
                    style: TextStyle(fontSize: 18.0, color: Colors.grey),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(estrellas, (index) {
                        return Icon(Icons.star, size: 20.0, color: Colors.yellow);
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// SecondCard class
class CreateSecondCard extends StatelessWidget {
  final String numero;
  final String titulo;
  final String descripcion;
  final int estrellas;
  final VoidCallback onDelete;

  const CreateSecondCard({
    super.key,
    required this.numero,
    required this.titulo,
    required this.descripcion,
    required this.estrellas,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      height: 150.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          numero,
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: con.background,
                          ),
                        ),
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
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          titulo,
                          style: TextStyle(fontSize: 22.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          descripcion,
                          style: TextStyle(fontSize: 13.0, color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: List.generate(estrellas, (index) {
                              return Icon(Icons.star, size: 20.0, color: Colors.yellow);
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: con.background2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Ver más',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: onDelete,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Borrar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
