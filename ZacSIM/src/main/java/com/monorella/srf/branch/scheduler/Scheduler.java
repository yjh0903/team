package com.monorella.srf.branch.scheduler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.monorella.srf.branch.dto.Member;
import com.monorella.srf.branch.dto.RoomDashBoard;
import com.monorella.srf.branch.room.RoomDao;

@Component
public class Scheduler {
	@Autowired
	private SchedulerDao schedulerDao;
	@Autowired
	private RoomDao roomDao;
	
	@Scheduled(cron = "0 18 14 * * *")
	public void cronTest(){
		try{
			System.out.println("만료일처리 실행");
			List<Member> memberlist = schedulerDao.selectEndDate();
			System.out.println(memberlist);
			
			if(memberlist.isEmpty()){
				System.out.println("기간 만료 회원 존재하지 않습니다." + memberlist.isEmpty());
			}else{
				System.out.println("기간 만료 회원 존재합니다. " + memberlist.isEmpty());
				for(Member m : memberlist){
					schedulerDao.modifyEndDateMember(m.getMember_cd());
					RoomDashBoard roomDashboard = roomDao.selectRoomDashBoard(m.getRoom_cd());
					roomDao.modifyRoomDashBoard(roomDashboard);
					roomDao.modifySeatRoomDashBoard(roomDashboard);
				}
				System.out.println("기간 만료일 회원, 좌석, 현황 수정");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}