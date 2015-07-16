package com.simularte.service;

import org.scribe.builder.ServiceBuilder;
import org.scribe.model.OAuthRequest;
import org.scribe.model.Response;
import org.scribe.model.Token;
import org.scribe.model.Verb;
import org.scribe.oauth.OAuthService;
import org.springframework.stereotype.Service;

import com.simularte.bean.OficinaBean;
import com.simularte.util.TwoStepOAuth;

@Service
public class YelpAPIServiceImpl implements YelpAPIService{

	//Yelp
	private static final String API_HOST = "api.yelp.com";
	//private static final String DEFAULT_TERM = "dinner";
	//private static final String DEFAULT_LOCATION = "San Francisco, CA";
	private static final String DEFAULT_CLL = "40.711617,-73.94161";
	private static final int SEARCH_LIMIT = 20;
	private static final String SEARCH_PATH = "/v2/search";
	//private static final String BUSINESS_PATH = "/v2/business";
	
	//OAuth
	private static final String CONSUMER_KEY = "-LaXwovLBSqMw4cMkcsSmA";
	private static final String CONSUMER_SECRET = "AdRr6LG2MedgKrE3aCscH2vsReY";
	private static final String TOKEN = "VIdNkhuUM-cyh5Oox_BRKo-AL4T_EALD";
	private static final String TOKEN_SECRET = "r4pvmgebSAnMqK2Mu8792WwDFrY";
	
	private OAuthService service;
	private Token accessToken;
	
	
	//Creates and sends a request to the Search API by term and location, JSON response
	public String searchForBusinessesByLocation(String term, String location, OficinaBean oficina) {
		System.out.println(oficina.getCiudad());
		//Setup the Yelp API OAuth credentials	
		service = new ServiceBuilder().provider(TwoStepOAuth.class).apiKey(CONSUMER_KEY).apiSecret(CONSUMER_SECRET).build();
		accessToken = new Token(TOKEN, TOKEN_SECRET);
		
		OAuthRequest request = createOAuthRequest(SEARCH_PATH);
		
		request.addQuerystringParameter("term", term);
		request.addQuerystringParameter("sort", "0");
		request.addQuerystringParameter("location", location);
		//request.addQuerystringParameter("cll", DEFAULT_CLL);
	    request.addQuerystringParameter("limit", String.valueOf(SEARCH_LIMIT));
	    request.addQuerystringParameter("radius_filter", oficina.getCiudad());
	    
		return sendRequestAndGetResponse(request);
	}
	
	
	
	//Creates and returns an {@link OAuthRequest} based on the API endpoint specified
	private OAuthRequest createOAuthRequest(String path){
		OAuthRequest request = new OAuthRequest(Verb.GET, "http://" + API_HOST + path);
		
		return request;
	}
	//Sends an {@link OAuthRequest} and returns the {@link Response} body
	private String sendRequestAndGetResponse(OAuthRequest request) {
		System.out.println("Querying " + request.getCompleteUrl() + " ...");
		this.service.signRequest(this.accessToken, request);
		Response response = request.send();
		
		return response.getBody();
	}
}
