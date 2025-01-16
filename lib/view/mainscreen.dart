import 'package:first_app/controller/fetchMeme.dart';
import 'package:first_app/controller/saveMydata.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String ImgURL="";
  int? memeNo=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetInitMemeNo();
    UpdateImg();
  }

   GetInitMemeNo() async
  {
     memeNo = await SaveMyData.getData() ?? 0;
     print(memeNo);
     setState(() {

     });
  }

  void UpdateImg() async
  {
    String getImgURL= await FetchMeme().fetchNewMeme();
    setState(() {
      ImgURL=getImgURL;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: Center( child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 120,),
          Text("Meme # $memeNo",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text("Target 230" ,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          SizedBox(height: 20),
          Image.network(height: 400, width: MediaQuery.of(context).size.width,fit:BoxFit.fitHeight  , ImgURL),
          SizedBox(height: 20),
          ElevatedButton( onPressed: () async{
            print(memeNo);
            await SaveMyData.saveData(memeNo!+1);
            print(memeNo);
            GetInitMemeNo();
            UpdateImg();
          },child: Container(
              height: 60, width: 150,
              child: Center(child: Text("More memes!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)))),
          Spacer(),
          Text('Created by'),
          Text('Bhumi')
        ],
      )),
    );
  }
}
