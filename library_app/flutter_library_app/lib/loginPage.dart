import 'package:flutter/material.dart';
import 'package:flutter_library_app/forgotPassword.dart';
import 'package:flutter_library_app/registerScreen.dart';
import 'context_extension.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {

    double imageHeight = context.dynamicHeight(0.3);
    double imageWidth = context.dynamicWidth(0.3);
    double radiusValue = context.dynamicHeight(0.015);
    double textfHeight = context.dynamicHeight(0.06);
    double desiredWPadding = context.dynamicWidth(0.07);
    double desiredHPadding = context.dynamicHeight(0.01);
    double sizedBoxHeight = context.dynamicHeight(0.015);
    double buttonHeight = context.dynamicHeight(0.02);
    double buttonWidth = context.dynamicWidth(0.13);

    


   
      
      
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('UYGULAMA ADI', style: TextStyle(color: Colors.black),),
          centerTitle: true,
          elevation: 0 ,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              appLogo(imageHeight, imageWidth),
    
            textfWidget(desiredWPadding, desiredHPadding, 'Kullanıcı Adı', radiusValue, textfHeight),
            SizedBox(height: sizedBoxHeight ,),
            textfWidget(desiredWPadding, desiredHPadding, 'Şifre', radiusValue, textfHeight),
            SizedBox(height: sizedBoxHeight ,),
            ElevatedButton(onPressed: (){}, child: Text('Giriş'), style: ElevatedButton.styleFrom(backgroundColor: Colors.black, fixedSize: Size(buttonWidth, buttonHeight)  ) , ),
            TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => registerScreen()));

            },

             child: Text('Kayıt Ol', style: TextStyle(color: Colors.black),)),


             TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => forgotPassword()));

            },

             child: Text('Şifremi Unuttum?', style: TextStyle(color: Colors.black),)),


             
            ],
          ),
        ),
      );
    

  }

  TextButton buttonWidget(String text) => TextButton(onPressed: (){}, child: Text(text, style: TextStyle(color: Colors.black),));

  Image appLogo(double imageHeight, double imageWidth) => Image.asset('images/book.png', height: imageHeight , width: imageWidth,);

  Widget textfWidget(double desiredWPadding, double desiredHPadding, String labelMetin,double radiusValue, double textfHeight) {
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
                          labelText: labelMetin,
                          
                                    
                        ),
                       ),
                     ),
                   ),
                 );
  }
}