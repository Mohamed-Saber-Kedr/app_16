import 'package:dio/dio.dart';

class AuthData {
   Dio dio = Dio();

   regester({
    required name,
    required email,
    required phone,
    required nationalId,
    required gender,
    required password,
  }) async {
    try {
      var responce =
          await dio.post("https://elwekala.onrender.com/user/register", data: {
        "name": name,
        "email": email,
        "phone": phone,
        "nationalId": nationalId,
        "gender": gender,
        "password": password,
        "profileImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEwuq64VzUpE5NIqGSUXnJT4vRWodiUB0XUA&s"
      });
      return responce;
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
  }


   login({
     required email,
     required password,
   }) async {
     try {
       var responce =
       await dio.post("https://elwekala.onrender.com/user/login", data:
       {
           "email":email,
           "password": password

       });
       return responce;
     } on DioException catch (error) {
       if (error.response != null) {
         return error.response!.data;
       }
     }
   }

   getProfile({required token}) async {

     try{
       var responce = await dio.get("https://elwekala.onrender.com/user/profile",data: {

         "token": token

       });
       return responce;
     }on DioException catch (error){
       if (error.response != null) {
         return error.response!.data;
       }
     }
     }
   }

