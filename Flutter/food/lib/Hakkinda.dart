import 'package:flutter/material.dart';
import 'package:image_watermark/image_watermark.dart';
void metin='41 kişilik bir Kurucular Kurulu heyetiyle yola çıkan YediHilal ; köklerine bağlı, mirasını reddetmeyen bir anlayışla zorlu bir sefere niyet etti.YediHilal , tüzüğünde amacını şu şekilde kayıt altına almakta: Medeniyetimizin değerlerini esas alan, ahlaki değerleri gelişmiş, başkalarının hukukuna riayet eden, hür fikirli, vicdan sahibi, birikimli ve donanımlı, aklıselim nesiller yetiştirmek, yetişen bu nesille toplumda bu özelliklerin kalıcı bir şekilde tesis edilmesini ve yaşatılmasını sağlamak. Toplum huzurunu ilgilendiren temel meselelerde haktan yana tavır alıp kamuoyu oluşturmak.Sivil inisiyatifin etkinleştirilmesi ve geliştirilmesini sağlamak için yurtiçinde ve yurtdışında benzer hedefleri olan kurum ve kuruluşlarla etkin bir şekilde iletişim ve dayanışma içerisinde olmak.Özellikle ayrışmanın ve sosyal sorumsuzluğun zirve yaptığı bir dönemde, emin insanların birlikte yola düşmesini ve yola düşenlerin de birbirlerine düşmeksizin hedefe yönelmesini savunan YediHilal, insanlık tarihi boyunca süregelen Hak-Batıl mücadelesinde saf tutma hedefindedir.İstişarenin, sorumluluk bilincinin ve ihlası merkeze alan bir çalışma ahlakının hayatın her alanını kuşatmasını savunan YediHilal, bu ilkeler çerçevesinde İslam medeniyetinin bin yıllardır süregelen seferinde bir nefer olabilmek derdindedir.Vekilimiz Allah’tır ve şüphesiz Allah en güzel vekildir.';




class Hakkinda_widget extends StatelessWidget {
  const Hakkinda_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body:
        Column(
          
      children: [
        Container(
          height: 135,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('images/ytg.jpg'),
            ),
          ),
        ),
         Text('\n'),
        Container(
          child: Center(
            child: Text(
              "YEDİHİLAL HAKKINDA",
              style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 30,
                  color: Colors.yellow),
            ),
          ),
        ),
        Container(
          child: RichText(
              text: TextSpan(
            text:'          41 kişilik bir Kurucular Kurulu heyetiyle yola çıkan YediHilal ; köklerine bağlı, mirasını reddetmeyen bir anlayışla zorlu bir sefere niyet etti.YediHilal , tüzüğünde amacını şu şekilde kayıt altına almakta: Medeniyetimizin değerlerini esas alan, ahlaki değerleri gelişmiş, başkalarının hukukuna riayet eden, hür fikirli, vicdan sahibi, birikimli ve donanımlı, aklıselim nesiller yetiştirmek, yetişen bu nesille toplumda bu özelliklerin kalıcı bir şekilde tesis edilmesini ve yaşatılmasını sağlamak. Toplum huzurunu ilgilendiren temel meselelerde haktan yana tavır alıp kamuoyu oluşturmak.Sivil inisiyatifin etkinleştirilmesi ve geliştirilmesini sağlamak için yurtiçinde ve yurtdışında benzer hedefleri olan kurum ve kuruluşlarla etkin bir şekilde iletişim ve dayanışma içerisinde olmak. ',
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          )),
        ),
         Text('\n'),
        Container(
          height: 135,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('images/yhbursa.png'),
            ),
          ),
        ),
      ],
    ));
  }
}
