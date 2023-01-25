import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fmea/models/fmea_model.dart';
import 'package:fmea/screens/add_edit_data.dart';
import 'package:fmea/screens/detail_page.dart';
import 'package:fmea/widgets/app_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fmea/widgets/item_card.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  List<FMEA> fmeaList = [];

  @override
  void initState() {
    super.initState();
    getFMEAData();
  }

  @override
  Widget build(BuildContext context) {
    FMEAData blankitems = FMEAData();
    return Scaffold(
        appBar: const AppBarWidget(
          title: "Summary",
          customAction: [],
        ),
        body: Center(
            child: fmeaList.isEmpty
                ? const Center(
                    child: Text(
                      "No Records to Display.",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.deepOrange,
                      ),
                    ),
                  )
                : buildFMEA()),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddEditDataPage(
                  item: blankitems,
                ),
              ),
            );
          },
          child: const Icon(Icons.playlist_add),
        ));
  }

  void getFMEAData() async {
    DatabaseReference dbRef = FirebaseDatabase.instance.ref();
    dbRef.child("FMEA").child("KTKTools").onChildAdded.listen((data) {
      FMEAData fmeaData = FMEAData.fromJson(data.snapshot.value as Map);
      FMEA fmea = FMEA(key: data.snapshot.key, fmeaData: fmeaData);
      fmeaList.add(fmea);
      setState(() {});
    });
  }

  Widget buildFMEA() => StaggeredGridView.countBuilder(
        itemCount: fmeaList.length,
        staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        itemBuilder: (context, index) {
          final fmea = fmeaList[index];
          return GestureDetector(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          index: index,
                          fmeaList: fmeaList,
                        )),
              ).then((value) {
                setState(() {});
              });
            },
            child: ItemCard(
              item: fmea.fmeaData!,
              index: index,
            ),
          );
        },
      );
}
