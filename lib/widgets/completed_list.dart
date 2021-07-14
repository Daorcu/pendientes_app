import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pendientes_app/providers/pendiente_provider.dart';

import 'package:pendientes_app/widgets/pendiente_widget.dart';

class CompletedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PendienteProvider>(context);
    final pendientes = provider.pendientesDone;

    return pendientes.isEmpty
        ? Center(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.dangerous_outlined,
                    size: 200,
                    color: Colors.white38,
                  ),
                  Text(
                    'No hemos completado pendientes',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: Colors.white60),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'En la noche...',
                    style: TextStyle(fontSize: 10, color: Colors.white60),
                  ),
                ],
              ),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(15),
            separatorBuilder: (context, index) => SizedBox(height: 8),
            itemCount: pendientes.length,
            itemBuilder: (context, index) {
              final pendiente = pendientes[index];
              return PendienteWidget(pendiente: pendiente);
            },
          );
  }
}
