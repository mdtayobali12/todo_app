import 'package:flutter/material.dart';
import 'package:todo_app/todo_list_screen.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed:const Color(0xffDC7633 ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xffD35400),
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          titleTextStyle:TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffD35400),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffD35400),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffD35400),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style:ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffD35400),
              foregroundColor: Colors.white,
              textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),
              padding:EdgeInsets.symmetric(vertical: 12 , horizontal: 30),
              shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(5)
              )
          ),
        )
      ),
      home: const TodoListScreen(),
    );
  }
}
