import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main()=>runApp(const App());

const gold=Color(0xFFF2B72C), brown=Color(0xFF2B1207), bg=Color(0xFF160B05);

Future<void> wa(String msg) async {
  await launchUrl(Uri.parse('https://wa.me/918948595402?text=${Uri.encodeComponent(msg)}'),
      mode: LaunchMode.externalApplication);
}
Future<void> call() async => launchUrl(Uri.parse('tel:+918948595402'));

class App extends StatelessWidget{
  const App({super.key});
  @override Widget build(BuildContext c)=>MaterialApp(
    debugShowCheckedModeBanner:false, title:'अपनी बेकरी',
    theme:ThemeData(useMaterial3:true,scaffoldBackgroundColor:bg,
      colorScheme:ColorScheme.fromSeed(seedColor:gold,brightness:Brightness.dark)),
    home:const Home());
}

class Home extends StatelessWidget{
  const Home({super.key});
  @override Widget build(BuildContext c){
    final p=[['🎂','Cakes','Birthday & Custom'],['🍨','Ice Cream','Delicious flavours'],
      ['🧁','Bakery Items','Fresh products'],['🍪','Biscuits','Crispy & tasty'],
      ['🎁','Gift Hampers','Special occasions']];
    return Scaffold(
      appBar:AppBar(backgroundColor:bg,title:const Text('अपनी बेकरी',
        style:TextStyle(color:gold,fontWeight:FontWeight.w900)),
        actions:[IconButton(onPressed:()=>wa('Namaste Apni Bakery! Mujhe order karna hai.'),
          icon:const Icon(Icons.chat,color:gold))]),
      body:ListView(children:[
        Container(padding:const EdgeInsets.fromLTRB(22,42,22,35),
          decoration:const BoxDecoration(gradient:LinearGradient(
            colors:[Color(0xFF3A1909),bg],begin:Alignment.topLeft,end:Alignment.bottomRight)),
          child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
            const Text('हर खुशी का मीठा साथी ❤️',style:TextStyle(color:gold,letterSpacing:2)),
            const Text('अपनी',style:TextStyle(fontSize:64,color:gold,fontWeight:FontWeight.w900)),
            const Text('बेकरी',style:TextStyle(fontSize:42,color:Colors.white,fontWeight:FontWeight.w800)),
            const SizedBox(height:10),
            const Text('ताजगी, स्वाद और विश्वास — हर बार!',
              style:TextStyle(fontSize:18,color:Color(0xFFEADFCB))),
            const SizedBox(height:20),
            Row(children:[
              Expanded(child:ElevatedButton.icon(
                onPressed:()=>wa('Namaste Apni Bakery! Mujhe cake/order karna hai.'),
                icon:const Icon(Icons.chat),label:const Text('WhatsApp Order'),
                style:ElevatedButton.styleFrom(backgroundColor:gold,foregroundColor:brown,
                  padding:const EdgeInsets.symmetric(vertical:15)))),
              const SizedBox(width:10),
              IconButton.filled(onPressed:call,icon:const Icon(Icons.call),
                style:IconButton.styleFrom(backgroundColor:brown))
            ])
          ])),
        const TitleBlock('हमारे Products','हर occasion के लिए कुछ खास'),
        Padding(padding:const EdgeInsets.all(16),child:GridView.builder(
          shrinkWrap:true,physics:const NeverScrollableScrollPhysics(),itemCount:p.length,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,crossAxisSpacing:12,mainAxisSpacing:12,childAspectRatio:1.2),
          itemBuilder:(_,i)=>Card(color:brown,child:Column(
            mainAxisAlignment:MainAxisAlignment.center,children:[
              Text(p[i][0],style:const TextStyle(fontSize:40)),
              Text(p[i][1],style:const TextStyle(color:gold,fontSize:18,fontWeight:FontWeight.bold)),
              Text(p[i][2],style:const TextStyle(color:Colors.white60,fontSize:12))
            ])))),
        const TitleBlock('खास ऑफर','आज ही order करें'),
        Padding(padding:const EdgeInsets.all(16),child:Container(padding:const EdgeInsets.all(22),
          decoration:BoxDecoration(color:const Color(0xFFF2DFB6),
            borderRadius:BorderRadius.circular(20),border:Border.all(color:gold,width:2)),
          child:const Column(children:[
            Text('BIRTHDAY CAKES',style:TextStyle(color:brown,fontWeight:FontWeight.bold)),
            Text('10% OFF',style:TextStyle(color:Color(0xFFB02D17),fontSize:42,fontWeight:FontWeight.w900)),
            Text('Special offer • Limited time',style:TextStyle(color:brown))
          ]))),
        const TitleBlock('क्यों चुनें अपनी बेकरी?','गुणवत्ता और स्वाद हमारी पहचान'),
        const Padding(padding:EdgeInsets.all(16),child:Column(children:[
          Feature(Icons.auto_awesome,'ताजा सामग्री','Fresh और भरोसेमंद ingredients'),
          Feature(Icons.delivery_dining,'Home Delivery','Order की आसान सुविधा'),
          Feature(Icons.favorite,'Customer Satisfaction','ग्राहक संतुष्टि हमारी पहचान')
        ])),
        Container(padding:const EdgeInsets.all(25),color:const Color(0xFF0D0502),
          child:const Column(children:[
            Text('अपनी बेकरी',style:TextStyle(color:gold,fontSize:26,fontWeight:FontWeight.w900)),
            SizedBox(height:8),
            Text('स्टेट बैंक के सामने, गोसाई की बाजार, आजमगढ़, उत्तर प्रदेश',
              textAlign:TextAlign.center,style:TextStyle(color:Color(0xFFEADFCB))),
            SizedBox(height:8),
            Text('📞 +91 89485 95402',style:TextStyle(color:gold,fontSize:20,fontWeight:FontWeight.bold))
          ]))
      ]));
  }
}

class TitleBlock extends StatelessWidget{
  final String a,b; const TitleBlock(this.a,this.b,{super.key});
  @override Widget build(BuildContext c)=>Padding(padding:const EdgeInsets.fromLTRB(16,35,16,15),
    child:Column(children:[Text(a,style:const TextStyle(color:gold,fontSize:28,fontWeight:FontWeight.w900)),
      Text(b,style:const TextStyle(color:Colors.white70))]));
}
class Feature extends StatelessWidget{
  final IconData i; final String a,b; const Feature(this.i,this.a,this.b,{super.key});
  @override Widget build(BuildContext c)=>Card(color:brown,child:ListTile(
    leading:CircleAvatar(backgroundColor:gold,child:Icon(i,color:brown)),
    title:Text(a,style:const TextStyle(color:gold,fontWeight:FontWeight.bold)),
    subtitle:Text(b,style:const TextStyle(color:Colors.white70))));
}
