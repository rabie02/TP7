import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/auth_screen.dart';
import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyClHAtSR0wBF67gBbBWGkkcIzoF8J_UGts',
      appId: '1:546765730114:android:67e493e924c0620a38d8db',
      messagingSenderId: '546765730114',
      projectId: 'fir-app-34396',
    ),
  ); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Vérifier l'état d'authentification
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(), // Flux d'état d'authentification
      builder: (context, snapshot) {
        // Si l'utilisateur est authentifié, rediriger vers HomePage, sinon AuthScreen
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            // L'utilisateur est authentifié
            return MaterialApp(
              title: 'Flutter App',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: HomePage(),
            );
          } else {
            // L'utilisateur n'est pas authentifié
            return MaterialApp(
              title: 'Flutter App',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: AuthScreen(), // Affiche AuthScreen si l'utilisateur n'est pas connecté
            );
          }
        }
        // En cas de chargement initial, afficher un indicateur de chargement
        return MaterialApp(
          title: 'Flutter App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            body: Center(child: CircularProgressIndicator()), // Afficher le spinner pendant l'initialisation
          ),
        );
      },
    );
  }
}
