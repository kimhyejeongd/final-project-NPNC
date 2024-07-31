package com.project.npnc.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.npnc.calendar.model.dto.Reservation;
import com.project.npnc.calendar.model.dto.ReserveItem;
import com.project.npnc.calendar.model.service.CalendarService;
import com.project.npnc.organization.dto.OrganizationDto;
import com.project.npnc.organization.service.OrganizationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Controller
@RequiredArgsConstructor
@Slf4j
public class ReservationController {

	private final OrganizationService organService;
	private final CalendarService service;
	
	
	@GetMapping("/admin/reservation/reservationlist")
	public String reserve(Model m) {
		List<OrganizationDto> organlist = organService.selectOrganAll();
		List<Reservation> reservations =  service.selectReservationAll();
		

		
		m.addAttribute("organlist", organlist);
		m.addAttribute("reservations", reservations);
		return "calendar/reservation";
	}
	@GetMapping("/reservation/myreservation")
	public String myreservation(Model m) {
		int memberKey = 1; //임시로 멤버키설정
		List<ReserveItem> myreserveAll = service.selectMyReserve(memberKey);
		List<ReserveItem> reserveAll = service.selectReserveAll();
		for(int i=0;i<reserveAll.size();i++) {
			String[] example = reserveAll.get(i).getStart().split(" ");
			String[] example1 = reserveAll.get(i).getEnd().split(" ");
			int[] time = new int[2];
			switch(example[1]){
				case "09:00:00" : time[0] = 0;
					switch(example1[1]) {
					case "10:30:00" : time[1] = 0;break;
					case "12:00:00" : time[1] = 1; break;
					case "13:30:00" : time[1] = 2; break;
					case "15:00:00" : time[1] = 3; break;
					case "16:30:00" : time[1] = 4; break;
					case "18:00:00" : time[1] = 5; break;
					}
				break;
				case "10:30:00" : time[0] = 1;
					switch(example1[1]) {
						case "12:00:00" : time[1] = 1;break;
						case "13:30:00" : time[1] = 2;break;
						case "15:00:00" : time[1] = 3;break;
						case "16:30:00" : time[1] = 4;break;
						case "18:00:00" : time[1] = 5;break;
					}
				break;
				case "12:00:00" : time[0] = 2;
					switch(example1[1]) {
					case "13:30:00" : time[1] = 2;break;
					case "15:00:00" : time[1] = 3;break;
					case "16:30:00" : time[1] = 4;break;
					case "18:00:00" : time[1] = 5;break;
				}
				break;
				case "13:30:00" : time[0] = 3;
					switch(example1[1]) {
					case "15:00:00" : time[1] = 3;break;
					case "16:30:00" : time[1] = 4;break;
					case "18:00:00" : time[1] = 5;break;
				}
				break;
				case "15:00:00" : time[0] = 4;
				switch(example1[1]) {
					case "16:30:00" : time[1] = 4;break;
					case "18:00:00" : time[1] = 5; break;
				}
				break;
				case "16:30:00" : time[0] = 5; 
				switch(example1[1]) {
				
				case "18:00:00" : time[1] = 5;break;
				}
			}
			reserveAll.get(i).setTime(time);
			reserveAll.get(i).setDate(example[0]);
			
			log.info("{}",reserveAll.get(i).getTime());
			
		}
		
		
		
		
		for(int i=0;i<myreserveAll.size();i++) {
			String[] example = myreserveAll.get(i).getStart().split(" ");
			String[] example1 = myreserveAll.get(i).getEnd().split(" ");
			int[] time = new int[2];
			switch(example[1]){
				case "09:00:00" : time[0] = 0;
					switch(example1[1]) {
					case "10:30:00" : time[1] = 0;break;
					case "12:00:00" : time[1] = 1; break;
					case "13:30:00" : time[1] = 2; break;
					case "15:00:00" : time[1] = 3; break;
					case "16:30:00" : time[1] = 4; break;
					case "18:00:00" : time[1] = 5; break;
					}
				break;
				case "10:30:00" : time[0] = 1;
					switch(example1[1]) {
						case "12:00:00" : time[1] = 1;break;
						case "13:30:00" : time[1] = 2;break;
						case "15:00:00" : time[1] = 3;break;
						case "16:30:00" : time[1] = 4;break;
						case "18:00:00" : time[1] = 5;break;
					}
				break;
				case "12:00:00" : time[0] = 2;
					switch(example1[1]) {
					case "13:30:00" : time[1] = 2;break;
					case "15:00:00" : time[1] = 3;break;
					case "16:30:00" : time[1] = 4;break;
					case "18:00:00" : time[1] = 5;break;
				}
				break;
				case "13:30:00" : time[0] = 3;
					switch(example1[1]) {
					case "15:00:00" : time[1] = 3;break;
					case "16:30:00" : time[1] = 4;break;
					case "18:00:00" : time[1] = 5;break;
				}
				break;
				case "15:00:00" : time[0] = 4;
				switch(example1[1]) {
					case "16:30:00" : time[1] = 4;break;
					case "18:00:00" : time[1] = 5; break;
				}
				break;
				case "16:30:00" : time[0] = 5; 
				switch(example1[1]) {
				
				case "18:00:00" : time[1] = 5;break;
				}
			}
			myreserveAll.get(i).setTime(time);
			myreserveAll.get(i).setDate(example[0]);
			
			log.info("{}",reserveAll.get(i).getTime());
			
		}
		m.addAttribute("myreservations", myreserveAll);
		m.addAttribute("reservationItems", reserveAll);
		
		return "calendar/myReservation";
	} 
	
	@GetMapping("/reservation/reservationlist")
	public String reservelist(Model m) {
		List<OrganizationDto> organlist = organService.selectOrganAll();
		List<Reservation> reservations =  service.selectReservationAll();
		List<ReserveItem> reserveAll = service.selectReserveAll();
		

		for(int i=0;i<reserveAll.size();i++) {
			String[] example = reserveAll.get(i).getStart().split(" ");
			String[] example1 = reserveAll.get(i).getEnd().split(" ");
			int[] time = new int[2];
			switch(example[1]){
				case "09:00:00" : time[0] = 0;
					switch(example1[1]) {
					case "10:30:00" : time[1] = 0; break;
					case "12:00:00" : time[1] = 1; break;
					case "13:30:00" : time[1] = 2; break;
					case "15:00:00" : time[1] = 3; break;
					case "16:30:00" : time[1] = 4; break;
					case "18:00:00" : time[1] = 5; break;
					}
				break;
				case "10:30:00" : time[0] = 1;
					switch(example1[1]) {
						case "12:00:00" : time[1] = 1;break;
						case "13:30:00" : time[1] = 2;break;
						case "15:00:00" : time[1] = 3;break;
						case "16:30:00" : time[1] = 4;break;
						case "18:00:00" : time[1] = 5;break;
					}
				break;
				case "12:00:00" : time[0] = 2;
					switch(example1[1]) {
					case "13:30:00" : time[1] = 2;break;
					case "15:00:00" : time[1] = 3;break;
					case "16:30:00" : time[1] = 4;break;
					case "18:00:00" : time[1] = 5;break;
				}
				break;
				case "13:30:00" : time[0] = 3;
					switch(example1[1]) {
					case "15:00:00" : time[1] = 3;break;
					case "16:30:00" : time[1] = 4;break;
					case "18:00:00" : time[1] = 5;break;
				}
				break;
				case "15:00:00" : time[0] = 4;
				switch(example1[1]) {
					case "16:30:00" : time[1] = 4;break;
					case "18:00:00" : time[1] = 5; break;
				}
				break;
				case "16:30:00" : time[0] = 5; 
				switch(example1[1]) {
				
				case "18:00:00" : time[1] = 5;break;
				}
			}
			System.out.println(time[0]+"+" +time[1]);
			reserveAll.get(i).setTime(time);
			reserveAll.get(i).setDate(example[0]);
			
			log.info("{}",reserveAll.get(i).getTime());
			
		}

		m.addAttribute("reservationItems", reserveAll);
		m.addAttribute("organlist", organlist);
		m.addAttribute("reservations", reservations);
		return "calendar/reservationList";
	}

	@PostMapping("/reservation/insertreservation")
	public ResponseEntity<Map<String,Object>> insertReservation(@RequestBody Reservation reservation){
		
		int result = service.insertReservation(reservation);
		Map<String,Object> response = new HashMap<>();
		if(result>0) {
			response.put("status","success");
			response.put("message","예약물이 새로 추가되었습니다.");
		}
		else {
			response.put("status", "error");
			response.put("message","예약물 등록이 실패했습니다");
		}
		
		
		return ResponseEntity.ok(response);
	}
	
	@PostMapping("/reservation/deletereservation")
	public ResponseEntity<Map<String,Object>> deleteReservation(@RequestBody int itemKey){
		int result = service.deleteReservation(itemKey);
		Map<String,Object> response = new HashMap<>();
		if(result>0) {
			response.put("status", "success");
			response.put("message","예약물이 성공적으로 삭제되었습니다.");
		}
		else {
			response.put("status", "error");
			response.put("message", "예약물 삭제에 실패했습니다.");
		}
		
		return ResponseEntity.ok(response);
	}
	@PostMapping("/reservation/updatereservation")
	public ResponseEntity<Map<String,Object>> updateReservation(@RequestParam Reservation reservation){
		int result = service.updateReservation(reservation);
		Map<String,Object> response = new HashMap<>();
		if(result>0) {
			response.put("status", "success");
			response.put("message","예약물이 성공적으로 수정되었습니다.");
		}
		else {
			response.put("status", "error");
			response.put("message", "예약물 수정에 실패했습니다");
		}
		
		return ResponseEntity.ok(response);
	}
	@PostMapping("/reservation/updateReItem")
	public ResponseEntity<Map<String,Object>> updateReItem(@RequestBody ReserveItem reserveItem){
		Map<String,Object> response = new HashMap<>();
		System.out.println(reserveItem);
		if(reserveItem.getTime().length==1) {
			switch(reserveItem.getTime()[0]) {
				case 0 : reserveItem.setStart("09:00"); reserveItem.setEnd("10:30"); break;
				case 1 : reserveItem.setStart("10:30"); reserveItem.setEnd("12:00"); break;
				case 2 : reserveItem.setStart("12:00"); reserveItem.setEnd("13:30"); break;
				case 3 : reserveItem.setStart("13:30"); reserveItem.setEnd("15:00"); break;
				case 4 : reserveItem.setStart("15:00"); reserveItem.setEnd("16:30"); break;
				case 5 : reserveItem.setStart("16:30"); reserveItem.setEnd("18:00"); break;
			}
		}else {
			switch(reserveItem.getTime()[0]) {
				case 0: reserveItem.setStart("09:00"); break;
				case 1: reserveItem.setStart("10:30"); break;
				case 2: reserveItem.setStart("12:00"); break;
				case 3: reserveItem.setStart("13:30"); break;
				case 4: reserveItem.setStart("15:00"); break;
			}
			switch(reserveItem.getTime()[1]){
				case 1: reserveItem.setEnd("12:00"); break;
				case 2: reserveItem.setEnd("13:30"); break;
				case 3: reserveItem.setEnd("15:00"); break;
				case 4: reserveItem.setEnd("16:30"); break;
				case 5: reserveItem.setEnd("18:00"); break;
			}
		}
		int result = service.updateReCalendar(reserveItem);
		
		
		return ResponseEntity.ok(response);
	}
	
	@PostMapping("/reservation/insertre")
	public ResponseEntity<Map<String,Object>> insertre(@RequestBody ReserveItem reserveItem){
		Map<String,Object> response = new HashMap<>();
		System.out.println(reserveItem);
		if(reserveItem.getTime().length==1) {
			switch(reserveItem.getTime()[0]) {
				case 0 : reserveItem.setStart("09:00"); reserveItem.setEnd("10:30"); break;
				case 1 : reserveItem.setStart("10:30"); reserveItem.setEnd("12:00"); break;
				case 2 : reserveItem.setStart("12:00"); reserveItem.setEnd("13:30"); break;
				case 3 : reserveItem.setStart("13:30"); reserveItem.setEnd("15:00"); break;
				case 4 : reserveItem.setStart("15:00"); reserveItem.setEnd("16:30"); break;
				case 5 : reserveItem.setStart("16:30"); reserveItem.setEnd("18:00"); break;
			}
		}else {
			switch(reserveItem.getTime()[0]) {
				case 0: reserveItem.setStart("09:00"); break;
				case 1: reserveItem.setStart("10:30"); break;
				case 2: reserveItem.setStart("12:00"); break;
				case 3: reserveItem.setStart("13:30"); break;
				case 4: reserveItem.setStart("15:00"); break;
			}
			switch(reserveItem.getTime()[1]){
				case 1: reserveItem.setEnd("12:00"); break;
				case 2: reserveItem.setEnd("13:30"); break;
				case 3: reserveItem.setEnd("15:00"); break;
				case 4: reserveItem.setEnd("16:30"); break;
				case 5: reserveItem.setEnd("18:00"); break;
			}
		}
		System.out.println(reserveItem.getStart());
		System.out.println(reserveItem.getEnd());
		int result = service.insertReCalendar(reserveItem);
		if(result>0) {
			int calKey = service.selectLastInsertKey();
			System.out.println(calKey);
			System.out.println(reserveItem.getItemKey());
			int reserveResult = service.insertRes(calKey,reserveItem.getItemKey());
			if(reserveResult>0) {				
				response.put("success", true);
			}
			else {
				response.put("success", false);
			}
		}
		else {
			response.put("error", false);
		}
		return ResponseEntity.ok(response);
	}
	
}
