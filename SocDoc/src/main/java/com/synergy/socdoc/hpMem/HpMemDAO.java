package com.synergy.socdoc.hpMem;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.synergy.socdoc.member.HpInfoVO;
import com.synergy.socdoc.member.HpReviewVO;

@Repository
public class HpMemDAO implements InterHpMemDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public HpInfoVO getHpInfo(String hpSeq) {
		HpInfoVO hpInfo = sqlsession.selectOne("hpMem.getHpInfo", hpSeq);
		return hpInfo;
	}

	// 업데이트 목록 가져오기 
	@Override
	public List<HpInfoVO> getInfoUpdateList(HashMap paraMap) {
		List<HpInfoVO> hpInfoList = sqlsession.selectList("hpMem.getInfoUpdateList", paraMap);
		System.out.println("데이터 가져옴! ");
		System.out.println("hpInfoList 크기 : " + hpInfoList.size());
		return hpInfoList;
	}

	// 병원 상세 정보 디테일 가져오기
	@Override
	public HpInfoVO getHpInfoDetail(String submitId) {
		HpInfoVO hpInfoDetail = sqlsession.selectOne("hpMem.getHpInfoDetail", submitId);
		
		return hpInfoDetail;
	}

	// 병원의 영업시간 가져오기
	@Override
	public List<HashMap<String, String>> getOpeningHours(String hpSeq) {
		List<HashMap<String, String>> openingHours = sqlsession.selectList("hpMem.getOpeningHours", hpSeq);
		return openingHours;
	}

	// 신청테이블에서 영업시간 가져오기
	@Override
	public List<HashMap<String, String>> getScheduleTbl(String submitId) {
		List<HashMap<String, String>> scheduleTbl = sqlsession.selectList("hpMem.getScheduleTbl", submitId);
		System.out.println(scheduleTbl.size());
		return scheduleTbl;
	}

	// 병원의 후기 리스트 가져오기
	@Override
	public List<HashMap<String, String>> getRecentReviews(String hpSeq) {
		List<HashMap<String, String>> reviewList = sqlsession.selectList("hpMem.getRecentReviews", hpSeq);
		return reviewList;
	}

	// 병원 방문자 목록 가져오기
	@Override
	public List<HashMap<String, String>> getVisitors(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> visitorsList = sqlsession.selectList("hpMem.getVisitors", paraMap);
		return visitorsList;
	}

	@Override
	public int getNumOfVisitors(HashMap<String, String> paraMap) {
		int numOfVisitors = sqlsession.selectOne("hpMem.getNumOfVisitors", paraMap);
		return numOfVisitors;
	}
	
	// 병원 상세정보 신청 삽입하기
	@Override
	public int submitInfo(HpInfoVO hpInfoVO) {
		int result = sqlsession.insert("hpMem.submitInfo", hpInfoVO);
		return result;
	}

	// 병원 오픈시간 신청 삽입하기
	@Override
	public int submitSchedule(List<HashMap<String, String>> scheduleList) {
		int result = 0;
		
		for(int i=0; i<scheduleList.size(); i++) {	
			result += sqlsession.insert("hpMem.submitSchedule", scheduleList.get(i));
		};
		
		return result;
	}

	// JOIN 없는 특정 테이블 행의 총 개수 가져오기 
	@Override
	public int getNumOfItems(HashMap<String, String> paraMap) {
		int num = sqlsession.selectOne("hpMem.getNumOfItems", paraMap);
		return num;
	}

	// 병원 리뷰 목록 가져오기
	@Override
	public List<HpReviewVO> getHpReviews(HashMap<String, String> paraMap) {
		List<HpReviewVO> reviewList = sqlsession.selectList("hpMem.getHpReviews", paraMap);
		return reviewList;
	}

	// 방문예정자 목록 가져오기
	@Override
	public List<HashMap<String, String>> getVisitorsList(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> visitorsList = sqlsession.selectList("hpMem.getVisitorsList", paraMap);
		System.out.println("DAO에서 : " + visitorsList.size());
		return visitorsList;
	}

}