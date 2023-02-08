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
  List<FMEA> filteredFmeaList = [];
  bool isLoading = true;
  late String selection;

  @override
  void initState() {
    super.initState();
    selection = "all";
    getFMEAData();
    filterFMEAList("all");
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
          child: isLoading
              ? const CircularProgressIndicator()
              : fmeaList.isEmpty
                  ? const Center(
                      child: Text(
                        "No Records to Display.",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.deepOrange,
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: "all",
                              focusNode: FocusNode(),
                              groupValue: selection,
                              onChanged: (value) {
                                setState(() {
                                  selection = value.toString();
                                  filterFMEAList(selection);
                                });
                              },
                            ),
                            const Text(
                              "All",
                              style: TextStyle(fontSize: 18),
                            ),
                            Radio(
                              value: "closed",
                              groupValue: selection,
                              onChanged: (value) {
                                setState(() {
                                  selection = value.toString();
                                  filterFMEAList(selection);
                                });
                              },
                            ),
                            const Text(
                              "Closed",
                              style: TextStyle(fontSize: 18),
                            ),
                            Radio(
                              value: "open",
                              groupValue: selection,
                              onChanged: (value) {
                                setState(
                                  () {
                                    selection = value.toString();
                                    filterFMEAList(selection);
                                  },
                                );
                              },
                            ),
                            const Text(
                              "Open",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Expanded(
                          child: buildFMEA(selection),
                        ),
                      ],
                    ),
        ),
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

  void filterFMEAList(String? selection) {
    if (selection == "all") {
      filteredFmeaList = fmeaList;
    } else if (selection == "closed") {
      filteredFmeaList = fmeaList
          .where((element) => element.fmeaData?.status == "Closed")
          .toList();
    } else if (selection == "open") {
      filteredFmeaList = fmeaList
          .where((element) => element.fmeaData?.status == "Open")
          .toList();
    }
  }

  void getFMEAData() async {
    DatabaseReference dbRef = FirebaseDatabase.instance.ref();
    isLoading = true;
    dbRef.child("FMEA").child("KTKTools").onChildAdded.listen((data) {
      FMEAData fmeaData = FMEAData.fromJson(data.snapshot.value as Map);
      FMEA fmea = FMEA(key: data.snapshot.key, fmeaData: fmeaData);
      fmeaList.add(fmea);
      setState(() {});
      isLoading = false;
    });
  }

  Widget buildFMEA(String? selection) => StaggeredGridView.countBuilder(
        itemCount: filteredFmeaList.length,
        staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        itemBuilder: (context, index) {
          final fmea = filteredFmeaList[index];
          return GestureDetector(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          index: index,
                          fmeaList: filteredFmeaList,
                          status: selection!,
                        )),
              ).then((value) {
                setState(() {
                  filterFMEAList(selection);
                });
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
