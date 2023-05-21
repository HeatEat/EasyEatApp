import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/authentication/authentication_bloc.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Cześć, Ryszard!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: screenHight * 0.02),
          ListTile(
            title: const Text("Zamówienia"),
            onTap: () {},
            tileColor: Theme.of(context).colorScheme.onInverseSurface,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(height: screenHight * 0.01),
          ListTile(
            title: const Text("Ulubione"),
            onTap: () {},
            tileColor: Theme.of(context).colorScheme.onInverseSurface,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(height: screenHight * 0.01),
          ListTile(
            title: const Text("Wyloguj się"),
            onTap: () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(const SignOutEvent());
            },
            tileColor: Theme.of(context).colorScheme.onInverseSurface,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ],
      ),
    );
  }
}
