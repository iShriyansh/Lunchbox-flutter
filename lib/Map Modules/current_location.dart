import 'package:geolocator/geolocator.dart';

class  Location {
  
GetLocationFromGoogleMaps() async{

Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
print(position);
}

}

