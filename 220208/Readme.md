### java

## 생성

- ComVO.java
- ComDAO.java
- ComDAO_Impl.java
- ComAnsVO.java
- ComAnsDAO.java
- ComAnsDAO_Impl.java
- ViewComVO.java
- RecomCVO.java

## 추가

- Ctrl.java

        // 잡담 db
	    private ComDAO comDao = null;
	    public ComDAO getComDao() { return comDao; }
	    public void setComDao(ComDAO comDao) { this.comDao = comDao; }
	
    	// 잡담 답변 db
	    private ComAnsDAO comansDao = null;
	    public ComAnsDAO getComansDao() { return comansDao; }
	    public void setComansDao(ComAnsDAO comansDao) { this.comansDao = comansDao; }

        ...
        
        // 잡담
	    // 잡담 리스트
	    @RequestMapping("/com_list.do")
	    public ModelAndView com_list(HttpSession session) throws Exception {
		    List<ComVO> ls = comDao.findAll();
		    ModelAndView mnv = new ModelAndView();
		
	    	if (session.getAttribute("username") == null) {
	    		mnv.setViewName("view_login");
	    		mnv.addObject("ecode", "need_login");
		    }
		    else {
			    mnv.setViewName("com_list");
		    	mnv.addObject("list", ls);
		    }
    		return mnv;
	    }
	
	    // 잡담 등록
	    @RequestMapping("/add_com.do")
	    public String add_com(final @ModelAttribute ComVO vo )
	    	throws Exception {
	    	System.out.println( vo.toString() );
	    	comDao.add(vo);
	    	return "redirect:com_list.do";
	    }
		
	    // 잡담 등록 화면
	    @RequestMapping("/update_com.do")
	    public ModelAndView update_com() throws Exception {
	    	ModelAndView mnv = new ModelAndView();
	    	mnv.setViewName("update_com");
	    	return mnv;
	    }
		
	    // 잡담 삭제
	    @RequestMapping("/delCom.do")
	    public String del_com(final @ModelAttribute ComVO vo, HttpSession session) throws Exception {
	    	comDao.delByPK(vo);
	    	return "redirect:com_list.do";
	    }
	
	    // 답변 등록
	    @RequestMapping("/addCom_ans.do")
	    public String ansCom_add(final @ModelAttribute ComAnsVO avo,final @ModelAttribute ComVO vo)
	    		throws Exception {
	    	comansDao.add(avo, vo);
	    	return "redirect:com.do?no="+vo.getNo();
	    }
		
	    // 답변 삭제
	    @RequestMapping("/delCom_ans.do")
	    public String delCom_ans(final @ModelAttribute ComAnsVO avo,final @ModelAttribute ComVO vo) throws Exception {
	    	comansDao.delByPK(avo);
	    	return "redirect:com.do?no=" + avo.getNo();
	    }
	
	    // 답변 추천
	    @RequestMapping("/recomCom_A.do")
	    public String recomA_com(final @ModelAttribute ComAnsVO pvo, final @ModelAttribute ComVO vo,HttpSession session) throws Exception {	
	    	comansDao.recom(pvo,(String)session.getAttribute("username"));
	    	return "redirect:com.do?no=" + vo.getNo();
	    }
	
	    @RequestMapping("/com.do")
	    ModelAndView Community(final @ModelAttribute ComVO vo, final @ModelAttribute ComAnsVO avo, HttpSession session) throws Exception {
	    	comDao.view_update(vo, (String)session.getAttribute("username"));
	    	ComVO ls = comDao.findByPk(vo);
	    	List<ComAnsVO> ans_ls = comansDao.findByFk(avo,vo);
	    	ModelAndView mnv = new ModelAndView();
	    	mnv.setViewName("com_view");
	    	mnv.addObject("list", ls);
	    	mnv.addObject("ans_list",ans_ls);
	    	return mnv;
	    }
 
- SpringDAO_Impl.java

        @Override
        public int delByPK(SpringVO pvo) throws Exception {
        	// 질문 삭제
            int uc = jdbcTemplate.update("DELETE FROM tmp_02 WHERE no = " + pvo.getNo());
            // 질문에 달린 답변들 삭제
            uc = uc + jdbcTemplate.update("DELETE FROM tmp_03 WHERE no = " + pvo.getNo());
            // 질문에 달린 추천 삭제
            uc = uc + jdbcTemplate.update("DELETE FROM recomQ_T WHERE no = " + pvo.getNo());
            // 질문에 대한 답변 추천 삭제
            uc = uc + jdbcTemplate.update("DELETE FROM recomA_T WHERE no = " + pvo.getNo());
            // 질문에 대한 조회수 추천 삭제
            uc = uc + jdbcTemplate.update("DELETE FROM view_T WHERE no = " + pvo.getNo());
            return uc;
        }
	
## 수정

- SpringVO.java : 코드 수정 및 삭제
- SpringDAO_Impl.java : 코드 수정 및 삭제
- Ctrl.java : 일부 코드 삭제

### jsp

## 생성

- com_list.jsp

![image](https://user-images.githubusercontent.com/72788533/152924078-58486a93-da3e-4b86-82cd-f36415f22156.png)

- com_view.jsp

![image](https://user-images.githubusercontent.com/72788533/152924102-35602fa0-d630-4db3-b8dd-5ca8fd4925cb.png)

- update_com.jsp

![image](https://user-images.githubusercontent.com/72788533/152924121-60d2e336-68ce-48fb-95b5-84e2ddb29e4d.png)

## 수정

- qna_view.jsp

![image](https://user-images.githubusercontent.com/72788533/152931000-77a7eb3e-228b-49bf-9005-1d43872b67a2.png)

- update_view.jsp

### xml

## 추가

- spring.xml
	
		<bean id="comDao" class="banana.ComDAO_Impl">
			<property name="jdbcTemplate" ref="jtpl"/>
		</bean>

		<bean id="comansDao" class="banana.ComAnsDAO_Impl">
			<property name="jdbcTemplate" ref="jtpl"/>
		</bean>
	
		<bean class="banana.Ctrl">
			<property name="springDao" ref="springDao"/>
			<property name="answerDao" ref="answerDao"/>
			<property name="loginDao" ref="loginDao"/>
			<property name="noticeDao" ref="noticeDao"/>
			<property name="comDao" ref="comDao"/>
			<property name="comansDao" ref="comansDao"/>
		</bean>
	
### DB

## 생성
- com_T

		CREATE TABLE com_T(
			no INT NOT NULL auto_increment PRIMARY KEY,
		    username VARCHAR(50) NOT NULL,
		    title VARCHAR(50),
    		content VARCHAR(5000),
			view INT,
			time VARCHAR(50)
		);
		
- comAns_T

		CREATE TABLE comAns_T(
			ans_no INT NOT NULL auto_increment PRIMARY KEY,
    		no INT NOT NULL,
    		username VARCHAR(50) NOT NULL,
    		content VARCHAR(5000),
    		recommend INT,
    		time VARCHAR(50)
		);
		
- viewCom_T

		CREATE TABLE viewCom_T(
			no INT NOT NULL,
			username VARCHAR(20) NOT NULL
		);
		
- recomCom_T

		CREATE TABLE recomCom_T (
			ans_no INT NOT NULL,
			no INT NOT NULL,
			username VARCHAR(20) NOT NULL
		);
