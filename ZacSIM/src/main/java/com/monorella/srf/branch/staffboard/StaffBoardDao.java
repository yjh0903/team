package com.monorella.srf.branch.staffboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.monorella.srf.branch.dto.StaffBoard;
import com.monorella.srf.branch.dto.StaffBoardReply;
@Repository
public class StaffBoardDao {
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	 // 댓글 목록
  
    public List<StaffBoardReply> selectStaffBoardReplyList(int staffboard_no) {
        return sqlSessionTemplate.selectList("com.monorella.srf.branch.staffboard.StaffBoardMapper.selectStaffBoardReplyList", staffboard_no);
    }
    // 댓글 작성
    public void insertStaffBoardReply(StaffBoardReply staffboardreply){
    	System.out.println("StaffBoardDao->insertStaffBoardReply()->"+staffboardreply);
		sqlSessionTemplate.insert("com.monorella.srf.branch.staffboard.StaffBoardMapper.insertStaffBoardReply", staffboardreply);
	}
   // 게시판에 댓글 수 보이게 
    public int totalStaffBoardReply(int staffboard_no){
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.staffboard.StaffBoardMapper.totalStaffBoardReply", staffboard_no);
	}
	

	
	 //공지사항 검색 메서드
	 public List<StaffBoard> searchStaffBoard(String so, String sv){
		 System.out.println("StaffBoardDao->searchStaffBoard ->so:" +so
				 +"sv:" + sv);
			Map<String, String> map = new HashMap<String, String>();
			map.put("so", so);
			map.put("sv", sv);
			List<StaffBoard> staffboardList = null;
			staffboardList = sqlSessionTemplate.selectList("com.monorella.srf.branch.staffboard.StaffBoardMapper.searchStaffBoard", map);
			return staffboardList;
		}
	
	// 공지사항 삭제 메서드
    public int deleteStaffBoard(int staffboard_no, String staffboard_pw) {
    	StaffBoard staffboard = new StaffBoard();
    	staffboard.setStaffboard_no(staffboard_no);
    	staffboard.setStaffboard_pw(staffboard_pw);
        return sqlSessionTemplate.delete("com.monorella.srf.branch.staffboard.StaffBoardMapper.deleteStaffBoard",staffboard);
    }
	
	// 글수정 메서드 
			public int modifyStaffBoard(StaffBoard staffboard) {
				System.out.println("modifyStaffBoard dao 확인");
		        return sqlSessionTemplate.update("com.monorella.srf.branch.staffboard.StaffBoardMapper.modifyStaffBoard"
												,staffboard);
		    }
	

	// 한개의 게시글 내용보기
    public StaffBoard getStaffBoard(int staffboard_no) {
    	System.out.println("StaffBoardDao->getStaffBoard -> staffboard_title:" + staffboard_no);
        return sqlSessionTemplate.selectOne("com.monorella.srf.branch.staffboard.StaffBoardMapper.getStaffBoard",staffboard_no);
    }
 
	
	// 회원리스트 메서드
	public List<StaffBoard> selectStaffBoardList(int currentPage, int pagePerRow, String branch_owner_cd) {
		System.out.println("StaffBoardDao-> selectStaffBoardList-> currentPage: " + currentPage 
				+"pagePerRow: "+pagePerRow);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", (currentPage-1)*pagePerRow);
		map.put("pagePerRow", pagePerRow);
		map.put("branch_owner_cd", branch_owner_cd);
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.staffboard.StaffBoardMapper.selectStaffBoardList", map);
	}
	/*// 공지사항 목록 메서드
		public List<StaffBoard> getStaffBoardList(int currentPage, int pagePerRow){
			System.out.println("StaffBoardDao-> getStaffBoardList-> currentPage: " + currentPage 
					+"pagePerRow: "+pagePerRow);
			Map<String, Integer> map = new HashMap<String, Integer>();
			System.out.println("StaffBoardDao-> getStaffBoardList-> map: " + map);
			map.put("beginRow",(currentPage-1)*10);
			map.put("pagePerRow",pagePerRow);
			return sqlSessionTemplate.selectList("com.monorella.srf.branch.staffboard.StaffBoardMapper.getStaffBoardList"
												, map);
			
		}*/
		
		//전체 공지사항의 수를 구하는 메서드
		public int getStaffBoardCount(){
			return sqlSessionTemplate.selectOne("com.monorella.srf.branch.staffboard.StaffBoardMapper.getStaffBoardCount");
		}

	 // 글쓰기 메서드
    public int insertStaffBoard(StaffBoard staffboard) {
        return sqlSessionTemplate.insert("com.monorella.srf.branch.staffboard.StaffBoardMapper.insertStaffBoard"
        								, staffboard);
    }
}
