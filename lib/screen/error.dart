import 'package:flutter/material.dart';





class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/warn.png', // Путь к изображению в вашем проекте
              width: 76,
              height: 67,
            ), 
            SizedBox(height: 35,),// Иконка ошибки
            Text(
              'Не удалось загрузить информацию',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 30), // Добавляет немного пространства
            Container(
              width: 214,
              height: 38,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled))
                        return Color(0xFF9B51E0).withOpacity(0.5);
                      return Color(0xFF9B51E0);
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                onPressed: 
                   (){},
                  child: Text(
                  'Обновить',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
