import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailPage extends StatefulWidget {
  final Article article;

  const DetailPage({Key? key, required this.article}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          Image.network(
            widget.article.urlToImage,
            height: 350,
            fit: BoxFit.cover,
          ),
          ListView(children: [
            const SizedBox(
              height: 330,
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      widget.article.title,
                      style: titleArticle.copyWith(fontSize: 18),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(children: [
                          Icon(Icons.account_circle),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.article.author,
                            style: authorDateArticle.copyWith(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ]),
                        Row(
                          children: [
                            Icon(Icons.calendar_today_outlined),
                            Text(
                              time(DateTime.parse(widget.article.publishedAt)),
                              style: authorDateArticle.copyWith(fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.article.content,
                      style: detailArticle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 10),
                        blurRadius: 50
                      )
                    ]
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 10),
                        blurRadius: 50
                      )
                    ]
                  ),
                  child: IconButton(
                    onPressed: () {

                    },
                    icon: Icon(Icons.bookmark_border_rounded),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  String time(DateTime parse) {
    return timeago.format(parse, locale: 'id', allowFromNow: true);
  }
}
