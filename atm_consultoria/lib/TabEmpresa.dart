import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  @override
  _TelaEmpresaState createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Empresa"),
        backgroundColor: Colors.red,
      ),
      body:SingleChildScrollView(
        child:Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset("images/detalhe_empresa.png"),
                    Padding(
                      padding: EdgeInsets.only(left:10),
                      child: Text(
                        "Sobre a empresa",
                        style: TextStyle(
                          fontSize:20,
                          color:Colors.deepOrange
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top:16),
                  child:Text(
                    " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dictum iaculis nunc non dictum. Quisque sollicitudin pellentesque diam id ullamcorper. Cras justo nibh, placerat non justo iaculis, pharetra tristique arcu. Ut ullamcorper purus at tempor sodales. Sed vehicula velit eu finibus mollis. Quisque eu orci non mauris congue scelerisque et sit amet turpis. In mollis lorem et lectus porta, et maximus risus facilisis. Integer auctor dictum cursus. In hac habitasse platea dictumst. Nulla quis mauris libero. Integer a orci a ipsum sodales dictum eget vitae mauris. Phasellus pretium, enim ut finibus ullamcorper, diam urna efficitur ex, eget finibus nisl enim vel arcu. Duis vel pulvinar urna. Praesent sodales hendrerit mollis."

                    "  Duis et dignissim erat, at pharetra dolor. In hac habitasse platea dictumst. Proin eu ornare risus, eu condimentum mi. Praesent et elit ultricies, accumsan ipsum at, blandit eros. In lobortis dolor magna, sit amet pulvinar orci accumsan id. Praesent et augue ipsum. Phasellus a augue consequat, posuere diam non, viverra purus."

                    "Duis suscipit ultricies finibus. Duis dignissim eget tortor sit amet ornare. Donec a neque consectetur lorem facilisis luctus nec ornare augue. Proin a ultrices augue. Donec et imperdiet quam. Aliquam eget mauris eget nisl fermentum aliquam. Ut finibus, justo et rhoncus dictum, nulla ante tincidunt dui, at rutrum tortor ipsum sit amet ante. Cras finibus dolor quis tincidunt sollicitudin. In tellus mauris, volutpat quis justo sit amet, molestie euismod libero. Curabitur mauris turpis, volutpat non dapibus sit amet, tempor porta turpis. "
                  )
                ),

            ],
        ),  
        )
        
      ),
    );
  }
}