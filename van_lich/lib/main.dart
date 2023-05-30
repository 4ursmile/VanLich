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
import 'package:van_lich/screens/content_detail/content_video_screen.dart';
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
      title: 'Van Lich',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Pages(),
      //Remove debug label
      debugShowCheckedModeBanner: false,

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
