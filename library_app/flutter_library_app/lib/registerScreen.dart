import 'package:flutter/material.dart';
import 'context_extension.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {

  TextEditingController _passwordRepeatController = TextEditingController(); // Şifre tekrarı için yeni controller eklendi
  TextEditingController _passwordController = TextEditingController();
  bool _hasUpperCase = false;
  bool arePasswordsMatching() {
    
  return _passwordController.text == _passwordRepeatController.text;

}


  @override
  Widget build(BuildContext context) {
      
    double radiusValue = context.dynamicHeight(0.015);
    double textfHeight = context.dynamicHeight(0.06);
    double desiredWPadding = context.dynamicWidth(0.07);
    double desiredHPadding = context.dynamicHeight(0.01);
    double sizedBoxHeight = context.dynamicHeight(0.015);
    double buttonHeight = context.dynamicHeight(0.02);
    double buttonWidth = context.dynamicWidth(0.13);

    return  Scaffold(
         
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: BackButton(color: Colors.black,),
          backgroundColor: Colors.white,
          title: Text('KAYIT OL', style: TextStyle(color: Colors.black),),
          centerTitle: true,
          elevation: 0 ,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

               textfWidget(desiredWPadding, desiredHPadding, 'Kullanıcı Adı', radiusValue, textfHeight),
               SizedBox(height: sizedBoxHeight,),
               textfWidget(desiredWPadding, desiredHPadding, 'Kullanıcı Soyadı ', radiusValue, textfHeight),
                SizedBox(height: sizedBoxHeight,),
               textfWidget(desiredWPadding, desiredHPadding, 'Kullanıcı Mail', radiusValue, textfHeight),
                SizedBox(height: sizedBoxHeight,),
               textfWidget(desiredWPadding, desiredHPadding, 'Doğum Tarihi', radiusValue, textfHeight),
                SizedBox(height: sizedBoxHeight,),
               customTextfield(desiredWPadding, desiredHPadding,'Şifre', radiusValue, textfHeight, _passwordController),
                SizedBox(height: sizedBoxHeight,),
               customTextfield(desiredWPadding, desiredHPadding,'Şifre(Tekrar)', radiusValue, textfHeight, _passwordRepeatController),
               SizedBox(height: sizedBoxHeight,),
               ElevatedButton(onPressed: (){
                passwordControl();
                arePasswordsMatchingFunction();
                }, child: Text('Giriş'), style: ElevatedButton.styleFrom(backgroundColor: Colors.black, fixedSize: Size(buttonWidth, buttonHeight)  ) , ),



            ]
             
          ),
        ),


    );
  }

  Widget customTextfield(double desiredWPadding, double desiredHPadding, String labelText,double radiusValue, double textfHeight, TextEditingController _controller) {
    return Padding(
                   padding:  EdgeInsets.symmetric(horizontal:desiredWPadding),
                   child: Container(
                    height:textfHeight  ,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(radiusValue),
                      border: Border.all(color: Colors.black ,width:1)
                    ),
                     child: Padding(
                       padding:  EdgeInsets.only(left: desiredHPadding),
                       child: TextField(
                        controller: _controller,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                         
                          border: InputBorder.none,
                          labelText: labelText,          
                        ),

                         keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        _hasUpperCase = value.contains(RegExp(r'[A-Z]'));
                      });
                    }
                       ),
                     ),
                   ),
                 );
  }
   passwordControl(){
    if (!_hasUpperCase){showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('UYARI!'),
          content: Text('Şifreniz en az 1 büyük harf içermelidir'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // AlertDialog'ı kapat
              },
              child: const Text('Kapat', style: TextStyle(color: Colors.black),),
            ),
          ],
        );
      },
    );}
            
            ;
   }

   arePasswordsMatchingFunction(){
     if (!arePasswordsMatching()){showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('UYARI!'),
          content: Text('Şifre ve Şifre(Tekrar) kısmı aynı olmalıdır'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // AlertDialog'ı kapat
              },
              child: const Text('Kapat', style: TextStyle(color: Colors.black),),
            ),
          ],
        );
      },
    );}

   }
   
  Widget textfWidget(double desiredWPadding, double desiredHPadding, String labelText,double radiusValue, double textfHeight) {
    return Padding(
                   padding:  EdgeInsets.symmetric(horizontal:desiredWPadding),
                   child: Container(
                    height:textfHeight  ,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(radiusValue),
                      border: Border.all(color: Colors.black ,width:1)
                    ),
                     child: Padding(
                       padding:  EdgeInsets.only(left: desiredHPadding),
                       child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                         
                          border: InputBorder.none,
                          labelText: labelText,
                          
                                    
                        ),
                       ),
                     ),
                   ),
                 );
  }
}