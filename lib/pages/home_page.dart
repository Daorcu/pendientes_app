import 'package:flutter/material.dart';
import 'package:pendientes_app/widgets/configurations.dart';

import 'package:pendientes_app/widgets/new_pendiente.dart';
import 'package:pendientes_app/widgets/pendiente_list.dart';
import 'package:pendientes_app/widgets/completed_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      PendientList(),
      CompletedList(),
      Configurations(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis Pendientes',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Drawer(
                child: Container(),
              );
            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: Colors.white,
        currentIndex: isSelected,
        onTap: (index) => setState(() {
          isSelected = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Pendientes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist_rounded),
            label: 'Completados',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
      body: tabs[isSelected],
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Colors.amber,
            size: 30,
          ),
          onPressed: () => showDialog(
                context: context,
                barrierDismissible: true,
                builder: (_) => NewPendiente(),
              )),
    );
  }
}
