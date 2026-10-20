import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  // ─── Parâmetros que o card recebe ───────────────────────────
  final String titulo; // nome do filme
  final String capaUrl; // URL da imagem da capa
  final VoidCallback? onTap; // ação ao clicar (opcional)
  final double largura; // largura do card (padrão 120)

  const Cards({
    super.key,
    required this.titulo,
    required this.capaUrl,
    this.onTap,
    this.largura = 120,
  });

  @override
  Widget build(BuildContext context) {
    // Altura da imagem segue proporção 2:3 (pôster)
    final alturaImagem = largura * 1.5;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: largura,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // ─── CAPA ───────────────────────────────────────
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                capaUrl,
                width: largura,
                height: alturaImagem,
                fit: BoxFit.cover,
                // Fallback se a imagem falhar
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: largura,
                    height: alturaImagem,
                    color: Colors.grey[800],
                    child: const Icon(
                      Icons.movie,
                      color: Colors.white54,
                      size: 40,
                    ),
                  );
                },
                // Placeholder enquanto carrega
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return Container(
                    width: largura,
                    height: alturaImagem,
                    color: Colors.grey[900],
                    child: const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white54,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 6),

            // ─── NOME DO FILME ──────────────────────────────
            Text(
              titulo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
