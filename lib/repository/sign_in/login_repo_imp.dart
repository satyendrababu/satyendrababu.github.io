import '../../data/datasource/remote/network/api_end_points.dart';
import '../../data/datasource/remote/network/base_api_service.dart';
import '../../data/datasource/remote/network/network_api_service.dart';
import '../../data/local/SharedPrefHelper.dart';


import '../../model/login_response.dart';
import 'login_repo.dart';

class LoginRepoImp implements LoginRepo{

  BaseApiService apiService = NetworkApiService();
  ApiEndPoints apiEndPoints = ApiEndPoints();

  @override
  Future<LoginResponse> login(String email, String password) async{
    try {
      Map<String, String> postData = {
        "email": email,
        "password": password,
      };
      dynamic response = await apiService.makePostTypeApiRequest(apiEndPoints.login, postData);
      print("MARAJ $response");
      final jsonData = LoginResponse.fromJson(response);
      /*
      * Save data locally for session management
      * */
      saveDataLocally(jsonData);

      return jsonData;

    } catch (e) {
      throw e;
      print("MARAJ-E $e");
    }
  }
  Future<void> saveDataLocally(LoginResponse response) async{
    await SharedPrefHelper.saveData(SharedPrefHelper.userId, response.data!.id!);
    await SharedPrefHelper.saveData(SharedPrefHelper.accessToken, response.data!.accessToken!);
  }

}