import 'package:flutter/material.dart';
import 'package:act13/model/movie_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscador',
      debugShowCheckedModeBanner: false,
      home: const SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  static List<MovieModel> mainMovieList = [
    MovieModel("The Godfather", 1972, 9.5,
        "https://th.bing.com/th/id/OIP.7d6RdxocvhZaE0f7Li9UyAHaKh?w=140&h=199&c=7&r=0&o=5&pid=1.7"),
    MovieModel("Scarface", 1983, 9.1,
        "https://th.bing.com/th/id/OIP.JvN5Izx5KGTX5iTomejT6AHaEo?w=239&h=180&c=7&r=0&o=5&pid=1.7"),
    MovieModel("Cars", 2006, 9.3,
        "https://th.bing.com/th/id/OIP.RaSZ3YZS8N1Mi01LkbT6wgHaEK?w=235&h=180&c=7&r=0&o=5&pid=1.7"),
    MovieModel("Sherk", 2001, 9.3,
        "https://th.bing.com/th/id/OIP.BkRISI-vaJ3vsUv8pid9mQHaEo?w=268&h=180&c=7&r=0&o=5&pid=1.7"),
    MovieModel("Toy Story", 1995, 9.2,
        "https://th.bing.com/th/id/OIP.wptK0sO0EZiK71YgZzbGBAHaEK?w=328&h=184&c=7&r=0&o=5&pid=1.7"),
    MovieModel("RoboCop", 1987, 9.0,
        "https://th.bing.com/th/id/OIP.5b8D7qylTS2wcNGN6MPPLwHaLH?w=116&h=180&c=7&r=0&o=5&pid=1.7"),
    MovieModel("The Terminator", 1984, 9.4,
        "https://th.bing.com/th/id/OIP.IgNVOWeKx-7Fm40M8fpi0wHaLH?w=119&h=180&c=7&r=0&o=5&pid=1.7"),
    MovieModel("El Secreto de la Calabaza Magica", 2007, 9.7,
        "https://th.bing.com/th/id/OIP.YiKIVAkrYCasIqmFweKhMwHaKk?w=115&h=180&c=7&r=0&o=5&pid=1.7s"),
    MovieModel("Pucca", 2006, 9.6,
        "https://th.bing.com/th/id/OIP.2P5m1VsjQAHKiv1mtJLcLgHaKk?w=115&h=180&c=7&r=0&o=5&pid=1.7"),
    MovieModel("Buscando a Nemo", 2003, 9.8,
        "https://th.bing.com/th/id/OIP.DTtng8Zcw9OdGj2y9pJi9gE8DF?w=299&h=186&c=7&r=0&o=5&pid=1.7"),
  
  ];

  List<MovieModel> displayList = List.from(mainMovieList);

  void updateList(String value) {
   setState(() {
     displayList = mainMovieList.where((element) => element.movieTitle!.toLowerCase().contains(value.toLowerCase()))
     .toList();
   }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Buscador de películas',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              onChanged: (value) =>  updateList(value),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1f1545),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Buscar",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
             child: displayList.length == 0 ?Center(child: Text("No Hay Resultados", style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold ),),):
               ListView.builder(
                itemCount: displayList.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text(
                    displayList[index].movieTitle!,
                    style: const TextStyle(color: Colors.white, 
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('${displayList[index].releaseYear!}',
                  style: TextStyle(
                    color: Colors.white60
                    ),
                  ),
                  trailing: Text("${displayList[index].rating}",
                  style: TextStyle(color: Colors.amber),
                  ),
                  leading: Image.network(displayList[index].imageUrl!),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
