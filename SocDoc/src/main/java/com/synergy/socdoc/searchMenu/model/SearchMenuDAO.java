package com.synergy.socdoc.searchMenu.model;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.json.XML;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.PharmacyVO;

@Repository
public class SearchMenuDAO implements InterSearchMenuDAO {

	@Autowired	
	private SqlSessionTemplate sqlsession;
		
	
	
	//병원 - 지도
	@Override
	public List<HpInfoVO> searchHospitalSelect(HashMap<String, String> paraMap) {
		List<HpInfoVO> hpMap = sqlsession.selectList("searchMenu.searchHospitalSelect",paraMap);
		return hpMap;
	}
	
	@Override
	public int getTotalCountMapHp(HashMap<String, String> paraMap) {
		int totalCount = sqlsession.selectOne("searchMenu.getTotalCountMapHp",paraMap);
		return totalCount;
	}
	
	@Override
	public List<HpInfoVO> mapHospitalListSearchWithPaging(HashMap<String, String> paraMap) {
		List<HpInfoVO> mapHpList = sqlsession.selectList("searchMenu.mapHospitalListSearchWithPaging",paraMap);
		return mapHpList;
	}

	
	//병원 - 일반
	@Override
	public int getTotalCountHp(HashMap<String, String> paraMap) {
		int totalCount = sqlsession.selectOne("searchMenu.getTotalCountHp",paraMap);
		return totalCount;
	}
	
	@Override
	public List<HpInfoVO> hospitalListSearchWithPaging(HashMap<String, String> paraMap) {
		List<HpInfoVO> hpList = sqlsession.selectList("searchMenu.hospitalListSearchWithPaging",paraMap);
		return hpList;
	}

	

	//약국 - 지도
	@Override
	public List<PharmacyVO> searchPharmacySelect() {
		List<PharmacyVO> phList = sqlsession.selectList("searchMenu.searchPharmacySelect");
		return phList;
	}

	@Override
	public int getTotalCountMapPh(HashMap<String, String> paraMap) {
		int totalCount = sqlsession.selectOne("searchMenu.getTotalCountMapPh",paraMap);
		return totalCount;
	}

	@Override
	public List<PharmacyVO> mapPharmacyListSearchWithPaging(HashMap<String, String> paraMap) {
		List<PharmacyVO> mapPhList = sqlsession.selectList("searchMenu.mapPharmacyListSearchWithPaging",paraMap);
		return mapPhList;
	}

	//약국 - 일반
	@Override
	public int getTotalCountPh(HashMap<String, String> paraMap) {
		int totalCount = sqlsession.selectOne("searchMenu.getTotalCountPh",paraMap);
		return totalCount;
	}

	@Override
	public List<PharmacyVO> pharmacyListSearchWithPaging(HashMap<String, String> paraMap) {
		List<PharmacyVO> phList = sqlsession.selectList("searchMenu.pharmacyListSearchWithPaging",paraMap);
		return phList;
	}

	
	
	
	
	
	// 민간 구급차 API
	private String apiKey = "s9xg9Bp9ErcnSizOyrS0DSPvXB%2B1rKUHXQLztWL6s3RshEh5dVwOutBsMoRcIUcTjHXGPFB%2F%2B2%2FoU1rkIYi8gA%3D%3D";

	@Override
	public HashMap<String,String> getAmList(HashMap<String,String> paraMap) {
		
		HashMap<String,String> amMap = new HashMap<>();
		
		String amList = "";
		try {
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/AmblInfoInqireService/getAmblListInfoInqire"); /* URL */

			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + apiKey); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
	        
			urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(paraMap.get("currentShowPageNo"), "UTF-8")); /* 페이지번호 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
	//		urlBuilder.append("&" + URLEncoder.encode("Q0", "UTF-8") + "=" + URLEncoder.encode(city, "UTF-8"));  //검색할 주소 범위의 시작 
			
			String city = paraMap.get("city");
					
			if(!"".equals(city)) {
				urlBuilder.append("&" + URLEncoder.encode("Q0", "UTF-8") + "=" + URLEncoder.encode(city, "UTF-8"));
			}
			
			URL url = new URL(urlBuilder.toString());
			
		//	System.out.println("URL : " + url);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");

			conn.setRequestProperty("Content-type", "application/json");
		//	System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			
			StringBuilder sb = new StringBuilder();
			String line;
			
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			
			rd.close();
			conn.disconnect();
		//	System.out.println("result in DAO class : "+sb.toString());
			amList = sb.toString();
			
			
			JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());	
		//	System.out.println("xmlJSONObj : " + xmlJSONObj);
			amList = xmlJSONObj.toString();
		//	System.out.println("xmlJSONObjString : " + amList);
			 
			JsonParser parser = new JsonParser();
			JsonElement el= parser.parse(amList);
			JsonObject body = el.getAsJsonObject().getAsJsonObject("response").getAsJsonObject("body");
			int totalCount = body.get("totalCount").getAsInt();
			JsonArray result = body.getAsJsonObject("items").getAsJsonArray("item");
			
			/*for(int i=0; i<result.size(); i++) {
				
				HashMap<String, String> amMap = new HashMap<>();
				
				String carSeq = result.get(i).getAsJsonObject().get("carSeq").getAsString();
				String dutyAddr = result.get(i).getAsJsonObject().get("dutyAddr").getAsString();
				String dutyName = result.get(i).getAsJsonObject().get("dutyName").getAsString();
				
				
			}*/
			
			System.out.println(result.get(0).getClass());
//			String strTotalCount = String.valueOf(totalCount);
			String strResult = result.toString();
			
			
			amMap.put("totalCount", String.valueOf(totalCount));
			amMap.put("strResult", strResult);
			
			
			return amMap;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	
	
	
	

	@Override
	public List<HashMap<String, String>> getAmListExcel(String city) {		

		List<HashMap<String,String>> amList = new ArrayList<>();
		
		
		try {
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/AmblInfoInqireService/getAmblListInfoInqire"); 

			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + apiKey); 
	        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8"));		
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10000", "UTF-8"));
					 
			if(!"".equals(city)) {
				urlBuilder.append("&" + URLEncoder.encode("Q0", "UTF-8") + "=" + URLEncoder.encode(city, "UTF-8"));
			}
			
			URL url = new URL(urlBuilder.toString());
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");

			conn.setRequestProperty("Content-type", "application/json");
			BufferedReader rd;
			
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			
			StringBuilder sb = new StringBuilder();
			String line;
			
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			
			rd.close();
			conn.disconnect();
			String itemStr = sb.toString();
			
			
			JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());	
			itemStr = xmlJSONObj.toString();
			 
			JsonParser parser = new JsonParser();
			JsonElement el= parser.parse(itemStr);
			JsonObject body = el.getAsJsonObject().getAsJsonObject("response").getAsJsonObject("body");
			JsonArray result = body.getAsJsonObject("items").getAsJsonArray("item");
			
			String strResult = result.toString();
			
			for(int i=0; i<result.size(); i++) {
				
				HashMap<String, String> amMap = new HashMap<>();
				
				String carSeq = result.get(i).getAsJsonObject().get("carSeq").getAsString();
				String dutyAddr = result.get(i).getAsJsonObject().get("dutyAddr").getAsString();
				String dutyName = result.get(i).getAsJsonObject().get("dutyName").getAsString();
				
				amMap.put("carSeq", carSeq);
				amMap.put("dutyAddr", dutyAddr);
				amMap.put("dutyName", dutyName);
				
				amList.add(amMap);
			}
			
			return amList;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
		
		
	}


		

}
