import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black, // Fondo negro
        appBar: AppBar(
          title: Text(
            'Cartelera de Cine',
            style: GoogleFonts.roboto(color: Colors.white), // Texto blanco
          ),
          backgroundColor: Colors.black,
        ),
        body: MovieList(),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies = [
    Movie(
      title: 'Venom: El Último Baile',
      releaseDate: '25 de octubre de 2024',
      duration: '1h 50min',
      genres: 'Acción, Comedia, Fantasía',
      director: 'Kelly Marcel',
      cast: 'Tom Hardy, Juno Temple, Alanna Ubach',
      imageUrl: 'assets/images/venom.jpg',
      ratings: {'Críticas': 2.3, 'Rating': 3.5},
    ),
    Movie(
      title: 'Avatar: El camino del agua',
      releaseDate: '15 de diciembre de 2024',
      duration: '2h 30min',
      genres: 'Ciencia Ficción, Aventura',
      director: 'James Cameron',
      cast: 'Sam Worthington, Zoe Saldana',
      imageUrl: 'assets/images/avatar.jpeg',
      ratings: {'Críticas': 4.5, 'Rating': 4.7},
    ),
    Movie(
      title: 'Spider-Man: Sin camino a casa',
      releaseDate: '10 de junio de 2024',
      duration: '2h',
      genres: 'Acción, Aventura, Animación',
      director: 'Joaquim Dos Santos',
      cast: 'Shameik Moore, Hailee Steinfeld',
      imageUrl: 'assets/images/spiderman.jpg',
      ratings: {'Críticas': 4.3, 'Rating': 4.6},
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieCard(movie: movies[index]);
      },
    );
  }
}

class Movie {
  final String title;
  final String releaseDate;
  final String duration;
  final String genres;
  final String director;
  final String cast;
  final String imageUrl;
  final Map<String, double> ratings;

  Movie({
    required this.title,
    required this.releaseDate,
    required this.duration,
    required this.genres,
    required this.director,
    required this.cast,
    required this.imageUrl,
    required this.ratings,
  });
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    movie.imageUrl,
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text('${movie.releaseDate} | ${movie.duration}',
                          style: GoogleFonts.roboto(fontSize: 14)),
                      const SizedBox(height: 5),
                      Text(movie.genres,
                          style: GoogleFonts.roboto(fontSize: 14)),
                      const SizedBox(height: 5),
                      Text('Dirigida por ${movie.director}',
                          style: GoogleFonts.roboto(fontSize: 14)),
                      const SizedBox(height: 5),
                      Text('Reparto: ${movie.cast}',
                          style: GoogleFonts.roboto(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: movie.ratings.entries.map((entry) {
                return Column(
                  children: [
                    Text(
                      entry.key,
                      style: GoogleFonts.roboto(fontSize: 14),
                    ),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < entry.value.round()
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 18,
                        );
                      }),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
