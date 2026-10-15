import 'package:flutter/material.dart';

//TELA DE PERFIL

// Essa classe representa a tela de perfil do aplicativo
class HomeFilmes extends StatelessWidget {
  const HomeFilmes({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold quem vai fornecer a estrutura visual basica da tela.
    return Scaffold(
      // Barra superior da tela
      appBar: AppBar(title: const Text('Meus Filmes'), centerTitle: true),

      //começamos adicionar as mudanças para o menu
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 146, 145, 145),
        child: ListView(
          padding: EdgeInsets.zero,

          //children recebe os widgets que serão apresentados no menu
          children: [
            const DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 190, 191, 192),
              ),
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Meus perfil'),
              onTap: () {
                Navigator.pop(context);
              },
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
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.live_tv),
              title: const Text('series'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // conteudo principal
      // body: Center(child: Text('Tela de Perfil!')),
      // SingleChildScrollView deixar o que o conteudo role quando for maior que a tela
      body: SingleChildScrollView(
        child: Padding(
          //Criando um espaço interno ao redor do conteudo.
          padding: const EdgeInsets.all(24),

          // Coluna para organizar seus filhos verticalmente
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar circular do perfil
              const CircleAvatar(
                radius: 55,
                child: Icon(Icons.person, size: 65),
              ),

              // criar um espaço vertical
              const SizedBox(height: 20),

              // Primeiro texto da coluna
              // Nome do Usuario
              const Text(
                'Jonathan Viana',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 77, 208, 231),
                  fontWeight: FontWeight.bold,
                ),
              ),

              // segundo texto da coluna
              const Text(
                'Desenvolvedor Mobile',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 161, 18, 18),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Tecnologias',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  // distribui os elementos entre os espaços disponiveis
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text('Flutter'), Text('Mobile'), Text('Firebase')],
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'Task front end ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 35),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Botão Editar perfil precionado!'),
                      ),
                    );
                  },
                  child: const Text('Editar Perfil'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
