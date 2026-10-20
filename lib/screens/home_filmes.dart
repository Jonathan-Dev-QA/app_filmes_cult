import 'package:app_filmes_cult/widget/card_filme.dart';
import 'package:flutter/material.dart';

class HomeFilmes extends StatelessWidget {
  const HomeFilmes({super.key});

  // ─── LISTA DE FILMES (por enquanto hardcoded) ─────────────
  // Depois você troca por dados do Firestore
  static const List<Map<String, String>> filmes = [
    {
      'titulo': 'Vingadores',
      'capaUrl':
          'https://image.tmdb.org/t/p/w500/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg',
    },
    {
      'titulo': 'Vingadores: Ultimato',
      'capaUrl':
          'https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
    },
    {
      'titulo': 'Homem de Ferro',
      'capaUrl':
          'https://image.tmdb.org/t/p/w500/8tZYtuWezp8JbcsvHYO0O46tFbo.jpg',
    },
    {
      'titulo': 'Capitão América',
      'capaUrl':
          'https://image.tmdb.org/t/p/w500/vSNxAJTlD0r02V9sPYpOjqDZXUK.jpg',
    },
  ];

  static const List<Map<String, String>> series = [
    {
      'titulo': 'Westworld',
      'capaUrl':
          'https://image.tmdb.org/t/p/w500/ALlSU9du9iRiKIIoY1sREGNqQ5.jpg',
    },
    {
      'titulo': 'Breaking Bad',
      'capaUrl':
          'https://image.tmdb.org/t/p/w500/anFx9aTOOYqgS3v7x3R84Kz67ly.jpg',
    },
    {
      'titulo': 'Rick and Morty',
      'capaUrl':
          'https://image.tmdb.org/t/p/w500/8kOWDBK6XlPUzckuHDo3wwVRFwt.jpg',
    },
    {
      'titulo': 'Bojack Horserman',
      'capaUrl':
          'https://image.tmdb.org/t/p/w500/t3r6TaOTIMxcNMb9O6gofQrHJr9.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 78, 78, 78),
        title: const Text(
          'CineVerse',
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      // ─── DRAWER (menu lateral) ────────────────────────────
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 78, 78, 78),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 78, 78, 78)),
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Meu perfil'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              iconColor: Colors.white,
              leading: const Icon(Icons.movie_sharp),
              title: const Text(
                'Filmes',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 253, 253, 253),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              iconColor: Colors.white,
              leading: const Icon(Icons.live_tv),
              title: const Text(
                'Séries',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 253, 253, 253),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),

      // ─── BODY ─────────────────────────────────────────────
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .start, // alinhado à esquerda (estilo Netflix)
            children: [
              // Avatar
              const SizedBox(height: 10),

              const Row(
                children: [
                  Icon(Icons.movie, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'FIlmes',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color.fromARGB(255, 152, 172, 216),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Seção "Ação"
              const Text(
                'Ação',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // Prateleira de filmes (ListView horizontal)
              SizedBox(
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  itemCount: filmes.length,
                  itemBuilder: (context, index) {
                    final filme = filmes[index];
                    return Cards(
                      titulo: filme['titulo']!,
                      capaUrl: filme['capaUrl']!,
                      onTap: () {
                        // abrir detalhes do filme
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Avcentura ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              SizedBox(
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  itemCount: series.length,
                  itemBuilder: (context, index) {
                    final serie = series[index];
                    return Cards(
                      titulo: serie['titulo']!,
                      capaUrl: serie['capaUrl']!,
                      onTap: () {
                        // abrir detalhes do filme
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Comédia',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              SizedBox(
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  itemCount: series.length,
                  itemBuilder: (context, index) {
                    final serie = series[index];
                    return Cards(
                      titulo: serie['titulo']!,
                      capaUrl: serie['capaUrl']!,
                      onTap: () {
                        // abrir detalhes do filme
                      },
                    );
                  },
                ),
              ),

              // Você pode adicionar mais seções aqui depois
              // Ex: Text('Comédia'), SizedBox(height: 230, child: ListView...)
            ],
          ),
        ),
      ),
    );
  }
}
