
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State <HomeScreen>{

  @override
  Widget build(BuildContext context) {
    final _heigth = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;




    return Scaffold(
        body:  LayoutBuilder(builder: (context,contrains){
          return Container(
            alignment: Alignment.center,
            width: _width,
            height: _heigth,
            color: Color(0xFF050638),
            padding: EdgeInsets.only(
                top: _heigth*0.034,
                bottom: _heigth*0.02,
                left: _heigth*0.01,
                right: _heigth*0.01
            ),
            child: ListView(
                children: <Widget>[
                  Card(
                    color: Color(0xFF050638),
                    elevation: 0,
                    child: Text('Why Data Security?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                 Divider(),
                 Card(
                   color: Color(0xFF050638),
                   elevation: 3,
                   child: ListTile(
                     leading: CircleAvatar(
                       backgroundImage: NetworkImage('https://scontent.fbkk10-1.fna.fbcdn.net/v/t31.0-8/29064575_1775509835821857_2691846861250441171_o.jpg?_nc_cat=103&ccb=2&_nc_sid=174925&_nc_eui2=AeG0NlTVmorwfwPuegP190J2Is8f7qCZBmUizx_uoJkGZVMm89o185dbswustnFSmJZTRCwq8PxGfn7eq_DNPTsh&_nc_ohc=8QzZmfMJLzMAX95pFEf&_nc_ht=scontent.fbkk10-1.fna&oh=497eb3554db7b1feeb89238a04f5d630&oe=5FBFB65B'),
                     ),
                     title: Text('   Organizations around the globe are investing heavily in information technology (IT) cyber security capabilities to protect their critical assets. Whether an enterprise needs to protect a brand, intellectual capital, and customer information or provide controls for critical infrastructure, the means for incident detection and response to protecting organizational interests have three common elements: people, processes, and technology.',
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 18,
                     ),
                     ),
                   )
                 ),
                  Divider(),
                  Card(
                    color: Color(0xFF050638),
                    elevation: 0,
                    child: Text('Data Security Solutions?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  Divider(),
                  Card(
                      color: Color(0xFF050638),
                      elevation: 3,
                      child: ListTile(
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage('https://scontent.fbkk10-1.fna.fbcdn.net/v/t1.0-9/67733312_2292819057498143_1371957969050140672_o.jpg?_nc_cat=101&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeFelD_XZkCFP0krv02tIQQic0w-JOwPV51zTD4k7A9Xnef_3yGankXSgO3JOFeS5Uq_E4dMBge2QZXjfFtmtkHq&_nc_ohc=ySeRgOhN-b0AX8r2Qzc&_nc_ht=scontent.fbkk10-1.fna&oh=151977a2b696ef8f344b9722b102e556&oe=5FC0DCFC'),
                        ),
                        title: Text('Micro Focus drives leadership in data security solutions with over 80 patents and 51 years of expertise. With advanced data encryption, tokenization, and key management to protect data across applications, transactions, storage, and big data platforms, big data solutions, Micro Focus simplifies the protection of sensitive data in even the most complex use cases.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      )
                  ),
                  Divider(),
                  InkWell(
                    onTap: ()=> launch('https://www.microfocus.com/en-us/assets/security/cloud-data-security'),

                    child: Card(
                      color: Color(0xFF050638),
                      elevation: 0,
                      child: Text('Cloud data security',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline
                        ),),
                    ),
                  ),
                  Card(
                    color: Color(0xFF050638),
                    elevation: 0,
                    child: Text('Protection platform that allows you to move to the cloud securely while protecting data in cloud applications.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,

                      ),),

                  ),
                  Divider(),
                  InkWell(
                    onTap: ()=> launch('https://www.microfocus.com/en-us/products/voltage-data-encryption-security/overview'),

                    child: Card(
                      color: Color(0xFF050638),
                      elevation: 0,
                      child: Text('Data encryption',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
                        ),),
                    ),
                  ),
                  Card(
                    color: Color(0xFF050638),
                    elevation: 0,
                    child: Text(' Data-centric and tokenization security solutions that protect data across enterprise, cloud, mobile and big data environments',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,

                      ),),

                  ),
                  Divider(),
                  InkWell(
                    onTap: ()=> launch('https://www.microfocus.com/en-us/assets/security/cloud-data-security'),

                    child: Card(
                      color: Color(0xFF050638),
                      elevation: 0,
                      child: Text('Hardware security module ',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
                        ),),
                    ),
                  ),
                  Card(
                    color: Color(0xFF050638),
                    elevation: 0,
                    child: Text('Hardware security module that guards financial data and meets industry security and compliance requirements.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,

                      ),),

                  ),
                  Divider(),



                ],)
          );

        }
        )

    );

  }
}