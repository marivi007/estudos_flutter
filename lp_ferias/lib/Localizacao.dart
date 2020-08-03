import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class Localizacao extends StatefulWidget {
  @override
  _LocalizacaoState createState() => _LocalizacaoState();
}

class _LocalizacaoState extends State<Localizacao> {

  String _locationMessage = ""; 
  bool _isLoading = false;
  
  void _getCurrentLocation() async{
    
    setState(() {
       _isLoading = true;
    });
    
     final position = await Geolocator().getCurrentPosition(desiredAccuracy:LocationAccuracy.high);
     
     setState(() {
       _isLoading = false;
     });
     
     

    setState((){
      _locationMessage = "${position.latitude},${position.longitude}";
    });
  }
   
  





  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            
            child:_isLoading?new CircularProgressIndicator(backgroundColor: Colors.lightBlue,):Text(
              _locationMessage,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RaisedButton(
                textColor: Colors.white,
                color: Colors.lightBlue,
                padding: EdgeInsets.all(15),
                child: Text(
                  "Localização",
                  style: TextStyle(fontSize:20),
                ),
                onPressed: (){
                  _getCurrentLocation();
                },
          ),
        ],
      ),
    );
  }
}