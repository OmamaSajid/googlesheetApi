import 'dart:io';

import 'package:flutter/material.dart';
import 'package:googlesheetspdf/characterservice.dart';
import 'package:googlesheetspdf/charcters_model.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class characters extends StatefulWidget {
  const characters({super.key});

  @override
  State<characters> createState() => _charactersState();
}

class _charactersState extends State<characters> {
  late Future<List<Character>> ftch;
  void initState() {
    super.initState();
    ftch = CharacterService().getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: Text(
            'GOOGLE SHEET API INTEGTARION',
          ),
          actions: [
            IconButton(
                onPressed: () {
                  pdfconverter();
                },
                icon: Icon(Icons.picture_as_pdf))
          ],
        ),
        body: FutureBuilder(
            future: ftch,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text('$Error');
              } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                return Text('No charcters fetched');
              } else if (snapshot.hasData!) {
                List<Character> ch = snapshot.data!;
                return ListView.builder(
                    itemCount: ch.length,
                    itemBuilder: (context, index) {
                      Character chs = ch[index];
                      return ListTile(
                        title: Text(chs.name),
                        subtitle: Text(chs.purpose),
                        trailing: Icon(
                          chs.enemy ? Icons.thumb_up : Icons.thumb_down,
                          color: chs.enemy ? Colors.green : Colors.red,
                        ),
                      );
                    });
              } else {
                return Text('unknown error');
              }
            }));
  }

  Future<void> pdfconverter() async {
    try {
      List<Character> characters = await ftch;
      final pdf = pw.Document();
      pdf.addPage(pw.Page(
          build: (pw.Context context) => pw.ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                Character chs = characters[index];
                return pw.Column(
                  children: [
                    pw.Text('Name: ${chs.name}'),
                    pw.Text('Purpose ${chs.purpose}'),
                    pw.Text('is enemy: ${chs.enemy ? 'yes' : 'no'}'),
                    pw.Divider()
                  ],
                );
              })));

      final output = await getTemporaryDirectory();
      final path = File('${output.path}/characters.pdf');
      await path.writeAsBytes(await pdf.save());
      final result = await OpenFile.open(path.path);
    } catch (e) {
      print('error');
    }
  }
}
