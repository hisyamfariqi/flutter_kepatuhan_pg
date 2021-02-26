import 'package:flutter/material.dart';

class ContactBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      child: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.black,
            width: 1,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Column(
                    children: <Widget>[
                      Text(
                        "Kontak Informasi",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        "Good Corporate Governance",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Departemen TKP & Managemen Risiko",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Wrap(
                        children: [
                          Icon(
                            Icons.phone,
                            size: 12,
                          ),
                          Text(
                            "  Phone GCG: 2895, 2874",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Wrap(
                        children: [
                          Icon(
                            Icons.phone,
                            size: 12,
                          ),
                          Text(
                            "  Phone MR: 8424, 2814",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.person,
                    size: size.height * 0.135,
                  )
                ],
              ),
            ],
          )),
    );
  }
}
