import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  String product_detail_title;
  String product_detail_image;
  String product_detail_price;
  String product_detail_discount_price;
  //final product_detail_offer;
  String product_detail_descriptions;

  ProductDetails({
    this.product_detail_title,
    this.product_detail_image,
    this.product_detail_price,
    this.product_detail_discount_price,
    //this.product_detail_offer,
    this.product_detail_descriptions,
    String product_detail_offer,
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Color colorss = Colors.indigo[800];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.indigo[800],
        centerTitle: true,
        title: Text('GTKBasket'),
        actions: [
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          new Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.network(
                  widget.product_detail_image,
                  fit: BoxFit.contain,
                ),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.product_detail_title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  title: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(
                          '\u20B9' + widget.product_detail_price,
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '\u20B9' + widget.product_detail_discount_price,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "20%",
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Quantity",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(child: CustomButton())
                      ],
                    )),
              ),
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Weight",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: CustomButton(),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.indigo[800],
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text("Buy now"),
                ),
              ),
              new IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.indigo[800],
                  ),
                  onPressed: () {}),
              new IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: colorss,
                  ),
                  onPressed: () {
                    setState(() {
                      colorss = Colors.red;
                    });
                  })
            ],
          ),
          Divider(
            color: Colors.indigo[800],
          ),
          ListTile(
            title: Text("Product Detail"),
            subtitle: Text(widget.product_detail_descriptions),
          ),
          Divider(
            color: Colors.indigo[800],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
              ),
              Text("Brand"),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
              ),
              Text("Model"),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
              ),
              Text("Max Shelf Life"),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
              ),
              Text("Dealer Info"),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  List<String> data = ["One", "Two", "Five"];
  var selected = "One";
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text("names"),
      value: selected,
      onChanged: ((values) {
        setState(() {
          selected = values;
        });
      }),
      items: data.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e),
        );
      }).toList(),
    );
  }
}
