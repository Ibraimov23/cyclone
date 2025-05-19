import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Finance extends StatefulWidget {
  const Finance({super.key});

  @override
  State<Finance> createState() => _FinanceState();
}

class _FinanceState extends State<Finance> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF90010A),
            shape: BoxShape.circle,
          ),
          child: IconTheme(
            data: const IconThemeData(color: Colors.white),
            child: const BackButton(),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Финансы",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 190,
                child: FlutterCarousel(
                  items: List.generate(6, (index) {
                    return Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/visa_cart.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
                  options: FlutterCarouselOptions(
                    showIndicator: true,
                    enlargeCenterPage: true,
                    height: 190,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Изменить карту',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Удалить карту',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 128,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 128,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 128,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
