import 'package:cached_network_image/cached_network_image.dart';
import 'package:dota/domain/entities/heroes.dart';
import 'package:dota/presentation/pages/detail_page.dart';
import 'package:flutter/material.dart';

class CardHero extends StatelessWidget {
  final Heroes heroes;

  const CardHero(this.heroes, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var img = heroes.img;
    String roles = heroes.roles.join(', ');
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
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
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )),
                ),
                fit: BoxFit.fitWidth,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          heroes.localizedName,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 0.5,
                            color: Color(0xFFE7E7E7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    roles,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    heroes.primaryAttr ?? "-",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
