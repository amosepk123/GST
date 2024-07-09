import 'package:flutter/material.dart';

class GST extends StatefulWidget {
  const GST({super.key});

  @override
  State<GST> createState() => _GSTState();
}

class _GSTState extends State<GST> {
  final TextEditingController _Ex_Rate =TextEditingController();
  final TextEditingController _Ex_GST =TextEditingController();
  final TextEditingController _Ex_Price =TextEditingController();
  final TextEditingController _Gst_Only =TextEditingController();



  void _Ex_calculateprice() {
    final double? Ex_Rate = double.tryParse(_Ex_Rate.text);
    final double? Ex_GST = double.tryParse(_Ex_GST.text);

   // String? _answer;
    if (Ex_Rate != null && Ex_GST != null) {
      final double total =(Ex_Rate * Ex_GST / 100)+ Ex_Rate;
      final double GST=(total-Ex_Rate);
      setState(() {
        _Ex_Price.text = total.toStringAsFixed(2);
        _Gst_Only.text=GST.toStringAsFixed(2);
      });
    }
  }
  final TextEditingController _In_Rate =TextEditingController();
  final TextEditingController _In_GST =TextEditingController();
  final TextEditingController _In_Price =TextEditingController();
  final TextEditingController _Total_In_original_Price =TextEditingController();


  void _In_calculateprice() {
    final double? In_Rate = double.tryParse(_In_Rate.text);
    final double? In_GST = double.tryParse(_In_GST.text);

    // String? _answer;
    if (In_Rate != null && In_GST != null) {
      final double total =((In_Rate * In_GST) / (100+In_GST));
      final double original=(In_Rate -total );
      setState(() {
        _In_Price.text = total.toStringAsFixed(2);

       _Total_In_original_Price.text=original.toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.calculate, size: 45,),
        title: Text("GST Calculator", style: TextStyle(fontSize: 30, color: Colors.white),),
      ),

      body: SingleChildScrollView(

        child: Column(
          children: [
            Divider(color: Colors.grey,),
            Text("Exclusive GST",style: TextStyle(fontSize: 30,color: Colors.lightBlue),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 420,
                  width: 400,
                  decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blueGrey,
                  ),
                    child: Column(
                  children: [
                  Row(
                  children: [
                    Container(
                    height: 180,
                    width: 180,
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Text(
                          "Rate",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _Ex_Rate,
                            decoration: InputDecoration(
                              hintText: "Enter your  amount",
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                    height: 180,
                    width: 180,
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Text(
                          "GST",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _Ex_GST,
                            decoration: InputDecoration(
                              hintText: "Enter your GST Percentage",
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ],
                ),
            ElevatedButton(
              onPressed: _Ex_calculateprice,
              child: Text("Calculate", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white,
                ),

              ),
            ),
            SizedBox(height: 15),
            Text("Total amount include GST",style: TextStyle(fontSize: 20,color: Colors.white),),
            Container(
              height: 50,
              width: 100,
              child: TextFormField(
                controller: _Ex_Price,
                readOnly: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
                    SizedBox(height: 15),
                    Text("GST",style: TextStyle(fontSize: 20,color: Colors.white),),
                    Container(
                      height: 50,
                      width: 100,
                      child: TextFormField(
                        controller: _Gst_Only,
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),

          ],
        ),
                  ),
                ),

            SizedBox(height: 10,),
            Text("Inclusive GST",style: TextStyle(fontSize: 30,color: Colors.lightBlue),),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 420,
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueGrey,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 180,
                              width: 180,
                              child: Column(
                                children: [
                                  SizedBox(height: 15),
                                  Text(
                                    "Rate",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: _In_Rate,
                                      decoration: InputDecoration(
                                        hintText: "Enter your  amount",
                                        border: OutlineInputBorder(),
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 30),
                            Container(
                              height: 180,
                              width: 180,
                              child: Column(
                                children: [
                                  SizedBox(height: 15),
                                  Text(
                                    "GST",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: _In_GST,
                                      decoration: InputDecoration(
                                        hintText: "Enter your GST Percentage",
                                        border: OutlineInputBorder(),
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: _In_calculateprice,
                          child: Text("Calculate", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white,
                          ),

                          ),
                        ),
                        SizedBox(height: 15),
                        Text("Original Amount",style: TextStyle(fontSize: 20,color: Colors.white),),
                        Container(
                          height: 50,
                          width: 100,
                          child: TextFormField(
                            controller: _In_Price,
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text("GST",style: TextStyle(fontSize: 20,color: Colors.white),),
                        Container(
                          height: 50,
                          width: 100,
                          child: TextFormField(
                            controller: _Total_In_original_Price,
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


