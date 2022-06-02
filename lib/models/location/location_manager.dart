import 'dart:async';
import 'package:geocoding/geocoding.dart' as geoCoding;
import 'package:geolocator/geolocator.dart';
import '../../datamodel/location.dart';

class LocationManager {
    Future<Location> getCurrentLocation() async{
    final isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!isLocationServiceEnabled){
      return Future.error("位置情報サービスがオフになっています。");

    }
    var permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error("位置情報へのアクセスをユーザーに拒否されました。");
      }
    }
    if(permission == LocationPermission.deniedForever){
      return Future.error("位置情報サービスへのアクセスが永久に拒否されており、リクエストすらできません。");
    }

    //⑤ 位置情報と場所の詳細情報を取得する処理
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    final placeMarks = await geoCoding.placemarkFromCoordinates(position.latitude, position.longitude);
    final placeMark =placeMarks.first;
    return Future.value(convert(placeMark, position.latitude, position.longitude));
  }

  Location convert(placeMark, double latitude, double longitude) {
    return Location(
        latitude: latitude,
        longitude: longitude,
        country: placeMark.country,
        state: placeMark.administrativeArea,
        city: placeMark.locality,
    );
  }
  //⑤ 位置情報と場所の詳細情報を取得する処理
 }


