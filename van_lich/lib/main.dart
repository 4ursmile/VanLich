// import 'dart:convert';
//
// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:provider/provider.dart';
//
// import 'components/notification.dart';
// import 'constants/routes_constant.dart';
// import 'helpers/jwt_helper.dart';
// import 'models/user_model.dart';
// import 'providers/auth_provider.dart';
// import 'providers/conversations_provider.dart';
// import 'providers/friends_provider.dart';
// import 'providers/messages_provider.dart';
// import 'providers/socket_provider.dart';
// import 'screens/change_nickname/change_nickname_screen.dart';
// import 'screens/change_password/change_password_screen.dart';
// import 'screens/chat_options/chat_options_screen.dart';
// import 'screens/chat_detail/chat_detail_screen.dart';
// import 'screens/edit_profile/edit_profile_screen.dart';
// import 'screens/forgot_password/forgot_password.dart';
// import 'screens/home/home_screen.dart';
// import 'screens/login_screen/login_screen.dart';
// import 'screens/onboarding/onboarding_screen.dart';
// import 'screens/otp_form/otp_form_screen.dart';
// import 'screens/profile/profile_screen.dart';
// import 'screens/reset_password/reset_password_screen.dart';
// import 'screens/search_people/search_people_screen.dart';
// import 'screens/setting/components/language_screen.dart';
// import 'screens/setting/components/theme_mode_screen.dart';
// import 'screens/sign_up/sign_up_screen.dart';
// import 'screens/splash/splash.dart';
// import 'services/i18n_service.dart';
// import 'services/theme_service.dart';
// import 'theme.dart';
//
// void main() async {
//   await GetStorage.init();
//
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(create: (_) => Auth()),
//       ChangeNotifierProvider(create: (_) => MessageProvider()),
//       ChangeNotifierProvider(create: (_) => SocketProvider(_)),
//       ChangeNotifierProvider(create: (_) => ConversationsProvider()),
//       ChangeNotifierProvider(create: (_) => FriendsProvider()),
//     ],
//     child: const MyApp(),
//   ));
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   void _handleFocus(BuildContext context) {
//     FocusScopeNode focus = FocusScope.of(context);
//     if (!focus.hasPrimaryFocus && focus.focusedChild != null) {
//       FocusManager.instance.primaryFocus!.unfocus();
//     }
//   }
//
//   String? revivalUser() {
//     String? token = GetStorage().read("token");
//     if (token != null) {
//       String userString = JWTHelper.decode(token);
//       UserModel user = UserModel.fromJson(jsonDecode(userString));
//       context.read<Auth>().initUser(user);
//       return user.username;
//     }
//     return null;
//   }
//
//   void connectToServer(String username) {
//     try {
//       context.read<SocketProvider>().initSocket(username);
//     } catch (e) {
//       NotificationDialog.show(
//           context, "Error", "Can't connect to socket server");
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     String? username = revivalUser();
//
//     if (username != null) {
//       connectToServer(username);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DevicePreview(
//       enabled: false,
//       builder: (context) => GestureDetector(
//         onTap: () => _handleFocus(context),
//         child: GetMaterialApp(
//           debugShowCheckedModeBanner: false,
//           useInheritedMediaQuery: true,
//           themeMode: ThemeService().theme,
//           theme: lightThemeData(context),
//           darkTheme: darkThemeData(context),
//           title: 'Messenger Clone',
//           builder: DevicePreview.appBuilder,
//           home: const SplashScreen(),
//           translations: I18nService(),
//           locale: I18nService().locale,
//           fallbackLocale: I18nService.fallbackLocale,
//           getPages: [
//             GetPage(
//               name: Routes.onboarding,
//               page: () => const OnboardingScreen(),
//               transition: Transition.fadeIn,
//             ),
//             GetPage(
//               name: Routes.login,
//               page: () => const LoginScreen(),
//               transition: Transition.fadeIn,
//             ),
//             GetPage(
//               name: Routes.signUp,
//               page: () => const SignUpScreen(),
//               transition: Transition.rightToLeftWithFade,
//             ),
//             GetPage(
//               name: Routes.home,
//               page: () => HomeScreen(),
//               transition: Transition.cupertinoDialog,
//             ),
//             GetPage(
//               name: Routes.forgotPassword,
//               page: () => const ForgotPasswordScreen(),
//               transition: Transition.rightToLeftWithFade,
//             ),
//             GetPage(
//               name: Routes.changePassword,
//               page: () => const ChangePasswordScreen(),
//               transition: Transition.rightToLeftWithFade,
//             ),
//             GetPage(
//               name: Routes.chatDetail,
//               page: () => const ChatDetailScreen(),
//               transition: Transition.cupertinoDialog,
//             ),
//             GetPage(
//               name: Routes.chatOptions,
//               page: () => const ChatOptionsScreen(),
//               transition: Transition.rightToLeftWithFade,
//               transitionDuration: const Duration(microseconds: 100),
//             ),
//             GetPage(
//               name: Routes.profile,
//               page: () => const ProfileScreen(),
//               transition: Transition.rightToLeftWithFade,
//             ),
//             GetPage(
//               name: Routes.editProfile,
//               page: () => const EditProfileScreen(),
//               transition: Transition.cupertinoDialog,
//             ),
//             GetPage(
//               name: Routes.themeSetting,
//               page: () => const ThemeModeScreen(),
//               transition: Transition.rightToLeftWithFade,
//             ),
//             GetPage(
//               name: Routes.languageSetting,
//               page: () => const LanguagesScreen(),
//               transition: Transition.rightToLeftWithFade,
//             ),
//             GetPage(
//               name: Routes.otpForm,
//               page: () => OTPFormScreen(),
//               transition: Transition.rightToLeftWithFade,
//             ),
//             GetPage(
//               name: Routes.resetPassword,
//               page: () => ResetPassword(),
//               transition: Transition.rightToLeftWithFade,
//             ),
//             GetPage(
//               name: Routes.searchPeople,
//               page: () => const SearchPeopleScreen(),
//               transition: Transition.rightToLeftWithFade,
//             ),
//             GetPage(
//               name: Routes.changeNickName,
//               page: () => const ChangeNicknameScreen(),
//               transition: Transition.rightToLeftWithFade,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:van_lich/screens/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Pages(),
    );
  }
}




class Example extends StatelessWidget {
  List<Container> cards = [
    Container(
      alignment: Alignment.center,
      child: const Text('1'),
      color: Colors.blue,
    ),
    Container(
      alignment: Alignment.center,
      child: const Text('2'),
      color: Colors.red,
    ),
    Container(
      alignment: Alignment.center,
      child: const Text('3'),
      color: Colors.purple,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 300,
          child: Column(
            children: [
              Flexible(
                child: CardSwiper(
                  scale: 0.9,
                  threshold: 1,
                  cardsCount: cards.length,
                  cardBuilder: (context, index) => cards[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
