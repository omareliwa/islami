import 'package:assignment2/tabs/hadeth/hadeth_content.dart';
import 'package:assignment2/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'hadeth.dart';

class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      loadAhadethFile();
    }
    return Column(
      children: [
        Image.asset(
          'assets/image/hadeth_logo.png',
          height: MediaQuery.sizeOf(context).height * 0.25,
        ),
        Expanded(
          child: ahadeth.isEmpty
              ? const LoadingIndicator()
              : ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      HadethContentScreen.routName,
                      arguments: ahadeth[index],
                    ),
                    child: Text(
                      ahadeth[index].title,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  itemCount: ahadeth.length,
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 12,
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> loadAhadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString('assets/text/ahadeth.txt');
    List<String> ahadethString = ahadethFileContent.split('#');
    ahadeth = ahadethString.map(
      (hadethString) {
        List<String> hadethLines = hadethString.trim().split('\n');
        String title = hadethLines.first;
        hadethLines.removeAt(0);
        List<String> content = hadethLines;
        return Hadeth(title, content);
      },
    ).toList();
    setState(() {});
  }
}
