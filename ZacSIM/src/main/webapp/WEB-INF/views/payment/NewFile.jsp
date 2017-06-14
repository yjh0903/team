<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	$(document).on('click','.save',function(){
 		var selectValue = $(this).parent().parent().find('.boardCategoryNo').val();
 		var priceValue = $(this).parent().parent().find('.testTotalPrice').val();
 		console.log(selectValue);
 		if(selectValue == 0) {
 			alert('카테고리를 선택해주세요.');
 			$(this).parent().parent().find('.select').focus();
 		}else if(priceValue == '') {
 			alert('총단가의 가격이 없습니다.');
 			$(this).parent().parent().find('.testPrice').focus();
 		}
 		var params = $(this).parent().parent().find('.testForm').serialize();
 		console.log(params);
 	    jQuery.ajax({
 	        url: '${pageContext.request.contextPath}/testSave',
 	        type: 'POST',
 	        data:params,
 	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
 	        dataType: 'html',
 	        success: function (result) {
 	            if (result == 1){
 	                console.log('데이터 보내기 성공');
 	                alert('저장되었습니다.');
 	            }else{
 	            	alert('저장에 실패하였습니다.');
 	            }
 	        }
 	    });
 	});




	@RequestMapping(value = "testSave", method = RequestMethod.POST)
	@ResponseBody
	public int test03(@RequestParam(value="boardCategoryNo") String equipmentCategorySelect
						,@RequestParam(value="test1") String test1
						,@RequestParam(value="testPrice") String testPrice
						,@RequestParam(value="testValue") String testValue
						,@RequestParam(value="testCustomer") String testCustomer
						,@RequestParam(value="testState") String testState
						,HttpSession session){
		
		System.out.println("비품 저장 메서드 실행");
		System.out.println(equipmentCategorySelect);
		System.out.println(test1);
		System.out.println(testPrice);
		System.out.println(testValue);
		System.out.println(testCustomer);
		System.out.println(testState);
		
		int teacherNo = (Integer)session.getAttribute("teacherNo");
		String licenseKindergarten = (String) session.getAttribute("licenseKindergarten");
		
		Equipment equipment = new Equipment();
		
		equipment.setLicenseKindergarten(licenseKindergarten);
		equipment.setTeacherNo(teacherNo);
		equipment.setEquipmentName(test1);
		equipment.setCategoryNo(Integer.parseInt(equipmentCategorySelect));
		equipment.setEquipmentCost(Integer.parseInt(testPrice));
		equipment.setEquipmentAmount(Integer.parseInt(testValue));
		equipment.setEquipmentCustomer(testCustomer);
		equipment.setEquipmentState(testState);

		int returnValue = dao.addEquipment(equipment);
		
		return returnValue;




	// 비품 한줄 저장하기
	public int addEquipment(Equipment equipment) {
		System.out.println("addEquipment 메서드 내용 실행");
		
		return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addEquipment", equipment);
	}



  	<insert id="addEquipment" parameterType="com.cafe24.dmsthch.Equipment.Equipment">
  		INSERT INTO equipment(
  			  license_kindergarten
  			, equipment_name
  			, teacher_no
  			, category_no
  			, equipment_cost
  			, equipment_amount
  			, equipment_customer
  			, equipment_state
  			, equipment_day
  		) VALUES(
  			 #{licenseKindergarten}
  			,#{equipmentName}
  			,#{teacherNo}
  			,#{categoryNo}
  			,#{equipmentCost}
  			,#{equipmentAmount}
  			,#{equipmentCustomer}
  			,#{equipmentState}
  			,now()
  		);
  	</insert>