import 'package:cached_network_image/cached_network_image.dart';
import 'package:dota/domain/entities/heroes.dart';
import 'package:dota/presentation/pages/detail_page.dart';
import 'package:flutter/material.dart';

class CardRecommendation extends StatelessWidget {
  final Heroes heroes;

  const CardRecommendation({Key? key, required this.heroes}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    var img = heroes.img;
    return SizedBox(
      height: 150,
      width: 150,
      child: InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(
            context,
            DetailPage.ROUTE_NAME,
            arguments: heroes,
          );
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: CachedNetworkImage(
                  width: double.infinity,
                  imageUrl: 'https://api.opendota.com$img',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  fit: BoxFit.fitWidth,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  heroes.localizedName,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
