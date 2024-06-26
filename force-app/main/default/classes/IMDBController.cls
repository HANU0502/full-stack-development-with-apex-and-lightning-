public class IMDBController {
	
    @AuraEnabled
    public static string getMovies(String searchName){
        //1. Create HttpRequest
        HttpRequest request = new HttpRequest();
       // request.setEndpoint('https://api.collectapi.com/imdb/imdbSearchByName?query='+searchName);
         request.setEndpoint('callout:IMDB/imdb/imdbSearchByName?query='+searchName);
        request.setMethod('GET');
        
        //2.1. Prepare Authorization Header
        //String username = '7IWiULUGQWc4QG77D4XiDR';
        //String password = '{SECRET_PLACEHOLDER}';
        //String authHeader = 'apikey '+username+':'+password;
        //request.setHeader('Authorization', authHeader);
        
        //2.2. Alternatively, you can set the authorization directly in the request
        //request.setHeader('Authorization', 'apikey 7IWiULUGQWc4QG77D4XiDR:6h6vGEpSFnxFbvZVcEcnT3');
        
        //3. Create Http instance and send the request
        Http http = new Http();
        HttpResponse response = http.send(request);
        
        //4. Process the response
        if(response.getStatusCode() == 200) {
            String jsonResponse = response.getBody();
            // System.debug('jsonResponse: ' + jsonResponse);
            return response.getBody();
        } else {
            return 'Error Code : '+ response.getStatusCode();
        }
    }
    
    @AuraEnabled
    public static string getMoviesDetails(String movieId){
        //1. Create HttpRequest
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:IMDB/imdb/imdbSearchById?movieId'+movieId);
        request.setMethod('GET');
        
        //2.1. Prepare Authorization Header
        //String username = '7IWiULUGQWc4QG77D4XiDR';
        //String password = '{SECRET_PLACEHOLDER}';
        //String authHeader = 'apikey '+username+':'+password;
        //request.setHeader('Authorization', authHeader);
        
        //2.2. Alternatively, you can set the authorization directly in the request
        //request.setHeader('Authorization', 'apikey 7IWiULUGQWc4QG77D4XiDR:6h6vGEpSFnxFbvZVcEcnT3');
        
        //3. Create Http instance and send the request
        Http http = new Http();
        HttpResponse response = http.send(request);
        
        //4. Process the response
        if(response.getStatusCode() == 200) {
            String jsonResponse = response.getBody();
            // System.debug('jsonResponse: ' + jsonResponse);
            return response.getBody();
        } else {
            return 'Error Code : '+ response.getStatusCode();
        }
    }
    
    
}