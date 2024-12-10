// La classe `CardSwiper` mostra una sèrie de criptomonedes utilitzant un swiper que permet desplaçar-se entre elles. Cada card inclou la imatge de la criptomoneda i la seva variació de preu en les últimes 24 hores. En clicar sobre una card, es navega a la pàgina de detalls de la criptomoneda seleccionada.

import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:apipmm/screens/crypto_detail_page.dart';
import 'package:apipmm/models/crypto.dart';

class CardSwiper extends StatelessWidget {
  final List<Crypto> cryptos;

  const CardSwiper({Key? key, required this.cryptos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: MediaQuery.of(context).orientation == Orientation.portrait
            ? const EdgeInsets.only(
                top: 45.0) // Padding condicional en mode retrat
            : const EdgeInsets.all(8.0), // Padding complet en mode horitzontal
        child: SizedBox(
          height: 300, // Aumentem l'altura per ajustar els elements
          child: Swiper(
            itemCount: cryptos.length,
            layout: SwiperLayout.DEFAULT, // Cambiaem a diseny predeterminat
            itemWidth: MediaQuery.of(context).size.width * 0.7,
            itemHeight: 250,
            itemBuilder: (BuildContext context, int index) {
              final crypto = cryptos[index];
              // Determinem el color segons la variació de preu en 24 Hores
              final priceChange = crypto.priceChangePercentage24h;
              final priceChangeColor =
                  priceChange > 0 ? Colors.green : Colors.red;

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CryptoDetailsPage(crypto: crypto),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Contenedor per la imatgen
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(crypto.image),
                          fit: BoxFit
                              .fitHeight, // Ajuste para que la imagen cubra todo el contenedor sin deformarse
                        ),
                      ),
                    ),
                    // Contenedor per a la variació de preu en 24 hores
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          '${crypto.priceChangePercentage24h}%',
                          style: TextStyle(
                            color: priceChangeColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            autoplay: true, // Permitim el desplaçament automatic
            autoplayDelay: 4000,
            curve: Curves.easeInOut, // Apliquem una curva de transició suau
            onIndexChanged: (index) {
              // Podem afegir alguna cosa en cada canvi
            },
          ),
        ),
      ),
    );
  }
}
