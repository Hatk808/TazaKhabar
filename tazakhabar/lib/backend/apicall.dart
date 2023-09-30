import 'dart:convert';


import 'package:http/http.dart' as http;



getTrendingNews() async{
  var url = 'https://newsapi.org/v2/top-headlines?country=in&apiKey=162fe93c2e5a4d1dbe36228753faa2c3';
  var response = await http.get(Uri.parse(url));
  var trendNews = jsonDecode(response.body);
  return trendNews;
}

getGenreNews(String genres) async{

  var url = 'https://newsapi.org/v2/top-headlines?country=in&category=$genres&apiKey=162fe93c2e5a4d1dbe36228753faa2c3';
  var response = await http.get(Uri.parse(url));
  var genreNews = jsonDecode(response.body);
  return genreNews;
}
