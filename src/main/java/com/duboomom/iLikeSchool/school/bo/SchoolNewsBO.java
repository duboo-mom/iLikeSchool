package com.duboomom.iLikeSchool.school.bo;

import java.net.URI;
import java.nio.charset.Charset;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class SchoolNewsBO {

	@Autowired
	private RestTemplate restTemplate;

	public String requestNews(String schoolName) {
		
		String CLIENT_ID = "dP0CiUTD_Sn8Xcpon07Y";
		String CLIENT_SECRET = "zXT3swjwZA";
		
		URI uri = UriComponentsBuilder
				.fromUriString("https://openapi.naver.com")
				.path("/v1/search/news.json")
				.queryParam("query", schoolName)
				.queryParam("display", 5)
				.encode(Charset.forName("UTF-8"))
				.build()
				.toUri();
		
		 RequestEntity<Void> req = RequestEntity
	                .get(uri)
	                .header("X-Naver-Client-Id", CLIENT_ID)
	                .header("X-Naver-Client-Secret", CLIENT_SECRET)
	                .build();
		
		 ResponseEntity<String> result = restTemplate.exchange(req, String.class);

		 return result.getBody();
		
	}
	
}
