import 'dart:async';

class LoginBloc {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  // Recuperar los datos del Stream.
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  // Getters y setters
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Cerrarlos cuando no se necesiten.

  dispose() {
    // El ? para evitar ejecutar el .close cuando es nulo, por que daría error.
    _emailController?.close();
    _passwordController?.close();
  }
}
