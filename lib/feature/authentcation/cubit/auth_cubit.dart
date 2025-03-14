import 'package:app_9/feature/authentcation/data/autentcation_data.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthData authData = AuthData();
  regesterCubit({
    required name,
    required email,
    required phone,
    required nationalId,
    required gender,
    required password,
  }) {
    emit(AuthLoading());
    var sucRepo = authData.regester(
        name: name,
        email: email,
        phone: phone,
        nationalId: nationalId,
        gender: gender,
        password: password);
    emit(AuthRegesterSuccess(response: sucRepo));
  }

  loginCubit({required email, required password}) async{
    emit(AuthLoading());
     var succRepo = await authData.login(email: email, password: password);
    emit(AuthLoginSuccess(response: succRepo));
  }
}
