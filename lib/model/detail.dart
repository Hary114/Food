import 'package:flutter/material.dart';

class Detail extends StatelessWidget {

  static const routeName = '/Detail';
  final String title = 'FOOD';
  final String description =
  '''
 Daging sapi adalah daging ketiga yang paling banyak dikonsumsi di dunia, terhitung sekitar 25% dari produksi daging di seluruh dunia, setelah daging babi dan unggas masing-masing 38% dan 30%. [5] Dalam jumlah absolut, Amerika Serikat, Brasil , dan Republik Rakyat Tiongkok adalah tiga konsumen daging sapi terbesar di dunia; Uruguay, bagaimanapun, memiliki konsumsi daging sapi dan daging sapi tertinggi per kapita, diikuti oleh Argentina dan Brasil.
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Food And Beverage',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.greenAccent
        ),),
          ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/food.png',
            height: 250.0,
            width: 412.0,
            fit: BoxFit.fill,
          ),
          Container(
            height: 15.0,
          ),
          Row(
            children:  [
              Container(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,                
                children:  [                  
                  Text(
                    this.title,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ],
              ),            
            ],
          ),          
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              this.description,
              style: TextStyle(
                fontSize: 18.0, 
              ),
              softWrap: true,
            ),
          ),
          
            
        ],
      ),
    );
  }
}
