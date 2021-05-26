import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_app/blocs/meal_bloc/meal_bloc.dart';
import 'package:foodie_app/blocs/meal_item_bloc/meal_item_bloc.dart';
import 'package:foodie_app/blocs/login_bloc/login_bloc.dart';
import 'package:foodie_app/blocs/registration_bloc/registration_bloc.dart';
import 'package:foodie_app/blocs/logout_bloc/logout_bloc.dart';
import 'package:foodie_app/repositories/authetication_repository.dart';
import 'package:foodie_app/repositories/meal_repository.dart';
import 'package:foodie_app/screens/login_screen/login_screen.dart';
import 'package:foodie_app/services/firebase_service.dart';
import 'package:foodie_app/services/local_storage_service.dart';

Future<void> main() async {
  final FirebaseService firebaseServices = FirebaseService();
  final LocalStorageService localStorageService = LocalStorageService();
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize firebase and local storage
  await firebaseServices.init();
  await localStorageService.init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseService firebaseServices = FirebaseService();
  final MealRepository mealRepository = MealRepository();
  final AuthenticationRepository authenticationRepository = AuthenticationRepository();
  final LocalStorageService localStorageService = LocalStorageService();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MealBloc>(
          create: (context) => MealBloc(mealRepository),
        ),
        BlocProvider<MealItemBloc>(
          create: (context) => MealItemBloc(mealRepository),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            firebaseService: firebaseServices,
            authenticationRepository: authenticationRepository,
            localStorageService: localStorageService,
          ),
        ),
        BlocProvider<RegistrationBloc>(
          create: (context) => RegistrationBloc(
            firebaseService: firebaseServices,
            authenticationRepository: authenticationRepository,
            localStorageService: localStorageService,
          ),
        ),
        BlocProvider<LogoutBloc>(
          create: (context) => LogoutBloc(
            authenticationRepository: authenticationRepository,
            localStorageService: localStorageService,
          ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(441.4, 774.9),
        builder: () => MaterialApp(
          title: 'Foodie App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.red),
          home: LoginScreen(),
        ),
      ),
    );
  }
}
