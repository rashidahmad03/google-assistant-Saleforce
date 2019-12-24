@RestResource(urlMapping='/Dialogflowrestcase')
global class restCallget2 {
    @HTTPGet
    global static string getCase(){
        
        List<Case> con =[select CaseNumber,Status,Subject,Priority from Case  where Status!='Closed' order by CreatedDate desc limit 5];
        if(con.size()>0){
       String s='You have '+con.size()+' Cases assigned to you .These are the details .';
       for(Integer i=0;i<con.size();i++)
       {
            s+=' ' +(i+1) + '.'+con.get(i).Subject +' with  '+con.get(i).Priority;
       }
         return s;
        }
        else
            return 'You don\'t Have any Case';
       
       
	
    }
    @HttpPost
    global static String createCase()
    {
        String request = RestContext.request.requestBody.toString();
        Case reqjson = (Case)JSON.deserialize(request, Case.class);
        insert reqjson;
        return 'Case Successfully Inserted';
        
    }      
}