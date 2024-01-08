import 'package:dwa/firebase_options.dart';
import 'package:dwa/view/singin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

User? currentUser = FirebaseAuth.instance.currentUser;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    // await MainFunctions.getcurrentUserInfos();
  }
  // sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FOOCHI',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      // theme: Themes.customLightTheme,
      // textDirection: MainFunctions.textDirection,
      getPages: [
        GetPage(
          name: "/SignIn",
          page: () => const SignIn(),
          // binding: SignUpBinding(),
        ),
        // GetPage(
        //     name: "/SignIn",
        //     page: () => const SignIn(),
        //     binding: SignInBinding(),
        //     middlewares: [AuthMiddleware()]),
        // GetPage(
        //     name: "/EmailVerification",
        //     page: () => const EmailVerification(),
        //     binding: EmailVerificationBinding()),
        // GetPage(
        //   name: "/ForgotPassword",
        //   page: () => const ForgotPassword(),
        //   binding: ForgotPasswordBinding(),
        // ),
        // GetPage(
        //     name: "/OnboardingView",
        //     page: () => const FoochiOnboardingView(),
        //     binding: OnboardingBindings(),
        //     middlewares: [AppIsOppen()]),
        // GetPage(
        //   name: "/",
        //   page: () => const HomeScreen(),
        //   binding: HomeScreenBindings(),
        // ),
        // GetPage(
        //   name: "/PhoneSignup",
        //   page: () => const PhoneSignUp(),
        //   binding: SignUpPhoneBindings(),
        // ),
        // GetPage(
        //   name: "/MoreFood",
        //   page: () => const MoreFood(),
        //   binding: MoreFoodBindings(),
        // ),
        // GetPage(
        //   name: "/FoodDetails",
        //   page: () => const FoodDetailPage(),
        //   binding: FoodDetailsBindings(),
        // ),
        // GetPage(
        //   name: "/Checkout",
        //   page: () => const CheckOut(),
        //   binding: CheckoutBindings(),
        // ),
        // GetPage(
        //   name: "/CurrentPosition",
        //   page: () => CurrentPosition(),
        //   binding: CurrentPositionBindings(),
        // ),
        // GetPage(
        //   name: "/Tasnifat",
        //   page: () => const Tasnifat(),
        //   binding: TasnifatBinding(),
        // ),
        // GetPage(
        //   name: "/BookDetails",
        //   page: () => const BookDetails(),
        //   binding: BookDetailsBinding(),
        // ),
        // GetPage(
        //   name: "/BookContent",
        //   page: () => const BookContent(),
        // ),
        // GetPage(
        //   name: "/RequestedBooks",
        //   page: () => const RequestedBooks(),
        //   binding: RequestedBooksBinding(),
        // ),
        // GetPage(
        //   name: "/SearchScreen",
        //   page: () => const SearchScreen(),
        //   transition: Transition.fadeIn,
        //   transitionDuration: const Duration(milliseconds: 250),
        //   binding: SearchBinding(),
        // ),
        // GetPage(
        //   name: "/AuthorScreen",
        //   page: () => const AuthorScreen(),
        //   binding: AuthorScreenBinding(),
        // ),
        // GetPage(
        //   name: "/OrderBook",
        //   page: () => const OrderBook(),
        //   binding: OrderBookBinding(),
        // ),
      ],
      initialRoute: "/SignIn",
      // home: CheckoutPageView()
      // home:GoogleMAPVIEW():
      //   food: Food(
      //       foodImageName:
      //           "https://img.freepik.com/free-photo/tasty-burger-isolated-white-background-fresh-hamburger-fastfood-with-beef-cheese_90220-1063.jpg?size=338&ext=jpg&ga=GA1.1.1546980028.1703808000&semt=sph",
      //       foodId: 15,
      //       foodName: 'Burgersdsd',
      //       foodCategory: 'Burger',
      //       foodPrice: '182'),
      // )
    );
  }
}