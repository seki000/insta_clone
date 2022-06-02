import 'dart:io';
import 'package:flutter/material.dart';
import 'package:insta_clone/models/repositories/post_repository.dart';
import 'package:insta_clone/utils/constants.dart';
import '../datamodel/location.dart';
import '../models/repositories/user_repository.dart';

class PostViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final PostRepository postRepository;
  PostViewModel({required this.userRepository, required this.postRepository});

  File? imageFile; //dart.ioの方から
  Location? location;
  String locationString = "";

  bool isProcessing = false;
  bool isImagePicked = false;

  Future<void> pickImage(UploadType uploadType) async{
    isImagePicked = false;
    isProcessing = true;
    notifyListeners();

    await postRepository.pickImage(uploadType);
    print("pickImage: ${imageFile?.path}");

    location = await postRepository.getCurrentLocation();
    locationString = (location != null) ?  _toLocationString(location!) : "";
    print("Location: ${locationString}");

    if(imageFile != null) isImagePicked = true;
    isProcessing = false;
    notifyListeners();


  }

  String _toLocationString(Location location) {
    return location.country + "" + location.state + "" + location.city;
  }

}