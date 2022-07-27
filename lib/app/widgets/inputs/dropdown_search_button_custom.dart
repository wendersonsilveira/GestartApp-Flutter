import 'package:flutter/material.dart';

class DropdownSearchButtonWidget extends StatefulWidget {
  final String hintText;
  final dynamic value;
  final double height;
  final Function onSelected;
  final List<DropdownSearchButtonItem> items;
  const DropdownSearchButtonWidget(
      {Key key,
      this.hintText,
      this.items,
      this.value,
      this.onSelected,
      this.height})
      : super(key: key);

  @override
  _DropdownSearchButtonWidgetState createState() =>
      _DropdownSearchButtonWidgetState();
}

class _DropdownSearchButtonWidgetState
    extends State<DropdownSearchButtonWidget> {
  List<DropdownSearchButtonItem> items = [];
  List<DropdownSearchButtonItem> itemsOld = [];
  String title;
  @override
  void initState() {
    super.initState();
    items = widget.items;
    itemsOld = widget.items;
    title = widget.value != 0 &&
            widget.value != '0' &&
            widget.value != '' &&
            widget.value != null
        ? itemsOld
            .firstWhere((element) => element.value == widget.value)
            .title
            .data
        : null;
  }

  List<DropdownSearchButtonItem> searchItems(String value) {
    return itemsOld
        .where((element) =>
            element.title.data.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  _showOptionsList() {
    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (_, setState) => SimpleDialog(
          children: [
            Container(
              height: widget.height == null
                  ? MediaQuery.of(context).size.height - 200
                  : widget.height,
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
                              Icons.ac_unit,
                              color: Colors.green,
                            ),
                      onTap: () {
                        setSelectedItemTitle(index);
                        widget.onSelected(index);
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
    return ElevatedButton(
      onPressed: _showOptionsList,
      child: Text(widget.value, style: TextStyle(color: Colors.white)),
      // color: AppColorScheme.primaryColor,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(18.0),
      //     side: BorderSide(color: AppColorScheme.primaryColor)),
    );
  }
}

class DropdownSearchButtonItem {
  final Text title;
  final dynamic value;

  const DropdownSearchButtonItem({this.title, this.value});
}
