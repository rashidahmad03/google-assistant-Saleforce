@RestResource(urlMapping='/Dialogflowrest')
global class restCallget {
    @HTTPGet
    global static string getaccount(){
        
        List<Account> acc=[select Name from account order by CreatedDate desc limit 5 ];
        if(acc.size()>0){
            String s='You have recent '+acc.size()+' account  .These are the details .';
            for(Integer i=0;i<acc.size();i++)
            {
                s+=' ' +(i+1) + '. '+acc.get(i).Name  +' ';
            }
            return s;
        }
        else
            return ' No Account in Salesforce';
        
    }
    @HttpPost
    global static String createAccount()
    {
        String request = RestContext.request.requestBody.toString();
        Account reqjson = (Account)JSON.deserialize(request, Account.class);
        insert reqjson;
        return 'Account Is Created';
        
    }   
    
    
    
    
    
}