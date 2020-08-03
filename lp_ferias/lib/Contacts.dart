import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';  

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  List<Contact> contacts = [];

  TextEditingController searchController = new TextEditingController();

 
  @override
  void initState(){
    super.initState();    
  }

  getContact(nome) async{

    if (await Permission.contacts.request().isGranted) {
        // Either the permission was already granted before or the user just granted it.
        List<Contact> _contacts = (await ContactsService.getContacts(query : nome)).toList(); 

        
        setState(() {
          contacts = _contacts;
        });

    }
    
  
  
  }

  Widget build(BuildContext context) {

    
    
    return Scaffold(
      body: SingleChildScrollView(
      child:Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                child:TextField(
                  onSubmitted: (value){
                    getContact(value);
                  },
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: 'Pesquisa',
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Theme.of(context).primaryColor
                      )
                    ),
                  prefixIcon: Icon(
                    Icons.search,
                    color:Theme.of(context).primaryColor
                  ),
                  ),
                ), 
              ),
              ListView.builder(
                
                shrinkWrap:true,
                itemCount: contacts.length,
                itemBuilder: (context,index)
                {
                  Contact contact = contacts[index];
                  return ListTile(
                    title: Text(contact.displayName),
                    subtitle: Text(
                      contact.phones.elementAt(0).value
                    ),
                    leading: (contact.avatar != null && contact.avatar.length > 0)?
                      CircleAvatar(
                        backgroundImage: MemoryImage(contact.avatar),
                      ):
                      CircleAvatar(
                        child:Text(contact.initials()) ,
                      )
                    
                  );
                }
              )
              
            ],
          ), 
        ),
      ),
      
      
    ),
    );
  }
}