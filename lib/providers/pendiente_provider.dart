import 'package:flutter/material.dart';

import 'package:pendientes_app/models/pendiente.dart';

class PendienteProvider extends ChangeNotifier {
  List<Pendiente> _pendientes = [
    Pendiente(
        createdTime: DateTime.now(),
        id: DateTime.now().toString(),
        title: 'Prueba 1',
        description: 'Prueba de la descripción para este pendiente'),
    Pendiente(
        createdTime: DateTime.now(),
        id: DateTime.now().toString(),
        title: 'Prueba 2',
        description: 'Prueba de la descripción para este pendiente'),
    Pendiente(
        createdTime: DateTime.now(),
        id: DateTime.now().toString(),
        title: 'Prueba 3',
        description: 'Prueba de la descripción para este pendiente'),
    Pendiente(
        createdTime: DateTime.now(),
        id: DateTime.now().toString(),
        title: 'Prueba 4',
        description: 'Prueba de la descripción para este pendiente'),
    Pendiente(
        createdTime: DateTime.now(),
        id: DateTime.now().toString(),
        title: 'Prueba 5',
        description: 'Prueba de la descripción para este pendiente'),
    Pendiente(
        createdTime: DateTime.now(),
        id: DateTime.now().toString(),
        title: 'Prueba 6',
        description: 'Prueba de la descripción para este pendiente'),
    Pendiente(
        createdTime: DateTime.now(),
        id: DateTime.now().toString(),
        title: 'Prueba 7',
        description: 'Prueba de la descripción para este pendiente'),
  ];

  List<Pendiente> get pendientes =>
      _pendientes.where((pendiente) => pendiente.isDone == false).toList();

  List<Pendiente> get pendientesDone =>
      _pendientes.where((pendiente) => pendiente.isDone == true).toList();

  void addPendiente(Pendiente pendiente) {
    _pendientes.add(pendiente);
    notifyListeners();
  }

  void removePendiente(Pendiente pendiente) {
    _pendientes.remove(pendiente);
    notifyListeners();
  }

  bool togglePendienteStatus(Pendiente pendiente) {
    pendiente.isDone = !pendiente.isDone;
    notifyListeners();

    return pendiente.isDone;
  }

  void updatePendiente(Pendiente pendiente, String title, String description) {
    pendiente.title = title;
    pendiente.description = description;
    notifyListeners();
  }
}
