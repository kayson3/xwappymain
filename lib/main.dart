import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xwappy/constants.dart';
import 'package:xwappy/pages/auth/auth.dart';
import 'package:xwappy/pages/auth/authbinding.dart';
import 'package:xwappy/pages/auth/getstarted.dart';
import 'package:xwappy/pages/auth/login.dart';
import 'package:xwappy/pages/auth/otp.dart';
import 'package:xwappy/pages/home/home.dart';
import 'package:xwappy/pages/records/records.dart';
import 'package:xwappy/pages/records/recordsbinding.dart';
import 'package:xwappy/pages/records/referralreceipt.dart';
import 'package:xwappy/pages/support.dart';
import 'package:xwappy/pages/swapramp/cashout.dart';
import 'package:xwappy/pages/swapramp/enteraddresscrypto.dart';
import 'package:xwappy/pages/swapramp/enterbankdetails.dart';
import 'package:xwappy/pages/swapramp/makepaymentcrypto.dart';
import 'package:xwappy/pages/swapramp/makepaymentfiat.dart';
import 'package:xwappy/pages/swapramp/mobilemoney.dart';
import 'package:xwappy/pages/swapramp/swaprampbinding.dart';

import 'pages/auth/wrongkyc.dart';
import 'pages/home/homebinding.dart';
import 'pages/records/receipt.dart';

void main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Xwapy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffF1D643)),
        useMaterial3: true,
      ),
      initialRoute:
          Constants.store.read("TOKEN") == null ? '/getstarted' : '/home',
      getPages: [
        GetPage(
          name: '/',
          page: () => AuthScreen(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/getstarted',
          page: () => GetStarted(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginScreen(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeScreen(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/enteraddresscrypto',
          page: () => EnterAddressCrypto(),
          binding: SwaprampBinding(),
        ),
        GetPage(
          name: '/makepaymentfiat',
          page: () => const MakePaymentFiat(),
          binding: SwaprampBinding(),
        ),
        GetPage(
          name: '/makepaymentmobilem',
          page: () => const MakePaymentMobileM(),
          binding: SwaprampBinding(),
        ),
        GetPage(
          name: '/makepaymentcrypto',
          page: () => const MakePaymentCrypto(),
          binding: SwaprampBinding(),
        ),
        GetPage(
          name: '/enterbankdetails',
          page: () => EnterBankDetails(),
          binding: SwaprampBinding(),
        ),
        GetPage(
          name: '/cashout',
          page: () => CashoutScreen(),
          binding: SwaprampBinding(),
        ),
        GetPage(
          name: '/support',
          page: () => const Support(),
          // binding: SwaprampBinding(),
        ),
        // GetPage(
        //   //MakePaymentCrypto
        //   name: '/login',
        //   page: () => const LoginScreen(),
        //   binding: AuthBinding(),
        // ), //ReceiptScreen

        GetPage(
          name: '/receipt',
          page: () => const ReceiptScreen(),
          binding: RecordsBinding(),
        ),
        GetPage(
          name: '/referralreceipt',
          page: () => const ReferralReceipt(),
          binding: RecordsBinding(),
        ),
        GetPage(
          name: '/records',
          page: () => const RecordsScreen(),
          binding: RecordsBinding(),
        ),
        GetPage(
          name: '/otp',
          page: () => OtpScreen(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/wrongkyc',
          page: () => const WrongKyc(),
          // binding: HomeControllerBinding(),
        ),
      ],
    );
  }
}
