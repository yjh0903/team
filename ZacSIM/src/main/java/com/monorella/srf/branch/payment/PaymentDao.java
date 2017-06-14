package com.monorella.srf.branch.payment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.monorella.srf.branch.dto.Charges;
import com.monorella.srf.branch.dto.DashboardAccount;
import com.monorella.srf.branch.dto.Member;
import com.monorella.srf.branch.dto.Payment;

@Repository
public class PaymentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//요금제 조회
	public List<Charges> selectCharges(String branch_owner_cd){
		return sqlSessionTemplate.selectList("com.monorella.srf.branch.payment.PaymentMapper.selectCharges", branch_owner_cd);
	}
	
	// 결제 회원 중복확인 
	public Member checkMember(Member member){
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.payment.PaymentMapper.checkMember", member);
	}
	
	// 결제 등록시 월별 결제 총액 업데이트
	public int modifyMonthIncome(DashboardAccount dashboardAccount){
		System.out.println("PaymentDao-> modifyMonthIncome()-> dashboardAccount: "+ dashboardAccount);
		return sqlSessionTemplate.update("com.monorella.srf.branch.payment.PaymentMapper.modifyMonthIncome", dashboardAccount);
	}
	// 결제 등록시 월별 결제 총액 셀렉트
	public DashboardAccount selectMonthIncome(String branch_owner_cd){
		System.out.println("PaymentDao-> selectMonthIncome()-> branch_owner_cd: "+ branch_owner_cd);
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.payment.PaymentMapper.selectMonthIncome", branch_owner_cd);
	}
	
	//기간만료일 수정
	public int modifyEndDate(Payment payment){
		return sqlSessionTemplate.update("com.monorella.srf.branch.payment.PaymentMapper.modifyEndDate", payment);
	}
	
	// 열람실 좌석 추가 메서드
	public int insertPayment(Payment payment) {
		System.out.println("insertpayment");
		System.out.println(payment);
		return sqlSessionTemplate.insert("com.monorella.srf.branch.payment.PaymentMapper.insertPayment", payment);
	}
	//열람실 좌석 수정 메서드
	public int modifyPaymentSeat(Payment payment) {
		System.out.println("Seat table modify");
		return sqlSessionTemplate.update("com.monorella.srf.branch.payment.PaymentMapper.modifyPaymentSeat", payment);
	}
	//열람실 회원 수정 메서드
	public int modifyPaymentMember(Payment payment) {
		System.out.println("modifyPaymentMember modify");
		return sqlSessionTemplate.update("com.monorella.srf.branch.payment.PaymentMapper.modifyPaymentMember", payment);
	}
	//열람실 회원 수정 메서드
	public int paycddetail(Payment payment) {
		System.out.println("paycddetail modify");
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.payment.PaymentMapper.paycddetail", payment);
	}

	//열람실 출결 번호 수정 메서드
	public int insertPaymentinout(Payment payment) {
		System.out.println("insertPaymentinout modify");
		return sqlSessionTemplate.update("com.monorella.srf.branch.payment.PaymentMapper.insertPaymentinout", payment);
	}
	//열람실 회원 수정 메서드
	public int inoutingdetail(Payment payment) {
		System.out.println("inoutingdetail modify");
		return sqlSessionTemplate.selectOne("com.monorella.srf.branch.payment.PaymentMapper.inoutingdetail", payment);
	}
	//열람실 출결 번호 멤버테이블 업데이트 메서드
	public int Paymentinoutup(Member member) {
		System.out.println("Paymentinoutup modify");
		return sqlSessionTemplate.update("com.monorella.srf.branch.payment.PaymentMapper.Paymentinoutup", member);
	}
	//상세정보 요청
	public Member detailMember(Member member) {
        return sqlSessionTemplate.selectOne("com.monorella.srf.branch.payment.PaymentMapper.detailMember", member);
    }
}
