import 'package:assignment2/app_theme.dart';
import 'package:assignment2/tabs/hadeth/hadeth.dart';
import 'package:assignment2/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

class HadethContentScreen extends StatelessWidget {
  const HadethContentScreen({super.key});
static const String routName = '/hadeth_content_screen';
  @override
  Widget build(BuildContext context) {
   Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;


    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image/default_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          // title: Text(hadeth.suraName),
          title:  Text('اسلامي'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 45.0),
          child: Stack(children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      hadeth.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: AppTheme.black,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Icon(
                          Icons.play_arrow,
                          color: AppTheme.white,
                        )),
                  ],
                ),
                const Divider(
                  thickness: 2,
                  color: AppTheme.lightPrimary,
                  endIndent: 50,
                  indent: 50,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(24),
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.sizeOf(context).height * 0.07,
                horizontal: 24,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppTheme.white,
              ),
              child:
                  ListView.builder(
                itemBuilder: (_, index) => Text(
                  hadeth.content[index],
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                itemCount: hadeth.content.length,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
