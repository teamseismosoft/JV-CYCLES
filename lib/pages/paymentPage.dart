import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    super.key,
    required this.quantity,
    required this.deliveryCharges,
    required this.totalCost,
  });

  final int quantity;
  final int deliveryCharges;
  final int totalCost;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int totalAmount = 0;
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    setState(() {
      totalAmount = widget.deliveryCharges + widget.totalCost;
    });
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void handlePaymentSuccess() {
    print('Payment Success');
  }

  void handlePaymentError() {
    print('Payment Error');
  }

  void handleExternalWallet() {
    print('External Wallet');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 23, 29, 97),
                child: const Center(
                  child: Text(
                    'Payment Page',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 50,
                      child: Text(
                        'Total Quantity : ${widget.quantity}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Total Cost             : ${widget.totalCost}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Delivery Charges : ${widget.deliveryCharges}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                        child: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Net Amount          : $totalAmount',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            InkWell(
              onTap: () {
                var options = {
                  'key': '',
                  'amount': num.parse(totalAmount as String) * 100,
                  'name': 'Demo Payment',
                  'description': 'order id',
                  'prefill': {
                    'contact': '8309365005',
                    'email': 'vikram.nitpy@gmail.com'
                  },
                  'external': {
                    'wallets': ['paytm'],
                  }
                };
                try {
                  _razorpay.open(options);
                } catch (e) {
                  print('Error : ${e}');
                }
              },
              child: Container(
                width: 230,
                height: 55,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 7, 116, 130),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Confirm Payment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
