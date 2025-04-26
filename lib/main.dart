import 'package:bloc/bloc.dart';
import 'package:book_app/Core/bloc_observer/bloc_observer.dart';
import 'package:book_app/Core/global/theme/app_theme/app_dark_theme.dart';
import 'package:book_app/Core/services/service_locator.dart';
import 'package:book_app/Features/books/presentation/screens/book_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppDarkTheme.getTheme(context),
        home: BookListScreen(),
      ),
    );
  }
}
