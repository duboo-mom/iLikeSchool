package com.duboomom.iLikeSchool.school.bo;

import java.net.URI;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.duboomom.iLikeSchool.school.model.SchoolNews;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class SchoolNewsBO {

	@Autowired
	private RestTemplate restTemplate;

	public List<SchoolNews> requestNews(String schoolName) throws JsonMappingException, JsonProcessingException {
		
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

		// api 호출해서 받은 result를 JsonString으로
		String resultBody = result.getBody();
		
		// jackscon objectmapper 객체 생성
		ObjectMapper objectMapper = new ObjectMapper();
		
		// resultBody에서 items에 해당하는 것만 빼오기
		Map<String, Object> jsonMap = objectMapper.readValue(resultBody, new TypeReference<Map<String, Object>>() {});
		
		// 내가 만든 model 객체 SchoolNews 
		List<SchoolNews> newsList = (List<SchoolNews>) jsonMap.get("items");
		
		return newsList;
		
	}
	
}
