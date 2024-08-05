package com.project.npnc.document.member.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.npnc.admin.document.model.dto.StorageFolder;
import com.project.npnc.admin.document.model.service.AdminDocumentService;
import com.project.npnc.admin.vacation.model.dto.Vacation;
import com.project.npnc.admin.vacation.model.service.VacationService;
import com.project.npnc.document.model.dto.Approver;
import com.project.npnc.document.model.dto.ApproverLine;
import com.project.npnc.document.model.dto.ApproverLineStorage;
import com.project.npnc.document.model.dto.Document;
import com.project.npnc.document.model.dto.DocumentForm;
import com.project.npnc.document.model.dto.DocumentFormFolder;
import com.project.npnc.document.model.dto.OvertimeApply;
import com.project.npnc.document.model.dto.VacationApply;
import com.project.npnc.document.model.service.MemberApproveService;
import com.project.npnc.document.model.service.MemberDocumentService;
import com.project.npnc.organization.dto.OrganizationDto;
import com.project.npnc.organization.service.OrganizationService;
import com.project.npnc.security.dto.Member;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/document")
@RequiredArgsConstructor
@Slf4j 
public class MemberDocumentController {
	private final MemberDocumentService serv;
	private final MemberApproveService apserv;
	private final OrganizationService orserv;
	private final AdminDocumentService adminserv;
	private final VacationService vacserv;
	private final DocS3Controller s3Con;
	
//	@Value("${file.upload-dir}")
//    private String uploadDir; // src/main/resources/upload/
	
	
	@GetMapping("/home")
	public void docHome(Model m) {
		Member user = getCurrentUser();
		m.addAttribute("doclist", serv.selectInprocessDocs(user.getMemberKey()));
		log.debug("{}", m.getAttribute("doclist"));
		m.addAttribute("waitinglist", serv.selectWaitingDocs(user.getMemberKey()));
		log.debug("{}", m.getAttribute("waitinglist"));
	}
	@GetMapping("/test")
	public void docTest(Model m) {
	}
	@GetMapping("/form")
	public void formChoice(Model m){
		log.debug("----전자문서 양식 조회----");
		List<DocumentFormFolder> result = serv.selectformFolders();
		log.debug("{}", result);
		m.addAttribute("folderlist", result);
	}
	
//	사원 문서 목록 조회
	@GetMapping("/list/employee/inprocess")
	public void selectInprocessDoc(Model m){
		log.debug("----진행중인 문서 조회----");
		Member user = getCurrentUser();
		List<Document> result = serv.selectInprocessDocs(user.getMemberKey());
		log.debug("{}", result);
		m.addAttribute("doclist", result);
	}
	@GetMapping("/list/employee/complete")
	public void selectMyCompleteDocs(Model m){
		log.debug("----승인 문서 조회----");
		Member user = getCurrentUser();
		log.debug(user.getMemberKey()+"번 사원");
		List<Document> result = serv.selectMyCompleteDocs(user.getMemberKey());
		log.debug("{}", result);
		m.addAttribute("completelist", result);
	}
	@GetMapping("/list/employee/rejected")
	public void selectMyRejectDocs(Model m) {
		log.debug("----반려 문서 조회----");
		Member user = getCurrentUser();
		List<Document> result = serv.selectMyRejectDocs(user.getMemberKey());
		log.debug("{}", result);
		m.addAttribute("doclist", result);
	}
	@GetMapping("/list/employee/retrieve")
	public void selectRetrieveDocs(Model m) {
		log.debug("----회수 문서 조회----");
		Member user = getCurrentUser();
		List<Document> result = serv.selectRetrieveDocs(user.getMemberKey());
		log.debug("{}", result);
		m.addAttribute("doclist", result);
	}
	@GetMapping("/list/employee/draft")
	public void selectDraftDocs(Model m){
		log.debug("----임시보관 문서 조회----");
		Member user = getCurrentUser();
		List<Document> result = serv.selectDraftDocs(user.getMemberKey());
		log.debug("{}", result);
		m.addAttribute("doclist", result);
	}
	@GetMapping("/list/employee/pending")
	public void selectMyPendingDocs(Model m){
		log.debug("---- 보류된 문서 조회----");
		Member user = getCurrentUser();
		List<Document> result = serv.selectMyPendingDocs(user.getMemberKey());
		log.debug("{}", result);
		m.addAttribute("pendinglist", result);
	}
	
//	결재자 문서 목록 조회
	@GetMapping("/list/approver/waiting")
	public void selectWaitingDocs(Model m){
		Member user = getCurrentUser();
		log.debug("----- " + user.getMemberKey()+"번 사원의 결재 대기 문서 조회 -----");
		List<Document> result = serv.selectWaitingDocs(user.getMemberKey());
		log.debug("{}", result);
		m.addAttribute("waitinglist", result);
	}
	@GetMapping("/list/approver/complete")
	public void selectCompleteDocs(Model m){
		Member user = getCurrentUser();
		log.debug("----- " + user.getMemberKey()+"번 사원이 승인한 문서 조회 -----");
		List<Document> result = serv.selectCompleteDocs(user.getMemberKey());
		log.debug("{}", result);
		m.addAttribute("completelist", result);
	}
	@GetMapping("/list/approver/pending")
	public void selectPendingDocs(Model m){
		Member user = getCurrentUser();
		log.debug("----- " + user.getMemberKey()+"번 사원이 보류한 문서 조회 -----");
		List<Document> result = serv.selectPendingDocs(user.getMemberKey());
		log.debug("{}", result);
		m.addAttribute("pendinglist", result);
	}
	@GetMapping("/list/approver/rejected")
	public void selectRejectedDocs(Model m){
		Member user = getCurrentUser();
		log.debug("----- " + user.getMemberKey()+"번 사원이 반려한 문서 조회 -----");
		List<Document> result = serv.selectRejectedDocs(user.getMemberKey());
		log.debug("{}", result);
		m.addAttribute("rejectedlist", result);
	}
	
//	참조 문서 목록
	@GetMapping("/list/referer/reference")
	public void selectReferenceDocs(Model m){
		Member user = getCurrentUser();
		log.debug("----- " + user.getMemberKey()+"번 사원의 참조 문서 조회 -----");
		List<Document> result = serv.selectReferenceDocs(user.getMemberKey());
		log.debug("{}", result);
		m.addAttribute("referencelist", result);
	}
	
	
//	전자문서 상세보기
	@PostMapping("/view/docDetail")
	public void viewDoc(int docId, 
			@RequestParam(required = false) String history, 
											Model m, HttpSession session) throws Exception {
		log.debug("----" + docId + "번 문서 상세보기----");
		Document document = serv.selectDocById(docId);
		log.debug("{}", document);
		m.addAttribute("l", document);
		
		
		//로그인 유저가 결재자에 해당하는지 확인할 수 있는 데이터 생성
		List<Approver> aps = document.getApprovers();
		aps.removeIf(e-> e.getCategory().equals("기안"));
		log.debug(aps.toString());
		m .addAttribute("approverStr", Arrays.asList(aps).toString());
		
		
		//문서파일 html 가져오기
		String html = s3Con.readHtmlFile("upload/dochtml", document.getErDocFilename());
		if(html == null || html.equals("")) {
			throw new Exception("문서 불러오기 실패");
		}
		
		if(history != null) {
			m.addAttribute("history", history);
		}
		m.addAttribute("html", html);
	}
	
	@GetMapping("/request/docHtml")
	public ResponseEntity<Map<String,Object>> requestDocHtml(
			@RequestParam String serial, HttpSession session
			) throws Exception{
		log.debug(serial);
		log.debug("----- " + serial + "문서 다운로드 -----");
		Map<String,Object> response = new HashMap<>();
		
		//문서파일 html 가져오기
		try {
			String html = s3Con.readHtmlFile("upload/dochtml", serial+".html");
			if(html == null || html.equals("")) {
				throw new Exception("문서 불러오기 실패");
			}
			response.put("html", html);
			response.put("status", "success");
			response.put("message", "문서 불러오기 성공");
		}catch(Exception e) {
			e.printStackTrace();
			response.put("status", "fail");
			response.put("message", "문서 불러오기 실패");
		}
		
		return ResponseEntity.ok(response);
	}
	
	
	//양식 불러오기
	@GetMapping("/request/docForm{formNo}")
	public String formDoc(String form, HttpSession session) {
		log.debug(form + "양식 불러오기");
		return s3Con.readHtmlFile("upload/docformhtml", form+".html");
	}
	
	//양식 목록 조회
	@PostMapping("/formlist")
	@ResponseBody
	public List<DocumentForm> formList(int folderNo, Model m) {
		log.debug("----전자문서 양식 "+ folderNo+"번 폴더 조회----");
		List<DocumentForm> result = serv.selectForms(folderNo);
		log.debug("{}", result);
		return result;
	}
	
	//양식 검색
	@PostMapping("/formsearch")
	@ResponseBody
	public List<DocumentForm> formList(String target, Model m) {
		log.debug("----전자문서 양식명 "+ target+" 조회----");
		List<DocumentForm> result = serv.selectFormsBySearch(target);
		log.debug("{}", result);
		return result;
	}
	
	//문서 작성 시작
	@GetMapping("/write")
	public String formWrite(int form, Model m, HttpSession session) {
		log.debug("----전자문서 작성시작----");
		String html = s3Con.readHtmlFile("upload/docformhtml", form+".html");
		//기안부서 적용
		html = html.replace("[기안부서]", getCurrentUser().getDepartmentName());
		//기안일 적용
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		html = html.replace("[기안일]", LocalDate.now().format(formatter));
		//기안자
		html = html.replace("[기안자]", getCurrentUser().getJobName()+ " " + getCurrentUser().getMemberName());
		m.addAttribute("form", form);
		
		//추가근무 신청폼인 경우 근무 현황 데이터 첨부
		if(form == 2) {
			log.debug("----추가근무 신청----");
//			html = html.replace("[주 근무 현황]", attendserv.selectRemainingVac(getCurrentUser().getMemberKey())+"");
			m.addAttribute("html", html);
			return "document/write/overwork";
		}

		//휴가 신청폼인 경우 휴가 데이터 첨부
		if(form ==3) {
			log.debug("----휴가 신청----");
			html = html.replace("[잔여 연차]", serv.selectRemainingVac(getCurrentUser().getMemberKey())+"");
			
			List<Vacation> vacation =vacserv.selectVacationAll();
			log.debug("{}", vacation);
			String vacselect = "<select class=\"form-select form-control-sm w-25\" id=\"vacationSelectArea\">";
			vacselect += "<option>---선택---</option>";
			for(Vacation v : vacation) {
				vacselect += "<option data-yn=\""+ v.getVacationCalcYN().toUpperCase() + "\" data-key=\"" + v.getVacationKey() + "\">" + v.getVacationName() + "</option>";
			}
			vacselect += "</select>";
			html = html.replace("[휴가 종류]", vacselect);
			
			m.addAttribute("html", html);
			return "document/write/vacation";
		}
		
		m.addAttribute("html", html);
		return "document/write/normal";
	}
	
	
	//재기안
	@PostMapping("/rewrite")
	public String docRewrite(String serial, Model m,
			HttpSession session) {
		log.debug("----전자문서 재작성----");
		//기존 작성 내용 불러오기
		Document d = serv.selectDocBySerial(serial);
		m.addAttribute("doc", d);
		log.debug("{}", d);
		
		//양식번호
		//날짜- 제거
		String afterF = serial.substring(serial.indexOf("F"));
		//뒤 -이후 제거
		String afterFbeforebar = afterF.substring(0, afterF.indexOf("-"));
		if(afterFbeforebar.contains("TEMP")) {
			afterFbeforebar.replace("TEMP", "");
		}
		String formNo = afterFbeforebar.replace("F", "");
		System.out.println(formNo);
    	m.addAttribute("form", formNo);
    	log.debug(m.getAttribute("form").toString());
    	int form = Integer.parseInt(formNo);
    	
//    	String html = DocHtmlController.readHtmlFile("docformhtml", form+".html", uploadDir);
    	String html = null;
    	String jsp = null;
		//추가근무 신청폼인 경우 근무 현황 데이터 첨부
		if(form == 2) {
			log.debug("----추가근무 신청----");
			html = s3Con.readHtmlFile("upload/docformhtml", form+".html");
			jsp = "document/rewrite/overwork";
		}else

		//휴가 신청폼인 경우 휴가 데이터 첨부
		if(form ==3) {
			log.debug("----휴가 신청----");
			html = s3Con.readHtmlFile("upload/docformhtml", form+".html");
			html = html.replace("[잔여 연차]", serv.selectRemainingVac(getCurrentUser().getMemberKey())+"");
			
			List<Vacation> vacation =vacserv.selectVacationAll();
			log.debug("{}", vacation);
			String vacselect = "<select class=\"form-select form-control-sm w-25\" id=\"vacationSelectArea\">";
			vacselect += "<option>---선택---</option>";
			for(Vacation v : vacation) {
				vacselect += "<option data-yn=\""+ v.getVacationCalcYN().toUpperCase() + "\" data-key=\"" + v.getVacationKey() + "\">" + v.getVacationName() + "</option>";
			}
			vacselect += "</select>";
			html = html.replace("[휴가 종류]", vacselect);
			
			jsp= "document/rewrite/vacation";
		}else {
			//작성했던 파일
			html = s3Con.readHtmlFile("upload/dochtml", d.getErDocFilename());
			jsp= "document/rewrite/normal";
		}
		//기안부서 적용
		html = html.replace("[기안부서]", getCurrentUser().getDepartmentName());
		//기안일 적용
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		html = html.replace("[기안일]", LocalDate.now().format(formatter));
		//기안자
		html = html.replace("[기안자]", getCurrentUser().getJobName()+ " " + getCurrentUser().getMemberName());
		
		log.debug(html);
		m.addAttribute("html", html);
		return jsp;
	}
	
	
	
//	팝업
	//결재자 선택팝업 호출, 조직도와 저장된 결재라인 출력
	@GetMapping("/write/approver")
	public void docApprover(Model m) {
		List<OrganizationDto> list = orserv.selectOrganAll();
		log.debug("----- 결재자 선택 -----");
		m.addAttribute("list", list);
		log.debug("{}", list); 
		//저장된 결재라인들 출력
		List<ApproverLineStorage> ap = serv.selectApproverLines(getCurrentUser().getMemberKey());
		m.addAttribute("aplist", ap);
		log.debug("{}", ap); 
	}
	//보관함 선택 팝업 호출
	@GetMapping("/write/storage")
	public void docStorage(Model m) {
		List<StorageFolder> folders = adminserv.selectAdminDocumentFormAll();
		m.addAttribute("folders",folders);
		log.debug("----- 보관함 선택 -----");
		m.addAttribute("folders", folders);
		log.debug("{}", folders); 
	}
	//현재 결재 현황 팝업 호출
	@GetMapping("/view/inprocess/now")
	public void docApproveNow(Model m, @RequestParam int no) {
		log.debug("----- 결재 내역 자세히보기 -----");
		m.addAttribute("doc", apserv.selectInprocessDocApproveNow(no));
		log.debug("{}", m.getAttribute("doc"));
		
	}
	
	//결재라인 삭제
	@PostMapping("/write/delete/approverline")
	public ResponseEntity<Map<String,Object>> deleteApproverLine(
			@RequestBody int no) {
//		@RequestBody Map<String, Integer> requestBody) {
//		int no = requestBody.get("no");
		log.debug("----- 결제라인 "+ no + " 삭제 요청 -----");
		int result = serv.deleteApproverLine(no);
		Map<String,Object> response = new HashMap<>();
		
		if(result>0) {
			log.debug("결제라인 삭제 성공");
			response.put("status","success");
			response.put("message", "결재라인 삭제에 성공했습니다.");
		}
		else {
			log.debug("결제라인 삭제 실패");
			response.put("status", "error");
			response.put("message", "결재라인 삭제에 실패했습니다.");
		}
		return ResponseEntity.ok(response);
		
	}
	//결재라인 저장
	@PostMapping("/write/save/approverline")
	public ResponseEntity<Map<String,Object>> insertApproverLine(
			@RequestBody ApproverLineStorage data) throws Exception {
		log.debug("----- 결재라인 저장 -----");
		log.debug(data.getErApLineStorageName());
		List<ApproverLine> list = data.getApprovers();
		log.debug("{}", list);

		
		int result = serv.insertApproverLine(getCurrentUser().getMemberKey(), data.getErApLineStorageName(), data.getApprovers());
		Map<String,Object> response = new HashMap<>();
		
		
		if(result>0) {
			response.put("status","success");
			response.put("message", "결재라인 저장을 성공했습니다.");
		}
		else {
			response.put("status", "error");
			response.put("message", "결재라인 저장에 실패했습니다.");
		}
		return ResponseEntity.ok(response);
		
	}
	//참조인 선택
	@GetMapping("/write/referer")
	public void docReferer(Model m) {
		m.addAttribute("list", orserv.selectOrganAll());
	}
//	
	
	//문서 임시저장
	@PostMapping(path="/savedraft", consumes = {"multipart/form-data"})
	public ResponseEntity<Map<String,Object>> insertDraftDoc(
			String msg, Model m, Document doc, String html, 
			@RequestParam(value="upfile")MultipartFile[] file
			){
		Member user = getCurrentUser();
		log.debug("{}", html);
		log.debug("{}", user);
		doc.setErDocSerialKey(user.getDepartmentKey()+
				"F"+ doc.getDocFormKey() + "TEMP"); //문서구분키 생성을 위한 사전세팅(부서코드양식코드)
		
		
		//결재자 저장을 위한 세팅
		doc = generateApprover(doc, msg);
		log.debug("{}", doc);
		
		
		//문서 등록
		Map<String,Object> response = new HashMap<>();
		try { 
			log.debug(user.getMemberName()+ "사원의 문서 임시저장");
			serv.insertDraftDoc(doc, file, html);
		} catch (Exception e) {
			log.debug("문서 임시저장 실패");
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", "문서 임시저장에 실패했습니다.");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
		
		//기안, 결재자 등록 성공시
		response.put("status", "success");
		response.put("message", "문서 임시저장 완료");
		
		return ResponseEntity.ok(response);
	}
	
	
	//휴가 신청 문서 임시저장
	@PostMapping(path="/savedraft/vacation", consumes = {"multipart/form-data"})
	public ResponseEntity<Map<String,Object>> insertDraftVacDoc(
			Model m, Document doc, String html, 
			@RequestParam(required = false) String vacationUseCount,
	        @RequestParam(required = false) String vacationReason,
	        @RequestParam(required = false) String vacationKey,
			@RequestParam(name="vacationStartDate", required = false) String startDate, 
			@RequestParam(name = "vacationEndDate", required = false) String endDate,
	        @RequestParam(name="vacationStartTime", required = false) String startTime, 
	        @RequestParam(name= "vacationEndTime", required = false) String endTime,
			@RequestParam(value="upfile")MultipartFile[] file
			){
		log.debug(startDate + " " + startTime);
		log.debug(endDate + " " + endTime);
		log.debug("차감 : "+vacationUseCount + " \n사유 : " + vacationReason);

		Member user = getCurrentUser();
		log.debug("{}", html);
		log.debug("{}", user);
		doc.setErDocSerialKey(user.getDepartmentKey()+"F"+ doc.getDocFormKey()); //문서구분키 생성을 위한 사전세팅(부서코드양식코드)
		
		//기안자=로그인유저
		doc.setErDocWriter(user.getMemberKey()); 
		log.debug("{}", doc);
		
		//휴가 신청 dto 구성
		if(startTime == null || startTime.trim().isEmpty()) {
			startTime = "00:00:00";
			log.debug("startTime -> " + startTime);
		}
		if(endTime == null || endTime.trim().isEmpty()) {
			endTime = "23:59:59";
			log.debug("endTime -> " + endTime);
		}
		VacationApply vac = VacationApply.builder()
								.vacationKey(Integer.parseInt(vacationKey))
								.vacationStartDate(convertToTimestamp(startDate, startTime))
								.vacationEndDate(convertToTimestamp(endDate, endTime))
								.vacationUseCount(Integer.parseInt(vacationUseCount))
								.vacationMemberKey(user.getMemberKey())
								.vacationReason(vacationReason)
								.build();
		
		Map<String,Object> response = new HashMap<>();
		log.debug("{}", vac);
		//문서 등록
		try { 
			log.debug(user.getMemberName()+ "사원의 휴가 신청서 임시저장");
			serv.insertDraftVacDoc(doc, file, html, vac);
		} catch (Exception e) {
			log.debug("문서 임시저장 실패");
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", "문서 임시저장에 실패했습니다.");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
		
		//기안, 결재자 등록 성공시
		response.put("status", "success");
		response.put("message", "문서 임시저장 완료");
		
		return ResponseEntity.ok(response);
	}
	
	
	//일반 전자문서 기안(기안자번호, 기안자결재의견, 기본정보, 결재자들, 첨부파일)
	@PostMapping(path="/writeend", consumes = {"multipart/form-data"}) 
	public ResponseEntity<Map<String,Object>> insertDoc(
				String msg, Model m, @Valid Document doc, BindingResult bindingResult, 
				String html, 
				@RequestParam(value="upfile", required = false) MultipartFile[] file) {
		
		Map<String,Object> response = new HashMap<>();
		if (bindingResult.hasErrors()) {
			response.put("status", "error");
			response.put("message", "필수 정보를 모두 입력하세요.");
			response.put("message",  "필수 정보를 모두 입력하세요.\n" + bindingResult.getAllErrors().get(0).getDefaultMessage());
			
			return ResponseEntity.ok(response);
        }
		Member user = getCurrentUser();
		if(msg.equals(",")) msg=""; //debug
		if (msg != null && msg.endsWith(",")) {
		    msg = msg.substring(0, msg.length() - 1); // 마지막 문자를 제거
		}//debug
		
		log.debug("{}", html);
		log.debug(file.toString());
		log.debug("{}", user);
		doc.setErDocSerialKey(user.getDepartmentKey()+"F"+doc.getDocFormKey()); //문서구분키 생성을 위한 사전세팅(부서코드양식코드)
		
		
		//결재자 저장을 위한 세팅
		doc = generateApprover(doc, msg);
		log.debug("{}", doc);
		
		
		//문서 등록
		try { 
			log.debug(user.getMemberName()+ "사원의 문서 기안 -> " + msg);
			serv.insertDoc(doc, file, html);
			
			//결재자 한명이면 바로 승인처리
			if(doc.getApprovers().size() <= 1) {
				log.debug("결재자 한명인 문서로 바로 처리완료 됩니다.");
				apserv.updateApproveDoc(doc.getErDocWriter(), doc.getErDocSerialKey(), msg, doc.getDocFormKey(), html);
				
			}
		    
			
		} catch (Exception e) {
			log.error(e.getMessage());
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", "문서 등록에 실패했습니다.");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
		
		//기안, 결재자 등록 성공시
		response.put("status", "success");
		response.put("message", "문서 등록 완료");
		
		//다음 결재자 찾기
		Approver nextAprover = null;
		for (Approver approver : doc.getApprovers()) {
		    if (approver.getOrderby() == 1) {
		        nextAprover = approver;
		        break; // 조건을 만족하는 첫 번째 객체를 찾으면 루프 종료
		    }
		}
		response.put("nextAprover", nextAprover);
		
		//모두 성공시 전자결재홈으로
		return ResponseEntity.ok(response);
	}
	
	
	//휴가 신청 기안
	@PostMapping(path="/writeend/vacation", consumes = {"multipart/form-data"}) 
	public ResponseEntity<Map<String,Object>> insertVacationDoc(
			String msg, Model m, Document doc, String html, 
			//@RequestParam(required = false) VacationApply vac,
			@RequestParam(required = false) String vacationUseCount,
	        @RequestParam(required = false) String vacationReason,
	        @RequestParam(required = false) String vacationKey,
			@RequestParam(name="vacationStartDate", required = false) String startDate, 
			@RequestParam(name = "vacationEndDate", required = false) String endDate,
	        @RequestParam(name="vacationStartTime", required = false) String startTime, 
	        @RequestParam(name= "vacationEndTime", required = false) String endTime,
			@RequestParam(value="upfile", required = false) MultipartFile[] file,
			HttpSession session) {
		
		Member user = getCurrentUser();
		log.debug("----- 휴가 신청 기안 -----");	
		
		log.debug(startDate + " " + startTime);
		log.debug(endDate + " " + endTime);
		log.debug("차감 : "+vacationUseCount + " \n사유 : " + vacationReason);
		if(msg.equals(",")) msg=""; //debug
		if (msg != null && msg.endsWith(",")) {
			msg = msg.substring(0, msg.length() - 1); // 마지막 문자를 제거
		}//debug
		
		log.debug(file.toString());
		doc.setErDocSerialKey(user.getDepartmentKey()+"F"+ doc.getDocFormKey()); //문서구분키 생성을 위한 사전세팅(부서코드양식코드)
		
		doc = generateApprover(doc, msg);
		log.debug("{}", doc);
		
		
	    //휴가 신청 dto 구성
		if(startTime == null || startTime.trim().isEmpty()) {
			startTime = "00:00:00";
			log.debug("startTime -> " + startTime);
		}
		if(endTime == null || endTime.trim().isEmpty()) {
			endTime = "23:59:59";
			log.debug("endTime -> " + endTime);
		}
		VacationApply vac = VacationApply.builder()
								.vacationKey(Integer.parseInt(vacationKey))
								.vacationStartDate(convertToTimestamp(startDate, startTime))
								.vacationEndDate(convertToTimestamp(endDate, endTime))
								.vacationUseCount(Integer.parseInt(vacationUseCount))
								.vacationMemberKey(user.getMemberKey())
								.vacationReason(vacationReason)
								.build();
		
		Map<String,Object> response = new HashMap<>();
		log.debug("{}", vac);
		//문서 등록
		try { 
			log.debug(user.getMemberName()+ "사원의 휴가 신청서 기안 -> " + msg);
			String uploadDir = session.getServletContext().getRealPath("/upload/");
			serv.insertVacDoc(doc, file, html, vac, uploadDir);
		} catch (Exception e) {
			log.error(e.getMessage());
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", "문서 등록중 에러가 발생했습니다.");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
		//휴가 신청 등록
		try { 
			vac.setVacationMemberKey(user.getMemberKey());
		} catch (Exception e) {
			log.error(e.getMessage());
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", "휴가 신청 등록중 에러가 발생했습니다.");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
		
		//기안, 결재자 등록 성공시
		response.put("status", "success");
		response.put("message", "문서 등록 완료");
		
		//모두 성공시 전자결재홈으로
		return ResponseEntity.ok(response);
	}
	
	
	//TODO 결재 대기문서 수신, 기안 문서 종결(처리상태 변경알림 = 반려 || 처리완료), 참조문서 수신 알람 기능 구현
	//rewrite
	//TODO 일반문서 임시저장 재기안 확인 -> 회수 재기안 확인 이것만 하면 일반 문서 끝
	
	//TODO 휴가 신청 일정 중복 확인 로직 구현 후 연차 계산 -> 기안되는지 확인 -> 임시저장 확인 -> 회수 확인 -> 임시저장 재기안 확인 -> 회수 재기안 확인
	//TODO 초과 신청 역시 기존 신청내역 확인 로직 구현 후 기안되는지 확인 -> 임시저장 확인 -> 회수확인 -> 임시저장 재기안 확인 -> 회수 재기안 확인
	//TODO 위아래 이동 기능 구현 (보류...)
	//TODO 전체 문서 조회 및 상세 검색 기능 (보류???)
	
	
	//추가근무 신청 기안
	@PostMapping(path="/writeend/overtimework", consumes = {"multipart/form-data"}) 
	public ResponseEntity<Map<String,Object>> insertOvertimeDoc(
				String msg, Model m, Document doc, String html, 
				@RequestParam(required = false) String overtimeReason,
				@RequestParam(required = false) String overtimeCategory,
				@RequestParam(required = false) String overtimeDate, 
				@RequestParam(required = false) String overtimeStartHH, 
				@RequestParam(required = false) String overtimeEndHH, 
				@RequestParam(required = false) String overtimeStartMM, 
				@RequestParam(required = false) String overtimeEndMM, 
				@RequestParam(value="upfile", required = false) MultipartFile[] file,
				HttpSession session) {
		
		Member user = getCurrentUser();
		log.debug("----- 추가근무 신청 기안 -----");
		log.debug(overtimeStartHH + " : " + overtimeStartMM);
		log.debug(overtimeEndHH + " : " + overtimeEndMM);
		log.debug(overtimeCategory + " 사유 : " + overtimeReason);
		
		if(msg.equals(",")) msg=""; //debug
		if (msg != null && msg.endsWith(",")) {
			msg = msg.substring(0, msg.length() - 1); // 마지막 문자를 제거
		}//debug
		
		log.debug(file.toString());
		doc.setErDocSerialKey(user.getDepartmentKey()+"F"+ doc.getDocFormKey()); //문서구분키 생성을 위한 사전세팅(부서코드양식코드)
		
		
		//결재자 저장을 위한 세팅
		doc = generateApprover(doc, msg);
		log.debug("{}", doc);
		
		
		//휴가 신청 시간 세팅
		String startTime = overtimeStartHH+":"+overtimeStartMM+":00";
		String endTime = overtimeEndHH+":"+overtimeEndMM+":00";
		if(startTime == null || startTime.trim().isEmpty()) {
			startTime = "00:00:00";
			log.debug("startTime -> " + startTime);
		}
		if(endTime == null || endTime.trim().isEmpty()) {
			endTime = "23:59:59";
			log.debug("endTime -> " + endTime);
		}
		
		//sqlDate로 변환
		Date sqlDate = null;
		try {
            // 1. SimpleDateFormat을 사용하여 문자열을 java.util.Date로 파싱
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(overtimeDate);

            // 2. java.util.Date를 java.sql.Date로 변환
            sqlDate = new Date(parsedDate.getTime());

            // 변환된 java.sql.Date 출력
            System.out.println("Converted java.sql.Date: " + sqlDate);
        } catch (ParseException e) {
            // 파싱 에러 처리
            System.err.println("Date parsing error: " + e.getMessage());
        }
		
		//추가근무 dto 구성
		OvertimeApply ot = OvertimeApply.builder()
				.overtimeReason(overtimeReason)
				.overtimeDate(sqlDate)
				.overtimeStartTime(convertToTimestamp(overtimeDate, startTime))
				.overtimeEndTime(convertToTimestamp(overtimeDate, endTime))
				.overtimeStatus("대기")
				.overtimeMemberKey(user.getMemberKey())
				.overtimeCategory(overtimeCategory)
				.build();
		
		
		//문서 등록
		Map<String,Object> response = new HashMap<>();
		try { 
			log.debug(user.getMemberName()+ "사원의 추가근무 신청서 기안 -> " + msg);
			String uploadDir = session.getServletContext().getRealPath("/upload/");
			serv.insertOvertimeDoc(doc, file, html, ot, uploadDir);
		} catch (Exception e) {
			log.error(e.getMessage());
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", "문서 등록중 에러가 발생했습니다.");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
		
		//기안, 결재자 등록 성공시
		response.put("status", "success");
		response.put("message", "문서 등록 완료");
		
		//모두 성공시 전자결재홈으로
		return ResponseEntity.ok(response);
	}
	
	//결재자 생성 로직
	private Document generateApprover(Document doc, String msg){
		Member user = getCurrentUser();
		//기안자=로그인유저
		doc.setErDocWriter(user.getMemberKey()); 
		//결재자에 기안자도 추가
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

		Approver me = Approver.builder().memberKey(user.getMemberKey())
				.memberTeamKey(user.getDepartmentKey())
				.memberTeamName(user.getDepartmentName())
				.memberJobKey(user.getJobKey())
				.memberJobName(user.getJobName())
				.memberName(user.getMemberName())
				.category("기안")
				.opinion(msg)
				.state("승인")
//				.date(Date.valueOf(LocalDate.now()))
				.date(currentTimestamp)
				.orderby(0)
				.build();
		List<Approver> ap = doc.getApprovers();
		ap.removeIf(a -> {
			boolean toRemove = a.getMemberKey() == 0;
			if (toRemove) {
				log.debug("없는 결재자 삭제");
				log.debug("{}", a);
			}
			return toRemove;
		});//debug
		ap.add(me);
		ap.sort(Comparator.comparing(Approver::getOrderby)); //정렬
		doc.setApprovers(ap);
		return doc;
	}
	
	//스트링 to 타임스탬프 변환 로직
	private Timestamp convertToTimestamp(String date, String time) {
		// 날짜 및 시간 포맷 정의
//		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		
		if (date == null || date.trim().isEmpty()) {
            return null;
        }
		if(time == null || time.trim().isEmpty()) {
			return null;
		}
		
        try {
        	Timestamp timestamp = null;
        	
        	// 날짜 및 시간 문자열을 LocalDateTime으로 파싱
            LocalDateTime localDateTime = LocalDateTime.parse(date.trim() + "T" + time.trim(), DateTimeFormatter.ISO_LOCAL_DATE_TIME);

            // 시간대 설정
            ZoneId zoneId = ZoneId.of("Asia/Seoul");
            ZonedDateTime zonedDateTime = localDateTime.atZone(zoneId);

            // ZonedDateTime을 Timestamp로 변환
            timestamp = Timestamp.from(zonedDateTime.toInstant());

            // 디버깅 로그
            System.out.println("DateTime: " + zonedDateTime);
            System.out.println("Timestamp: " + timestamp);
            
            log.debug(timestamp.toString());
            
            return timestamp;
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            return null; // 날짜가 null 또는 빈 문자열일 때 예외 처리
        } 
	}
	
	//문서 회수
	@PostMapping("/retrieve")
	@ResponseBody
	public int retrieveDoc(String no) {
		log.debug("------"+no + "번 문서 회수 요청------");
		int result=0;
		try {
			result = serv.retrieveDoc(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//문서 삭제
	@PostMapping("/delete")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> deleteDraftDoc(int no) {
		log.debug("------"+no + " 보관 문서 삭제 요청------");
		Map<String,Object> response = new HashMap<>();
		try {
			serv.deleteDraftDoc(no);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", "문서 삭제에 실패했습니다.");
			return ResponseEntity.ok(response);
		}
		response.put("status", "success");
		response.put("message", "문서 삭제 완료");
		return ResponseEntity.ok(response);
	}
	
	//로그인 유저 정보
	private Member getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return (Member) authentication.getPrincipal();
    }
}
