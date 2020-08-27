import 'package:flutter/material.dart';
import 'package:gtkbasket/components/productdetails.dart';
import 'custom_container.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var list1 = [
    {
      "title": "Rice",
      "images": "images/products/rice.jpg",
      "price": "1000",
      "discount_price": "800",
      "offer": "10%",
      "descriptions":
          "A quick and simplified answer is that Lorem Ipsum refers to text that the DTP (Desktop Publishing) industry use as replacement text when the real text is not available. ... Lorem Ipsum is dummy text which has no meaning however looks very similar to real text.",
    },
    {
      "title": "Ghee",
      "images": "images/products/ghee.jpg",
      "price": "1700",
      "discount_price": "1670",
      "offer": "10%",
      "descriptions":
          "A quick and simplified answer is that Lorem Ipsum refers to text that the DTP (Desktop Publishing) industry use as replacement text when the real text is not available. ... Lorem Ipsum is dummy text which has no meaning however looks very similar to real text.",
    },
    {
      "title": "Oil",
      "images": "images/products/oil.jpg",
      "price": "1300",
      "discount_price": "1230",
      "offer": "10%",
      "descriptions":
          "A quick and simplified answer is that Lorem Ipsum refers to text that the DTP (Desktop Publishing) industry use as replacement text when the real text is not available. ... Lorem Ipsum is dummy text which has no meaning however looks very similar to real text.",
    },
    {
      "title": "Atta",
      "images": "images/products/atta.jpg",
      "price": "900",
      "discount_price": "840",
      "offer": "10%",
      "descriptions":
          "A quick and simplified answer is that Lorem Ipsum refers to text that the DTP (Desktop Publishing) industry use as replacement text when the real text is not available. ... Lorem Ipsum is dummy text which has no meaning however looks very similar to real text.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.7,
      physics: ScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 0,
      children: <Widget>[
        InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProductDetails(
                  product_detail_title: list1[0]["title"],
                  product_detail_image: list1[0]["images"],
                  product_detail_price: list1[0]["price"],
                  product_detail_discount_price: list1[0]["discount_price"],
                  product_detail_offer: list1[0]["offer"],
                  product_detail_descriptions: list1[0]["descriptions"],
                );
              }));
            },
            child: CustomContainer2(
              Title: list1[0]["title"],
              Image_Url: list1[0]["images"],
              Price: list1[0]["price"],
              DiscountPrice: list1[0]["discount_price"],
            )),
        InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProductDetails(
                  product_detail_title: list1[1]["title"],
                  product_detail_image: list1[1]["images"],
                  product_detail_price: list1[1]["price"],
                  product_detail_discount_price: list1[1]["discount_price"],
                  product_detail_offer: list1[1]["offer"],
                  product_detail_descriptions: list1[1]["descriptions"],
                );
              }));
            },
            child: CustomContainer2(
                Title: list1[1]["title"],
                Image_Url: list1[1]["images"],
                Price: list1[1]["price"],
                DiscountPrice: list1[1]["discount_price"])),
        InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProductDetails(
                  product_detail_title: list1[2]["title"],
                  product_detail_image: list1[2]["images"],
                  product_detail_price: list1[2]["price"],
                  product_detail_discount_price: list1[2]["discount_price"],
                  product_detail_offer: list1[2]["offer"],
                  product_detail_descriptions: list1[0]["descriptions"],
                );
              }));
            },
            child: CustomContainer2(
                Title: list1[2]["title"],
                Image_Url: list1[2]["images"],
                Price: list1[2]["price"],
                DiscountPrice: list1[2]["discount_price"])),
        InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProductDetails(
                  product_detail_title: list1[3]["title"],
                  product_detail_image: list1[3]["images"],
                  product_detail_price: list1[3]["price"],
                  product_detail_discount_price: list1[3]["discount_price"],
                  product_detail_offer: list1[3]["offer"],
                  product_detail_descriptions: list1[0]["descriptions"],
                );
              }));
            },
            child: CustomContainer2(
                Title: list1[3]["title"],
                Image_Url: list1[3]["images"],
                Price: list1[3]["price"],
                DiscountPrice: list1[3]["discount_price"])),
      ],
    );
  }
}

class CustomContainer2 extends StatelessWidget {
  String Title;
  String Image_Url;
  String Price;
  String DiscountPrice;

  CustomContainer2(
      {this.Title, this.Image_Url, this.Price, this.DiscountPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 11),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 10,
                blurRadius: 10,
                offset: Offset(5, 5))
          ]),
      margin: EdgeInsets.all(20),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              child: Image.asset(
            Image_Url,
            fit: BoxFit.fitHeight,
          )),
          SizedBox(
            height: 10,
          ),
          Text(
            Title,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "\u20B9" + Price,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "\u20B9" + DiscountPrice,
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }
}
