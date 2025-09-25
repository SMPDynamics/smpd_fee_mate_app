import 'package:flutter/material.dart';
import 'package:smpd_fee_mate_app/core/utils/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = MediaQuery.of(context).size.width;
            double buttonWidth = constraints.maxWidth * 0.9;
            double imageHeight = constraints.maxHeight * 0.35;
            double buttonHeight = 50;
            double buttonBorderRad = 12;
            String nxtLnChar = screenWidth > 500 ? " " : "\n";
            return SingleChildScrollView(
              //  wrap with scroll view
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight, // fill screen if tall
                ),
                child: IntrinsicHeight(
                  // let children size naturally
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          "Welcome to Feemate",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // Graduation cap image
                        SizedBox(
                          height: imageHeight,
                          child: Center(
                            child: Image.asset(
                              "images/graduation.jpg",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        // const SizedBox(height: 10),
                        Text(
                          "Manage your students${nxtLnChar}and sessions with ease.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Buttons
                        Column(
                          children: [
                            SizedBox(
                              width: buttonWidth, //double.infinity,
                              height: buttonHeight,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(buttonBorderRad),
                                  ),
                                ),
                                child: const Text(
                                  "Get Started",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: buttonWidth, //double.infinity,
                              height: buttonHeight,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 235, 232, 242),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(buttonBorderRad),
                                  ),
                                ),
                                child: const Text(
                                  "Sign in",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
