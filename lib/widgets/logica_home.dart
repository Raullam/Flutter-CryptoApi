// `logicaHome` és un widget de tipus `Stateless` que actua com a pantalla principal per mostrar les criptomonedes més populars i els memecoins més destacats. Utilitza dos widgets personalitzats (`CardSwiper` i `CryptoSlider`) per a visualitzar les criptomonedes i memecoins respectivament. A més, inclou un enllaç a la pàgina de perfil de l'usuari al final. Els textos i elements visuals utilitzen un estil consistent amb els colors corporatius, l'utilitzem per fer mes mantenible el codi.

import 'package:apipmm/rutes/rutes.dart';
import 'package:apipmm/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../providers/crypto_provider.dart';

class logicaHome extends StatelessWidget {
  const logicaHome({
    super.key,
    required this.provider,
  });

  final CryptoProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Criptomonedes més populars',
            style: TextStyle(color: Color(0xFF00C4B4), fontSize: 25),
          ),
        ),
        CardSwiper(cryptos: provider.cryptos),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.all(40.0),
          child: Text(
            'Top 7 Memecoins',
            style: TextStyle(color: Color(0xFF00C4B4), fontSize: 25),
          ),
        ),
        CryptoSlider(cryptos: provider.popularMemecoins),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Rutes.perfil);
              },
              child: const Text(
                'Creat per Raül Lama ..🚀',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
