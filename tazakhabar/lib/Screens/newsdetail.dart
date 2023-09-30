import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class newsdetail extends StatelessWidget {
  final String description;
 final String title;
  final String imageUrl;
 final String author;
  final String publisherName;
  final String date;
  final String sourceUrl;
  newsdetail({Key? key,required this.title,required this.description,required this.date,required this.author,required this.imageUrl,required this.publisherName,required this.sourceUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
        children: [
          Container(
            height: size.height*0.3,
            width: size.width,
            child: imageUrl==null?Image.asset("assets/news.png"):Image.network("${imageUrl}"),
          ),
          Positioned(top:size.height*0.25,child: Container(
            height: size.height*0.7,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),

            ),
          )),
         Positioned(top:size.height*0.30,left:10,child:Container(height:28,width:130,child: Text("$date",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,decoration: TextDecoration.none,color: Colors.white),overflow: TextOverflow.fade,)) ),
          Positioned(top:size.height*0.30,left:size.width*0.6,child:Container(height:30,width:130,child: Text("${publisherName}.",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,decoration: TextDecoration.none,color: Colors.white),overflow: TextOverflow.fade,)) ),
          Positioned(top:size.height*0.34,left:size.width*0.6,child:author==null?Text("Unknown",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),):Container(height:26,width:180,child: Text("$author",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,decoration: TextDecoration.none,color: Colors.white),)) ),
         Positioned(top:size.height*0.39,left:10,child: Container(height: 150,width: size.width-10,child: Text("$title",style: TextStyle(fontSize: 22,fontWeight:FontWeight.bold,decoration: TextDecoration.none,color: Colors.grey.shade500),overflow: TextOverflow.fade,textAlign: TextAlign.left,),)),
          Positioned(top:size.height*0.6,left:10,child:  Container(height:300,width:size.width-10,child: Text("$description",style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500,decoration: TextDecoration.none,color: Colors.white),overflow: TextOverflow.fade,textAlign: TextAlign.left,)),),
          Positioned(top:size.height*0.90,child: TextButton(
            child: Text("$sourceUrl",style: TextStyle(color: Colors.blue),),
            onPressed: (){

              _launchURLBrowser();
            },
          ),),

        ],
    );

  }
  _launchURLBrowser() async {
    var url = Uri.parse("$sourceUrl");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
