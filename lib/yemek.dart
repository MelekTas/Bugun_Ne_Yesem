// ignore_for_file: must_be_immutable
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//stateless widget kullanıcı etkileşimlerine göre değişmez.
class YemekUygulamasi extends StatelessWidget {
  const YemekUygulamasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        centerTitle: true,
        title: Text("Bugün Ne Yesem?",
            style: GoogleFonts.indieFlower(fontSize: 35, color: Colors.white)),
      ),
      body: const YemekSayfasi(),
    );
  }
}

class YemekSayfasi extends StatefulWidget {
  const YemekSayfasi({super.key});

  @override
  State<YemekSayfasi> createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  int corbaNo = 1;
  int yemekNo = 1;
  int tatliNo = 1;
  var random = Random();

  void yemekleriYenile() {
    setState(() {
      tatliNo = random.nextInt(5) + 1;
      yemekNo = random.nextInt(5) + 1; //0 gelmemesini sağlıyoruz.
      corbaNo = random.nextInt(5) + 1;
    });
  }

  List<String> corbaAdlari=['Mercimek','Tarhana','Tavuk Suyu',' Düğün Çorbası','Yoğurt Çorbası'];
  List<String> yemekAdlari=['Karnıyarık','Mantı','Kuru Fasülye', 'İçli Köfte', 'Izgara Balık'];
  List<String> tatliAdlari= ['Kadayıf','Baklava','Sütlaç','Kazandibi','Dondurma'];


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  onPressed: () {
                    yemekleriYenile();
                  },
                  child: Image.asset('assets/images/corba_$corbaNo.jpg')),
            ),
          ),
           
           Text(
            corbaAdlari[corbaNo-1],
            style:GoogleFonts.indieFlower(color: Colors.white,fontSize: 25),

           ),

          Container(
            width: 250,
            child: const Divider(
              height: 10,
              color: Colors.white,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                onPressed: () {
                  yemekleriYenile();
                },
                child: Image.asset('assets/images/yemek_$yemekNo.jpg')),
          )),
          Text(
            yemekAdlari[yemekNo-1],
            style:GoogleFonts.indieFlower(color: Colors.white,fontSize: 25),

           ),
          Container(
            width: 250,
            child: const Divider(
              height: 10,
              color: Colors.white,
            ),
          ),
          
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                onPressed: () {
                  yemekleriYenile();
                },
                child: Image.asset('assets/images/tatli_$tatliNo.jpg')),
          )),
          Text(
          tatliAdlari[tatliNo-1],
            style:GoogleFonts.indieFlower(color: Colors.white,fontSize: 25),

           ),
           Container(
            width: 250,
            child: const Divider(
              height: 10,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
