import 'package:flutter/material.dart';
import 'package:jv_cycles/data/List.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  @override
  Widget build(BuildContext context) {
    List<Models> modelList = [
      Models('Cycle 1', 10000,
          'https://github.com/vikram-vikky2002/supportingDoc/blob/main/download%20(1).jpeg?raw=true'),
      Models('Vikram', 12000,
          'https://github.com/vikram-vikky2002/supportingDoc/blob/main/download%20(2).jpeg?raw=true'),
      Models('Shagu', 14000,
          'https://github.com/vikram-vikky2002/supportingDoc/blob/main/download%20(3).jpeg?raw=true'),
      Models('Vishnu', 8000,
          'https://github.com/vikram-vikky2002/supportingDoc/blob/main/download%20(4).jpeg?raw=true'),
      Models('Cycle 5', 9000,
          'https://github.com/vikram-vikky2002/supportingDoc/blob/main/download.jpeg?raw=true'),
      Models('Cycle 6', 7000,
          'https://github.com/vikram-vikky2002/supportingDoc/blob/main/images%20(1).jpeg?raw=true'),
      Models('Cycle 7', 10000,
          'https://github.com/vikram-vikky2002/supportingDoc/blob/main/images.jpeg?raw=true'),
    ];

    List<Models> displayList = List.from(modelList);

    void updateList(String value) {
      setState(() {
        displayList = modelList
            .where((element) =>
                element.title!.toLowerCase().contains(value.toLowerCase()))
            .toList();
      });
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Search for a Product',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  onChanged: (value) => updateList(value),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 190, 190, 190),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "eg: Lady Bird",
                    prefixIcon: const Icon(Icons.search_rounded),
                    prefixIconColor: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: displayList.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Text(
                          displayList[index].title!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          '₹ ${displayList[index].price!}',
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 18),
                        ),
                      ),
                      leading: SizedBox(
                          height: 60,
                          width: 90,
                          child: Image.network(displayList[index].photos!)),
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
