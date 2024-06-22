import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xwappy/constants.dart';
import 'package:xwappy/pages/records/recordscontroller.dart';

import '../../widgets/button.dart';
import '../swapramp/swaprampcontroller.dart';

class ReceiptScreen extends GetView<RecordsController> {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final swapController = Get.put(SwapRampController());
    return Scaffold(
      backgroundColor: Constants.bkgColor(),
      body: SafeArea(
          top: true,
          left: false,
          right: false,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Obx(
              () => SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Get.offAllNamed('/home'),
                      child: Icon(
                        Icons.close,
                        color: Constants.txtColor(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 51,
                        width: 51,
                        decoration: BoxDecoration(
                          color: Constants.btnColor(),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "03",
                            style: TextStyle(
                              color: Constants.bkgColor(),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Transactions\nReceipt", //$10,023.43
                        style: TextStyle(
                          color: Constants.txtColor(),
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Center(
                  //   child: Container(
                  //     height: 40,
                  //     width: 303,
                  //     decoration: BoxDecoration(
                  //         color: const Constants.txtColor(),
                  //         borderRadius: BorderRadius.circular(22)),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         GestureDetector(
                  //           onTap: () {
                  //             // controller.receiptState.value =
                  //             //     ReceiptState.crypto;
                  //           },
                  //           child: Container(
                  //             height: 50,
                  //             width: 152,
                  //             padding: const EdgeInsets.symmetric(
                  //                 horizontal: 15, vertical: 5),
                  //             decoration: BoxDecoration(
                  //                 color: controller.receiptState.value ==
                  //                         ReceiptState.crypto
                  //                     ? const Color(0xffF1D643)
                  //                     : const Constants.txtColor(),
                  //                 borderRadius: BorderRadius.circular(22)),
                  //             child: const Center(
                  //               child: Text(
                  //                 "Crypto Receipt",
                  //                 style: TextStyle(
                  //                   color: Color(0xff000000),
                  //                   fontWeight: FontWeight.w600,
                  //                   fontSize: 14,
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         GestureDetector(
                  //           onTap: () {
                  //             // controller.receiptState.value = ReceiptState.fiat;
                  //           },
                  //           child: Container(
                  //             height: 50,
                  //             width: 150,
                  //             padding: const EdgeInsets.symmetric(
                  //                 horizontal: 25, vertical: 5),
                  //             decoration: BoxDecoration(
                  //                 color: controller.receiptState.value ==
                  //                         ReceiptState.fiat
                  //                     ? const Color(0xffF1D643)
                  //                     : const Constants.txtColor(),
                  //                 borderRadius: BorderRadius.circular(22)),
                  //             child: const Center(
                  //               child: Text(
                  //                 "Fiat Receipt",
                  //                 style: TextStyle(
                  //                   color: Color(0xff000000),
                  //                   fontWeight: FontWeight.w600,
                  //                   fontSize: 14,
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (controller.receiptState.value == ReceiptState.crypto) ...[
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Funds is on the way",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Constants.txtColor(),
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your crypto swap to the below address is on it’s way. Check your wallet for confirmation.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Constants.txtColor(),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(children: [
                      Text(
                        "Crypto Address",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2.5,
                        child: Text(
                          swapController.transactionCryptoData?.cryptoAddress ??
                              '',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "Crypto Network",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        swapController.transactionCryptoData?.cryptoNetwork ??
                            '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "Payment Reference",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        swapController.transactionCryptoData?.paymentRef ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "Order Number",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        swapController.transactionCryptoData?.orderNo ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "Payment Provider",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        swapController.transactionCryptoData?.paymentProvider ??
                            '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "From ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${swapController.transactionCryptoData!.fromCurrency}${swapController.transactionCryptoData!.fromCurrencyAmt ?? ''}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "To Currency",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${swapController.transactionCryptoData!.toCurrency}${swapController.transactionCryptoData?.toCurrencyAmt ?? ''}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "Rate",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${swapController.transactionCryptoData!.fromCurrency}${swapController.transactionCryptoData?.rate ?? ''}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "Timestamp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        swapController.transactionCryptoData?.timestamp ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "Transaction Hash",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        swapController.transactionCryptoData?.txnHash ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "Fee",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "\$${swapController.transactionCryptoData?.fee}" ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 50,
                    ),
                    Button(
                      buttonText: "Close",
                      onTap: () {
                        Get.toNamed('/home');
                      },
                    )
                  ],
                  if (controller.receiptState.value == ReceiptState.fiat) ...[
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Funds is on the way",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Constants.txtColor(),
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your fiat transfer was received and\nimmediately processed to USDT",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Constants.txtColor(),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(children: [
                      Text(
                        "Payment Reference",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        swapController.transactionFiatData?.paymentRef ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "Order Number",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        swapController.transactionFiatData?.orderNo ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "Sender’s Bank",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        swapController.transactionFiatData?.senderBank ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "Amount Paid ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        swapController.transactionFiatData?.amountPaid ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "Sender Name",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        swapController.transactionFiatData?.senderName ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "Account number",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        swapController.transactionFiatData?.accountNumber ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "Timestamp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        swapController.transactionFiatData?.timestamp ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "Rate",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.txtColor(),
                          // decoration: TextDecoration.,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${swapController.transactionCryptoData!.fromCurrency}${swapController.transactionCryptoData?.rate ?? ''}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 50,
                    ),
                    Button(
                      buttonText: "Close",
                      onTap: () => Get.offAllNamed('/home'),
                    )
                  ],
                  const SizedBox(
                    height: 20,
                  ),
                ]),
              ),
            ),
          )),
    );
  }
}
