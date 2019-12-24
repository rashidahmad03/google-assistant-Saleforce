@RestResource(urlMapping='/Dialogflowresttask')
global class restCallgetTask {
    @HTTPGet
    global static string getTask(){
        
        List<Task> tas =[select Subject from Task order by Priority  limit 5];
          String s='You Have A '+tas.size()+' Tasks open . Here are your Tasks . ';
       for(Integer i=0;i<tas.size();i++)
       {
            s+=' ' +(i+1) + '. '+tas.get(i).Subject +' ';
    }
        return s;
	
    }
    @HttpPost
    global static String createTask()
    {
        String request = RestContext.request.requestBody.toString();
        Task reqjson = (Task)JSON.deserialize(request, Task.class);
        insert reqjson;
        return 'Task Successfully Saved';
        
    }      
}