@RestResource(urlMapping='/Dialogflow')
global class restCall {
    @HTTPPost
    global static void createRecords(){
        
        String request = RestContext.request.requestBody.toString();
        welcome reqjson = (welcome)JSON.deserialize(request, welcome.class);
        
        
        String JSONString = JSON.serialize(reqjson);
        System.debug('JSONString:'+JSONString);
        String sdd=request.substring(0, 300);
        Integer nam=sdd.indexOf('queryText');
        String pst=sdd.substring(nam);
        list<String> naam=pst.split('"');
        Account ac=new Account(name=naam[2]);
        System.debug('ac>>>'+ac);
        insert ac;
        
        reqjson.queryResult.fulfillmentText='hello account created';
        reqjson.queryResult.fulfillmentMessages[0].text.text[0]='hello account created';
        
        
        //  String repon =n.toString();
        RestContext.response.addHeader('Content-Type', 'application/json');
        RestContext.response.responseBody = Blob.valueOf(JSON.serialize(reqjson));
        
        
    }
    
}