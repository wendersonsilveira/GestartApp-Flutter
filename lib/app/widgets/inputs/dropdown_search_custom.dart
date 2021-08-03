import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DropdownSearchWidget extends StatefulWidget {
  final String hintText;
  final dynamic value;
  final Function onSelected;
  final List<DropdownSearchItem> items;
  const DropdownSearchWidget({Key key, this.hintText, this.items, this.value, this.onSelected}) : super(key: key);

  @override
  _DropdownSearchWidgetState createState() => _DropdownSearchWidgetState();
}

class _DropdownSearchWidgetState extends State<DropdownSearchWidget> {
  List<DropdownSearchItem> items = [];
  List<DropdownSearchItem> itemsOld = [];
  String title;
  @override
  void initState() {
    super.initState();
    items = widget.items;
    itemsOld = widget.items;
    title =
        widget.value != 0 && widget.value != '0' && widget.value != '' && widget.value != null ? itemsOld.firstWhere((element) => element.value == widget.value).title.data : null;
  }

  List<DropdownSearchItem> searchItems(String value) {
    return itemsOld.where((element) => element.title.data.toLowerCase().contains(value.toLowerCase())).toList();
  }

  _showOptionsList() {
    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (_, setState) => SimpleDialog(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    items = searchItems(value);
                  });
                },
                decoration: InputDecoration(hintText: 'Buscar...'),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              width: MediaQuery.of(context).size.width - 100,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[200], width: 1),
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 2),
                      title: items[index].title,
                      leading: items[index].value == widget.value
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : Icon(
                              FlutterIcons.circle_outline_mco,
                              color: Colors.green,
                            ),
                      onTap: () {
                        setSelectedItemTitle(index);
                        widget.onSelected(items[index].value);
                        Navigator.of(context).pop(true);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ).then((value) {
      print(value);
    });
  }

  setSelectedItemTitle(int index) {
    setState(() {
      title = itemsOld[index].title.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showOptionsList,
      child: Container(
        padding: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[500], width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title ?? widget.hintText ?? 'Selecione..',
                style: TextStyle(color: Colors.grey[700]),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}

class DropdownSearchItem {
  final Text title;
  final dynamic value;

  const DropdownSearchItem({this.title, this.value});
}
