import 'package:flutter/material.dart';
import 'context_extension.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  @override
  Widget build(BuildContext context) {

    
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
          leading: BackButton(color: Colors.black,),
          backgroundColor: Colors.white,
          title: Text('ŞİFREMİ UNUTTUM', style: TextStyle(color: Colors.black),),
          centerTitle: true,
          elevation: 0 ,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
    
            textfWidget(desiredWPadding, desiredHPadding, 'Kullanıcı Adı', radiusValue, textfHeight),
            SizedBox(height: sizedBoxHeight ,),
            textfWidget(desiredWPadding, desiredHPadding, 'Kullanıcı Soyadı', radiusValue, textfHeight),
            SizedBox(height: sizedBoxHeight ,),
            textfWidget(desiredWPadding, desiredHPadding, 'Şifre', radiusValue, textfHeight),
            SizedBox(height: sizedBoxHeight ,),
            ElevatedButton(onPressed: (){}, child: Text('Gönder'), style: ElevatedButton.styleFrom(backgroundColor: Colors.black, fixedSize: Size(buttonWidth, buttonHeight)  ) , ),
            

             
            ],
          ),
        ),
      );
    

  }
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