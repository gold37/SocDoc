package com.synergy.socdoc.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.synergy.socdoc.member.FaqBoardVO;
import com.synergy.socdoc.member.HealthInfoVO;
import com.synergy.socdoc.member.HpMemberVO;
import com.synergy.socdoc.member.HpReviewVO;
import com.synergy.socdoc.member.MemberVO;
import com.synergy.socdoc.member.NoticeVO;
import com.synergy.socdoc.member.QnaBoardVO;

@Component
@Service
public class AdminService implements InterAdminService {
	
	@Autowired
	private InterAdminDAO dao;
	
	@Override
	public HashMap<String, List<MemberVO>> selectMemberList() {
		List<MemberVO> membervoList = dao.selectMemberList();
		
		HashMap<String, List<MemberVO>> map = new HashMap<>();
		map.put("membervoList", membervoList);
		
		return map;
	}

	// 문의관리 목록 불러오기
	@Override
	public HashMap<String, List<QnaBoardVO>> selectQnAList() {
		List<QnaBoardVO> qnavoList = dao.selectQnAList();
		
		HashMap<String, List<QnaBoardVO>> map = new HashMap<>();
		map.put("qnavoList", qnavoList);
		
		return map;
	}

	// 공지사항 글 조회
	@Override
	public NoticeVO getView(String seq) {
		NoticeVO noticevo = dao.getView(seq);
		return noticevo;
	}
	
	// 회원관리 총 회원 수 구하기
	@Override
	public int getTotalCount(HashMap<String, String> paraMap) {
		int totalCount = dao.getTotalCount(paraMap);
		return totalCount;
	}

	// 회원관리 페이징 한 글목록 가져오기
	@Override
	public List<MemberVO> memberListSearchWithPaging(HashMap<String, String> paraMap) {
		List<MemberVO> memberList = dao.memberListSearchWithPaging(paraMap);
		return memberList;
	}

	// 공지사항 총 게시물 건수 구하기
	@Override
	public int noticeTotalCount(HashMap<String, String> paraMap) {
		int totalCount = dao.noticeTotalCount(paraMap);
		return totalCount;
	}
	// 공지사항 글 목록 (페이징처리)
	@Override
	public List<NoticeVO> noticeListPaging(HashMap<String, String> paraMap) {
		List<NoticeVO> noticeList = dao.noticeListPaging(paraMap);
		return noticeList;
	}

	// 건강정보 총 게시물 건수 구하기
	@Override
	public int healthInfoCount(HashMap<String, String> paraMap) {
		int totalCount = dao.healthInfoCount(paraMap);
		return totalCount;
	}
	// 건강정보 글 목록 (페이징처리)
	@Override
	public List<HealthInfoVO> healthInfoPaging(HashMap<String, String> paraMap) {
		List<HealthInfoVO> healthInfoList = dao.healthInfoPaging(paraMap);
		return healthInfoList;
	}
	
	// faq 목록 불러오기
	@Override
	public HashMap<String, List<FaqBoardVO>> selectfaqList() {
		List<FaqBoardVO> faqvoList = dao.selectfaqList();
		
		HashMap<String, List<FaqBoardVO>> map = new HashMap<>();
		map.put("faqvoList", faqvoList);
		
		return map;
	}

	
	// 병원회원관리 총 회원 수 구하기
	@Override
	public int hpMemberCount(HashMap<String, String> paraMap) {
		int totalCount = dao.hpMemberCount(paraMap);
		return totalCount;
	}
	// 병원회원 목록 (페이징처리)
	@Override
	public List<HpMemberVO> hpmemberListPaging(HashMap<String, String> paraMap) {
		List<HpMemberVO> hospitalList = dao.hpmemberListPaging(paraMap);
		return hospitalList;
	}
	

	// 병원(정보)등록 총 게시물 건수 구하기
	@Override
	public int hpInfoCount(HashMap<String, String> paraMap) {
		int totalCount = dao.hpInfoCount(paraMap);
		return totalCount;
	}
	// 병원등록 목록 (페이징처리)
	@Override
	public List<HpMemberVO> hpInfoListPaging(HashMap<String, String> paraMap) {
		List<HpMemberVO> hpInfoList = dao.hpInfoListPaging(paraMap);
		return hpInfoList;
	}

	
	// 문의관리 총 게시물 건수 구하기
	@Override
	public int qnaListCount(HashMap<String, String> paraMap) {
		int totalCount = dao.qnaListCount(paraMap);
		return totalCount;
	}
	// 문의관리 글 목록 (페이징처리)
	@Override
	public List<QnaBoardVO> qnaListPaging(HashMap<String, String> paraMap) {
		List<QnaBoardVO> qnavoList = dao.qnaListPaging(paraMap);
		return qnavoList;
	}

	
	// QnA 글 조회
	@Override
	public QnaBoardVO getQnaView(String qnaSeq) {
		QnaBoardVO qnavo = dao.getQnaView(qnaSeq);
		return qnavo;
	}

	
	// 후기관리 총 게시물 건수 구하기
	@Override
	public int reviewTotalCount(HashMap<String, String> paraMap) {
		int totalCount = dao.reviewTotalCount(paraMap);
		return totalCount;
	}
	// 후기관리 글 목록 (페이징처리)
	@Override
	public List<HpReviewVO> reviewListPaging(HashMap<String, String> paraMap) {
		List<HpReviewVO> reviewvoList = dao.reviewListPaging(paraMap);
		return reviewvoList;
	}



	
	
	
}
