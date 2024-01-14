import 'package:carousel_slider/carousel_slider.dart';
import 'package:dwa/firebase_options.dart';
import 'package:dwa/utils/add_medecine_bindings.dart';
import 'package:dwa/view/add_medecine.dart';
import 'package:dwa/view/home.dart';
import 'package:dwa/view/home_screen.dart';
import 'package:dwa/view/singin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'functions/functions.dart';
import 'middleware/auth_middleware.dart';
import 'model/user_model.dart';
import 'services/Languages .dart';
import 'utils/forgot_password_bindings.dart';
import 'utils/home_screen_bindings.dart';
import 'utils/signup_bindings.dart';
import 'utils/singin_bindings.dart';
import 'utils/verify_email_bindings.dart';
import 'view/forgot_password.dart';
import 'view/signup.dart';
import 'view/verify_email.dart';

User? currentUser = FirebaseAuth.instance.currentUser;
UserModel currentUserInfos = UserModel(uID: "", email: "", name: "");

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  MainFunctions.sharredPrefs = await SharedPreferences.getInstance();
  currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    await MainFunctions.getcurrentUserInfos();
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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'DWA',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      translations: Languages(),
      supportedLocales: const [Locale('en'), Locale('fr') , Locale('ar')],
      locale: Languages.initLang(),

      // theme: Themes.customLightTheme,
      // textDirection: MainFunctions.textDirection,
      getPages: [
        GetPage(
          name: "/SignUp",
          page: () => const SignUp(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: "/SignIn",
          page: () => const SignIn(),
          binding: SignInBinding(),
          middlewares: [AuthMiddleware()]
        ),
        GetPage(
            name: "/EmailVerification",
            page: () => const EmailVerification(),
            binding: EmailVerificationBinding()),
        GetPage(
          name: "/ForgotPassword",
          page: () => const ForgotPassword(),
          binding: ForgotPasswordBinding(),
        ),
        GetPage(
          name: "/",
          page: () => const HomeScreen(),
          binding: HomeScreenBindings(),
        ),
        // GetPage(
        //     name: "/OnboardingView",
        //     page: () => const FoochiOnboardingView(),
        //     binding: OnboardingBindings(),
        //     middlewares: [AppIsOppen()]),
        GetPage(
          name: "/AddMedecine",
          page: () => const AddMedecine(),
          binding: AddMedecineBindings(),
        ),
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
      initialRoute: "/",
      // home: ProductCard()
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
// class ProductCardView extends StatelessWidget {
//   const ProductCardView(
//       {Key? key,
//       required this.product,
//       this.imageAlignment = Alignment.bottomCenter,
//       this.onTap})
//       : super(key: key);

//   final Product product;
//   final Alignment imageAlignment;
//   final Function(String)? onTap;

//   @override
//   Widget build(BuildContext context) {
//     final priceValue = (product.price?.onSales ?? false)
//         ? product.price?.discountedValue
//         : product.price?.value;
//     final crossedValue =
//         (product.price?.onSales ?? false) ? product.price?.value : null;
//     return GestureDetector(
//       onTap: () => onTap?.call(product.objectID!),
//       child: SizedBox(
//         width: 150,
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Stack(
//             alignment: AlignmentDirectional.bottomStart,
//             children: [
//               SizedBox(
//                   height: 100,
//                   width: MediaQuery.of(context).size.width,
//                   child: Image.network('${product.image}',
//                       alignment: imageAlignment, fit: BoxFit.cover)),
//               if (product.price?.onSales == true)
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Text(" ON SALE ${product.price?.discountLevel}% ",
//                       style: Theme.of(context).textTheme.caption?.copyWith(
//                           color: Colors.white,
//                          )),
//                 )
//             ],
//           ),
//           const SizedBox(height: 8),
//           SizedBox(
//               child: Text('${product.brand}',
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   softWrap: false,
//                   style: Theme.of(context).textTheme.caption)),
//           SizedBox(
//               child: Text('${product.name}',
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   softWrap: false,
//                   style: Theme.of(context).textTheme.bodyText2)),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 2.0),
//             child: ColorIndicatorView(product: product),
//           ),
//           Row(
//             children: [
//               Text('$priceValue €',
//                   maxLines: 1,
//                   overflow: TextOverflow.clip,
//                   softWrap: false,
//                   style: Theme.of(context).textTheme.bodyText2?.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: AppTheme.vividOrange)),
//               if (crossedValue != null)
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: Text('$crossedValue €',
//                       maxLines: 1,
//                       overflow: TextOverflow.clip,
//                       softWrap: false,
//                       style: Theme.of(context)
//                           .textTheme
//                           .caption
//                           ?.copyWith(decoration: TextDecoration.lineThrough)),
//                 ),
//             ],
//           ),
//           // RatingView(
//           //     value: product.reviews?.rating?.toInt() ?? 0,
//           //     reviewsCount: product.reviews?.count?.toInt() ?? 0),
//         ]),
//       ),
//     );
//   }
// }


// class FabAnimation extends StatefulWidget {
//   const FabAnimation({Key? key}) : super(key: key);

//   @override
//   State<FabAnimation> createState() => _FabAnimationState();
// }

// class _FabAnimationState extends State<FabAnimation>
//     with SingleTickerProviderStateMixin {
//   late ScrollController _hideButtonController;

//   late final AnimationController _controller = AnimationController(
//     duration: const Duration(milliseconds: 10),
//     vsync: this,
//   )
//     ..addListener(() {
//       setState(() {});
//     })
//     ..forward();//first time load
//   late final Animation<Offset> _offsetAnimation = Tween<Offset>(
//     end: Offset.zero,
//     begin: const Offset(0, 5.0),
//   ).animate(CurvedAnimation(
//     parent: _controller,
//     curve: Curves.linear,
//   ));

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   initState() {
//     super.initState();
//     _hideButtonController = ScrollController();
//     _hideButtonController.addListener(() {
//       //add more logic for your case
//       if (_hideButtonController.position.userScrollDirection ==
//           ScrollDirection.reverse) {
//         if (_offsetAnimation.isCompleted) _controller.reverse();
//       }
//       if (_hideButtonController.position.userScrollDirection ==
//           ScrollDirection.forward) {
//         _controller.forward();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: SlideTransition(
//           position: _offsetAnimation,
//           child: FloatingActionButton(
//             backgroundColor: Colors.blue,
//             onPressed: () {},
//             child: Icon(Icons.arrow_upward),
//           )),
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         controller: _hideButtonController,
//         child: Column(
//           children: List.generate(
//             33,
//             (index) => ListTile(
//               tileColor: index.isEven ? Colors.deepPurple : Colors.blue,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }