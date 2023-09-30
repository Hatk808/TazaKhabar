import 'package:flutter/material.dart';
import '../backend/apicall.dart';
import '../utils/colortheme.dart';
import 'newsdetail.dart';
class TopFinance extends StatefulWidget {
  const TopFinance({Key? key}) : super(key: key);

  @override
  State<TopFinance> createState() => _TopFinanceState();
}

class _TopFinanceState extends State<TopFinance> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blacktheme,
      body: FutureBuilder(future: getGenreNews("business"), builder: (context,AsyncSnapshot snapshot){
        if(snapshot.hasData) {
          return ListView.builder(itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 20),
              height: size.height * 0.4,
              width: size.width - 10,
              decoration: BoxDecoration(
                  color: whitetheme,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      spreadRadius: 2,
                      blurRadius: 2,
                    )
                  ]
              ),
              child: Stack(
                children: [
                  GestureDetector(
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> newsdetail(title: "${snapshot.data['articles'][index]['title']}", description:  "${snapshot.data['articles'][index]['content']}", date: "${snapshot.data['articles'][index]['publishedAt']}", author: "${snapshot.data['articles'][index]['author']}", imageUrl: "${snapshot.data['articles'][index]['urlToImage']}", publisherName: "${snapshot.data['articles'][index]['source']['name']}", sourceUrl: "${snapshot.data['articles'][index]['url']}")));
                }
                ,child:Container(
                    height: size.height*0.2,
                    width: size.width-10,
                    padding: EdgeInsets.only(top: 10),
                    child: snapshot.data['articles'][index]['urlToImage']==null?Image.asset("assets/news.png"):Image.network("${snapshot.data['articles'][index]['urlToImage']}",fit: BoxFit.cover,),
                  ),),
                  SizedBox(height: 10,),
                  Positioned(top:size.height*0.2,left:10,child: Container(height:80,width:size.width-20,child: Text("${snapshot.data['articles'][index]['title']}",style: TextStyle(fontSize:18,color: blacktheme),overflow: TextOverflow.fade,textAlign: TextAlign.left,))),
                  SizedBox(height: 30,),
                  Positioned(top: size.height*0.35,left:20,child: Container(height:25,width: 100,child: Text("${snapshot.data['articles'][index]['publishedAt']}",style: TextStyle(fontSize: 18,color: blacktheme),overflow: TextOverflow.fade,))),
                  Positioned(top: size.height*0.35,left:size.width*0.7,child: Container(height:30,width: 100,child: snapshot.data['articles'][index]['source']['name']!=null?Text("${snapshot.data['articles'][index]['source']['name']}",style: TextStyle(fontSize: 18,color: blacktheme),overflow: TextOverflow.fade,):Text("Unknown",style: TextStyle(fontSize: 18,color: blacktheme),overflow: TextOverflow.fade,textAlign: TextAlign.right,))),


                ],
              ),
            );
          },itemCount: snapshot.data['articles'].length,);
        }
        return CircularProgressIndicator(color: Colors.blue[900],);
      }),
    );
  }
}
