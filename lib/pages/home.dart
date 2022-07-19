import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:new5/model/post_model.dart';
import 'package:new5/services/http_services.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
   String? data="";

  void _apipostlist(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print(response),
      _Showresponse(response),

    });
  }

   void _apiPostCreate(Post post){
     Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) => {
       print(response),
       _Showresponse(response!),
     });
   }
   void _apiPostUpdate(Post post){
     Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post)).then((response) => {
       print(response),
       _Showresponse(response!),
     });
   }

   void _apiPostDelete(Post post){
     Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty()).then((response) => {
       print(response),
       _Showresponse(response!),
     });
   }



   void _Showresponse(String? response){
    setState (() {
      data = response;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apipostlist( );
  }
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Text(data != null ? data! : "No data"),
          ],
        ),
      ),
    );
  }
}
