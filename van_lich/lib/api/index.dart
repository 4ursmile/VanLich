import 'package:dio/dio.dart';
import 'package:van_lich/models/collection.dart';

import '../data/content.dart';
import '../models/content.dart';

class API {
  static var dio = Dio(
    BaseOptions(baseUrl: 'http://localhost:5066/api/v1/'),
  );

  static Future<List<Content>> getListOfSuggestionContents({int skip = 1, int limit = 2}) async {
    try {
      // final response = await dio.get(
      //     'content/suggest/?skip=$skip&limit=$limit');
      // List<Content> contents = response.data.map((e) => Content.fromJson(e));
      List<Content> contents = currentContent;
      return contents..shuffle();
    } catch(e) {
      if (e is DioError) {
        throw "Some thing went wrong!";
      }
      throw "Some thing went wrong!";
    }
  }

  static bool hasTheSameCategories(List<String> element, List<String> param) {
    for(String i in element) {
      for (String j in param) {
        if(i == j) {
          return true;
        }
      }
    }
    return false;
  }

  static Future<List<Content>> getListOfContents({int skip = 1, int limit = 2, List<String> cate = const[]}) async {
    try {
      // final response = await dio.get('content/?skip=$skip&limit=$limit');
      // List<Content> contents = response.data.map((e) => Content.fromJson(e));
      List<Content> contents = currentContent;
      contents = contents.where((element) => element.type != 'video' || hasTheSameCategories(element.categories, cate)).toList()..shuffle();
      for(Content i in contents) {
        print(i.type);
      }
      return contents;
    } catch(e) {
      if (e is DioError) {
        throw "Some thing went wrong!";
      }
      throw "Some thing went wrong!";
    }
  }

  static Future<List<Content>> searchContent({String name = '',int skip = 1, int limit = 2}) async {
    try {
      final response = await dio.get(
          'content/search/?name=$name&skip=$skip&limit=$limit');
      List<Content> contents = response.data.map((e) => Content.fromJson(e));
      return contents;
    } catch(e) {
      if (e is DioError) {
        throw "Some thing went wrong!";
      }
      throw "Some thing went wrong!";
    }
  }

  static Future<List<Collection>> getCollection({String userId = '',int skip = 1, int limit = 2}) async {
    try {
      final response = await dio.get(
          'content/collection/?collectionid=$userId&skip=$skip&limit=$limit');
      List<Collection> collection = response.data.map((e) => Content.fromJson(e));
      return collection;
    } catch(e) {
      if (e is DioError) {
        throw "Some thing went wrong!";
      }
      throw "Some thing went wrong!";
    }
  }















  Future signUp({
    required String username,
    required String password,
    required String name,
    required String email,
    required String phone,
    required String birthday,
  }) async {
    try {
      var response = await dio.post('/auth/signup', data: {
        'username': username,
        'password': password,
        'name': name,
        'email': email,
        'phone': phone,
        'birthday': birthday,
      });
      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      throw "Some thing went wrong!";
    }
  }

  Future localLogin({
    required String username,
    required String password,
  }) async {
    try {
      var response = await dio.post('/auth/login/local', data: {
        'username': username,
        'password': password,
      });
      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
    }
  }

  Future changePassword({
    required String username,
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      var response = await dio.put('/auth/change-password', data: {
        "username": username,
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      });
      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      throw "Some thing went wrong!";
    }
  }

  Future forgotPassword(String username) async {
    try {
      var response = await dio.post('/auth/forgot-password', data: {
        'username': username,
      });

      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      throw "Some thing went wrong!";
    }
  }

  Future verifyOTP(int otp) async {
    try {
      var response = await dio.post('/auth/verify-otp', data: {
        'otp': otp,
      });

      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      throw "Some thing went wrong!";
    }
  }

  Future resetPassword(String username, String newPassword) async {
    try {
      var response = await dio.post('/auth/reset-password', data: {
        "username": username,
        'newPassword': newPassword,
      });

      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      throw "Some thing went wrong!";
    }
  }

  Future updateAvatar(String username, String avatar) async {
    try {
      var response = await dio.put('/auth/update', data: {
        "username": username,
        'avatar': avatar,
      });

      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      throw "Some thing went wrong!";
    }
  }

  Future updateCoverPhoto(String username, String coverPhoto) async {
    try {
      var response = await dio.put('/auth/update', data: {
        "username": username,
        'coverPhoto': coverPhoto,
      });

      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      throw "Some thing went wrong!";
    }
  }

  Future updateProfile(
    String username,
    String name,
    String email,
    String phone,
    String status,
  ) async {
    try {
      var response = await dio.put('/auth/update', data: {
        "username": username,
        'name': name,
        'email': email,
        'phone': phone,
        'status': status,
      });

      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      throw "Some thing went wrong!";
    }
  }

  Future fetchAllUser([String? search]) async {
    try {
      var response = await dio.get('/user', queryParameters: {
        'search': search,
      });

      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      throw "Some thing went wrong!";
    }
  }

  Future fetchConversation(String sender, String receiver) async {
    try {
      var response = await dio.get('/conversation', queryParameters: {
        "sender": sender,
        "receiver": receiver,
      });

      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      throw "Some thing went wrong!";
    }
  }

  Future fetchAllMessage(String conversationId) async {
    try {
      var response = await dio.get('/message/all', queryParameters: {
        "conversationId": conversationId,
      });

      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      throw "Some thing went wrong!";
    }
  }

  Future fetchAllConversation(String username) async {
    try {
      var response =
          await dio.get('/conversation/conversations', queryParameters: {
        "username": username,
      });

      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      throw "Some thing went wrong!";
    }
  }

  Future createConversation(List<String> users) async {
    try {
      var response = await dio.post('/conversation/create', data: {
        "users": users,
      });

      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      throw "Some thing went wrong!";
    }
  }

  Future updateTheme(String conversationId, String theme) async {
    try {
      var response = await dio.post('/conversation/update-theme', data: {
        "conversationId": conversationId,
        "theme": theme,
      });

      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      throw "Some thing went wrong!";
    }
  }

  Future editNickName(
      String conversationId, String username, String nickname) async {
    try {
      var response = await dio.post('/conversation/edit-nickname', data: {
        "conversationId": conversationId,
        "username": username,
        "nickname": nickname,
      });

      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      throw "Some thing went wrong!";
    }
  }

  Future editName(String conversationId, String name) async {
    try {
      var response = await dio.post('/conversation/edit-name', data: {
        "conversationId": conversationId,
        "name": name,
      });

      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      throw "Some thing went wrong!";
    }
  }

  Future deleteConversation(String conversationId) async {
    try {
      var response = await dio.delete('/conversation/delete', data: {
        "conversationId": conversationId,
      });

      return response;
    } catch (error) {
      if (error is DioError) {
        throw (error.response?.data['message'] ?? "Some thing went wrong!");
      }
      throw "Some thing went wrong!";
    }
  }
}
