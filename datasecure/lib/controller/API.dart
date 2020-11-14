
import 'dart:convert';
import 'package:datasecure/model/AddCommentRequest.dart';
import 'package:datasecure/model/AddCommentResponse.dart';
import 'package:datasecure/model/AddPostRequest.dart';
import 'package:datasecure/model/AddPostResponse.dart';
import 'package:datasecure/model/CommentRequest.dart';
import 'package:datasecure/model/CommentResponse.dart';
import 'package:datasecure/model/ForgotpassRequest.dart';
import 'package:datasecure/model/ForgotpassResponse.dart';
import 'package:datasecure/model/LoginRequest.dart';
import 'package:datasecure/model/LoginResponse.dart';
import 'package:datasecure/model/NewpassRequest.dart';
import 'package:datasecure/model/NewpassResponse.dart';
import 'package:datasecure/model/PostRequest.dart';
import 'package:datasecure/model/PostResponse.dart';
import 'package:datasecure/model/RegisterRequest.dart';
import 'package:datasecure/model/RegisterResponse.dart';
import 'package:datasecure/model/VerifyRequest.dart';
import 'package:datasecure/model/VerifyResponse.dart';
import 'package:http/http.dart' as http;
import 'package:datasecure/global/global.dart' as globals;

class API {
  Future<Map<String, dynamic>> connect(Map data, String url) async {
    utf8.toString();
    String body = json.encode(data);
    print('body: ' + body);
    final response = await http.post('http://158.108.155.206:8080/' + url,
        headers: {"X-Signature": "USER","Content-Type": "application/json; charset=UTF-8"},
        body: body);
    String logResponse = response.statusCode.toString();
    print('ResponseStatusCode: $logResponse');
    if (response.statusCode == 200) {
      globals.status = "200";
      print('ResponseStatusCode: $logResponse'); // Check Status Code = 200
      print('ResponseBody: ' + response.body); // Read Data in Array
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      globals.status = "500";
      throw Exception('error :(');
    }
  }

  Future<List> connectList(Map data, String url) async {
    utf8.toString();
    String body = json.encode(data);
    print('body: ' + body);
    final response = await http.post('http://158.108.155.206:8080/' + url,
        headers: {"Content-Type": "application/json; charset=UTF-8"},
        body: body);
    String logResponse = response.statusCode.toString();
    print('ResponseStatusCode: $logResponse');
    if (response.statusCode == 200) {
      globals.status = "200";
      print('ResponseStatusCode: $logResponse'); // Check Status Code = 200
      print('ResponseBody: ' + response.body); // Read Data in Array
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      globals.status = "500";
      throw Exception('error :(');
    }
  }

  Future<List<PostResponse>> getPost(PostRequest data) async {
    String url = 'home/signIn/getPost';
    List postlistJson = await connectList(data.toJson(), url);
    List<PostResponse> postlists = new List();
    for (var item in postlistJson) {
      print(" item : ${item.toString()}");
      try {
        PostResponse res = PostResponse.fromJson(item);
        print(" res : ${res.toString()}");
        postlists.add(res);
      } catch (ex) {
        print(" ex : ${ex.toString()}.");
      }
    }
    return postlists;
  }

  Future<List<CommentResponse>> getComment(CommentRequest data) async {
    String url = 'home/signIn/getComment';
    List commentlistJson = await connectList(data.toJson(), url);
    List<CommentResponse> commentlists = new List();
    for (var item in commentlistJson) {
      print(" item : ${item.toString()}");
      try {
        CommentResponse res = CommentResponse.fromJson(item);
        print(" res : ${res.toString()}");
        commentlists.add(res);
      } catch (ex) {
        print(" ex : ${ex.toString()}.");
      }
    }
    return commentlists;
  }

  Future<LoginResponse> login(LoginRequest data) async {
    String url = 'home/signIn';

    Map<String, dynamic> loginres = await connect(data.toJson(), url);
    return LoginResponse.fromJson(loginres);
  }

  Future<RegisterResponse> register(RegisterRequest data) async {
    String url = 'home/registration';

    Map<String, dynamic> regisres = await connect(data.toJson(), url);
    return RegisterResponse.fromJson(regisres);
  }
  Future<ForgotpassResponse> forgotpass(ForgotpassRequest data) async {
    String url = 'home/forgotPassword';

    Map<String, dynamic> forgotpassres = await connect(data.toJson(), url);
    return ForgotpassResponse.fromJson(forgotpassres);
  }
  Future<VerifyResponse> verify(VerifyRequest data) async {
    String url = 'home/checkOTP';

    Map<String, dynamic> verifyres = await connect(data.toJson(), url);
    return VerifyResponse.fromJson(verifyres);
  }
  Future<NewpassResponse> newpass(NewpassRequest data) async {
    String url = 'home/changPassword';

    Map<String, dynamic> newpassres = await connect(data.toJson(), url);
    return NewpassResponse.fromJson(newpassres);
  }
  Future<AddPostResponse> addpost(AddPostRequest data) async {
    String url = 'home/signIn/addPost';

    Map<String, dynamic> addpostres = await connect(data.toJson(), url);
    return AddPostResponse.fromJson(addpostres);
  }

  Future<AddCommentResponse> addcomment(AddCommentRequest data) async {
    String url = 'home/signIn/addComment';

    Map<String, dynamic> addcommentres = await connect(data.toJson(), url);
    return AddCommentResponse.fromJson(addcommentres);
  }


}