import 'package:flutter/material.dart';

class NoTransaction extends StatelessWidget {
  const NoTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'No Transaction added yet',
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                      height: 150,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
    );
  }
}