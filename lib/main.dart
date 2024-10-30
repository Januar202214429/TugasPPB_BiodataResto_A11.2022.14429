import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};


  MainApp({super.key}){
    biodata ['nama'] = 'Januar Rahayu Resto';
    biodata ['email'] = 'januarresto@gmail.com';
    biodata ['phone'] = '+628123456789';
    biodata ['map'] = 'https://www.google.com/maps/place/Universitas+Dian+Nuswantoro/@-6.9826741,110.4064857,17z/data=!3m1!4b1!4m6!3m5!1s0x2e708b4ec52229d7:0xc791d6abc9236c7!8m2!3d-6.9826794!4d110.4090606!16s%2Fg%2F121kq4bb?entry=ttu&g_ep=EgoyMDI0MTAyNy4wIKXMDSoASAFQAw%3D%3D';
    biodata ['image'] = 'resto.png';
    biodata ['address'] = ' Jalan Lingkar Selatan, Kudus.';
    biodata ['desc'] = 
    ''' Januar Rahayu Resto adalah tempat yang tepat bagi Anda yang ingin menikmati cita rasa
    autentik kuliner tradisional khas Indonesia. Dengan suasana yang hangat dan nyaman,
    restoran ini menyajikan berbagai hidangan khas nusantara yang kaya akan rempah-rempah dan disajikan dengan sentuhan modern.
    Dari menu favorit seperti nasi liwet, sate maranggi, hingga es cendol yang segar,
    Januar Rahayu Resto menawarkan pengalaman makan yang memanjakan lidah sekaligus membawa nostalgia.
    Cocok untuk keluarga, teman, atau kolega yang ingin menikmati hidangan tradisional dalam suasana santai dan asri.
    Anda dapat memesan meja ataupun menu melewati nomor telepon, email, atau dapat mencari pada profil aplikasi pemesanan favorit Anda.''';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Januar Rahayu Resto", 
      home: Scaffold(
        appBar: AppBar(title: const Text("Januar Rahayu Resto")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              teksKotak(Color.fromARGB(255, 216, 192, 83), biodata['nama'] ?? ''),
              Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
              SizedBox(height: 10), 
              Row(
                children: [
                btnContact(Icons.alternate_email, Colors.green[900],
                  "mailto:${biodata['email']}"),
                btnContact(Icons.map, Colors.blueAccent,
                  "https://www.google.com/maps/place/Universitas+Dian+Nuswantoro/@-6.9826741,110.4064857,17z/data=!3m1!4b1!4m6!3m5!1s0x2e708b4ec52229d7:0xc791d6abc9236c7!8m2!3d-6.9826794!4d110.4090606!16s%2Fg%2F121kq4bb?entry=ttu&g_ep=EgoyMDI0MTAyNy4wIKXMDSoASAFQAw%3D%3D${biodata['map']}"),
                btnContact(Icons.phone, Colors.deepPurple,
                  "tel:${biodata['phone']}")
                ],
              ),
              SizedBox(height: 10),
              textAttribute("Alamat", biodata['address'] ?? ''),
              SizedBox(height: 10),
              teksKotak(Color.fromARGB(255, 216, 192, 83), 'Deskripsi'),
              SizedBox(height: 10),
              Text(
                biodata['desc'] ?? '',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
                )
            ])
        ),
      ),
    );
  }

  Container teksKotak(Color bgColor, String teks) {
    return Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(color: bgColor),
              child: Text(
                teks,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 0, 0, 0) ),
              ), 
            );
  }

  Row textAttribute(String judul, String teks) {
    return Row(
              children: [
                Container(
                  width: 80,
                  child: Text("- $judul",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Text(":", style: TextStyle(fontSize: 18)),
                Text(teks, style: TextStyle(fontSize: 18))
              ],);
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
                child: ElevatedButton(
                  onPressed: (){
                    launch(uri); 
                  },
                  child: Icon(icon),
                  style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
                    
                  ),
              );
  }

  void launch(String uri) async{
    if(!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil: $uri');
    }

  }
}

