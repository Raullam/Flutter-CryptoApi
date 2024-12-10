// El widget `dades_crypto_pageDetail` mostra diverses dades detallades d'una criptomoneda en una pàgina de detall. Utilitza el widget `DetailRowWidget` per mostrar informació com el preu actual, canvi en 24 hores, màxim i mínim de 24 hores, capitalització de mercat, circulant i total supply, així com l'última actualització. Les dades es mostren amb espais entre cada fila per facilitar la lectura.

import 'package:apipmm/widgets/detail_row_widget.dart';
import 'package:flutter/material.dart';
import '../models/crypto.dart';

class dades_crypto_pageDetail extends StatelessWidget {
  const dades_crypto_pageDetail({
    super.key,
    required this.crypto,
  });

  final Crypto crypto;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailRowWidget(
          label: 'Precio actual',
          value: '\$${crypto.currentPrice}',
        ),
        const SizedBox(height: 10),
        // Cambio de precio en 24h con color dinámico
        DetailRowWidget(
          label: 'Cambio en 24h',
          value: '${crypto.priceChangePercentage24h}%',
          isPercentage: true,
        ),
        const SizedBox(height: 10),
        // Preu maxim ultimes 24h
        DetailRowWidget(
          label: 'Máximo en 24h',
          value: '\$${crypto.high24h}',
        ),
        const SizedBox(height: 10),
        // Preu minim ultimes 24h
        DetailRowWidget(
          label: 'Mínimo en 24h',
          value: '\$${crypto.low24h}',
        ),
        const SizedBox(height: 10),
        // Capitalizació de mercat(diners d'intre de la criptomoneda)
        DetailRowWidget(
          label: 'Capitalización de mercado',
          value: '\$${crypto.marketCap}',
        ),
        const SizedBox(height: 10),
        // Supply Circulant
        DetailRowWidget(
          label: 'Supply Circulante',
          value: crypto.circulatingSupply != null
              ? '\$${crypto.circulatingSupply}'
              : 'No disponible',
        ),
        const SizedBox(height: 10),
        // Total supply de la criptomoneda
        DetailRowWidget(
          label: 'Supply Total',
          value: crypto.totalSupply != null
              ? '\$${crypto.totalSupply}'
              : 'No disponible',
        ),
        const SizedBox(height: 10),
        // Ultima actualització de les dades
        DetailRowWidget(
          label: 'Última actualización',
          value: crypto.lastUpdated ?? 'No disponible',
        ),
      ],
    );
  }
}
