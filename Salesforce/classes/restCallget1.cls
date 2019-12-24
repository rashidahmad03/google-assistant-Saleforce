@RestResource(urlMapping='/Dialogflowrestcontact')
global class restCallget1 {
    @HTTPGet
    global static string getContact(){
        
        List<Contact> con =[select LastName,FirstName,Phone,Email from Contact order by CreatedDate desc limit 5];
       if(con.size()>0){
       String s='You have recent '+con.size()+' Contact .These are the details .';
       for(Integer i=0;i<con.size();i++)
       {
            s+=' ' +(i+1) + '. '+con.get(i).LastName  +' ';
    }
           
        return s;
       }
        else
            return 'No Contact ';
	}
    
    @HttpPost
    global static String createContact()
    {
        String request = RestContext.request.requestBody.toString();
        Contact reqjson = (Contact)JSON.deserialize(request, Contact.class);
        insert reqjson;
        return 'Contact Successfully Inserted';
        
    }      
}