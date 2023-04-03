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

import com.duboomom.iLikeSchool.school.model.SearchSchool;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class SearchSchoolBO {

	@Autowired
	private RestTemplate restTemplate;
	
	public List<SearchSchool> requestSchoolName(String gubun, String region, String searchWord) throws JsonMappingException, JsonProcessingException {
		
		String API_KEY = "e7c93a5af156237e1c0929cba3a27347";
		
		URI uri = UriComponentsBuilder
				.fromUriString("http://www.career.go.kr/cnet/openapi")
				.path("/getOpenApi.json")
				.queryParam("apiKey", API_KEY)
				.queryParam("svcType", "api")
				.queryParam("svcCode", "SCHOOL")
				.queryParam("contentType", "json")
				.queryParam("gubun", gubun)
				.queryParam("region", region)
				.queryParam("thisPage", 1)
				.queryParam("perPage", 10)
				.queryParam("searchSchulNm", searchWord)
				.encode(Charset.forName("UTF-8"))
				.build()
				.toUri();
		
		RequestEntity<Void> req = RequestEntity
	                .get(uri)
	                .build();
		
		ResponseEntity<String> result = restTemplate.exchange(req, String.class);

		// api 호출해서 받은 result를 JsonString으로
		String resultBody = result.getBody();
		
		// jackscon objectmapper 객체 생성
		ObjectMapper objectMapper = new ObjectMapper();
		
		// resultBody에서 items에 해당하는 것만 빼오기
		Map<String, Object> jsonMap = objectMapper.readValue(resultBody, new TypeReference<Map<String, Object>>() {});
		
		// 내가 만든 model 객체 newsListnewsList 
		Map<String, Object> contentMap = (Map<String, Object>) jsonMap.get("dataSearch");
		List<SearchSchool> searchSchoolList = (List<SearchSchool>) contentMap.get("content");
		
		return searchSchoolList;
		
	}
}
