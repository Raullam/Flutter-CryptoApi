// La classe `CryptoDetailsPage` mostra una pàgina amb els detalls d'una criptomoneda. Rep un objecte `Crypto` com a paràmetre i visualitza informació com el nom, símbol, imatge i altres dades financeres, com el preu actual. Utilitza un `AppBar` i un `SingleChildScrollView` per a una millor experiència d'usuari.

import 'package:apipmm/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../models/crypto.dart';

class CryptoDetailsPage extends StatelessWidget {
  final Crypto crypto;

  const CryptoDetailsPage({Key? key, required this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(crypto.name),
        backgroundColor: const Color(0xFF00C4B4),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFF181A20),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imatge de la criptomoneda
              Center(
                child: Image.network(
                  crypto.image,
                  height: 100,
                  width: 100,
                ),
              ),
              const SizedBox(height: 20),
              // Nom i simbol
              Center(
                child: Text(
                  '${crypto.symbol.toUpperCase()}',
                  style: const TextStyle(
                    color: Color(0xFF00C4B4),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Preu actual
              dades_crypto_pageDetail(crypto: crypto),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF181A20),
    );
  }
}
