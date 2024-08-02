package com.project.npnc.document.member.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;

import com.project.npnc.document.model.dto.Approver;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class DocHtmlController {
	@Value("${file.upload-dir}")
    private String uploadDir; // src/main/resources/upload/

	public static String generateApproverTableHtml(List<Approver> ap) {
		StringBuilder apTable = new StringBuilder();
		apTable.append("<table id=\"approverTable\">")
				.append("<thead><tr>");
		//헤더
		ap.forEach(e->{ 
			apTable.append("<th>")
					.append(e.getCategory())
					.append("</th>");
		});
		apTable.append("</th></thead>");
		
		//첫번째 행
		apTable.append("<tbody>")
				.append("<tr>");
		ap.forEach(e->{ 
			apTable.append("<td>")
					.append(e.getMemberTeamName() + "<br>" + e.getMemberJobName() + "&nbsp;" +e.getMemberName())
					.append("</td>");
		});
		
		//두번째행
		 apTable.append("</tr>")
		 		.append("<tr style=\"height: 25px;\">");
		
		ap.forEach(e->{
			if(e.getCategory().equals("기안")) {
				apTable.append("<td>")
					.append(e.getMemberName())
					.append("</td>");
			}else {
				apTable.append("<td>")
						.append("<span class=\"signature\">[" + e.getErApproverKey() + " 서명]</span>")
						.append("</td>");
			}
		});
		// 현재 시간을 LocalDateTime 객체로 가져오기
        LocalDateTime now = LocalDateTime.now();

        // 날짜 및 시간 형식 지정
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");

        // 형식에 맞춘 문자열로 변환
        String formattedNow = now.format(formatter);
        
		//세번째행
		apTable.append("</tr>")
				.append("<tr style=\"height: 25px;\">");
		ap.forEach(e->{ 
			if(e.getCategory().equals("기안")) {
				apTable.append("<td>")
				.append(formattedNow)
				.append("</td>");
			}else {
				apTable.append("<td>")
						.append("<span class=\"signature\">[" + e.getErApproverKey() + " 일시]</span>")
						.append("</td>");
			}
		});
		apTable.append("</tr>")
				.append("</tbody></table>");
		
		
		String finalTableHtml = apTable.toString();
		return finalTableHtml;
	}
	//결재 승인시
	public static String updateApproverTableHtml(String html, Approver a) {
		log.debug("----- 문서 html 업데이트 -----");
		log.debug("{}", a);
		System.out.println(html.contains("<span class=\"signature\">[" + a.getErApproverKey() + " 서명]</span>"));
		String newhtml = html.replace("<span class=\"signature\">[" + a.getErApproverKey() + " 서명]</span>", 
				a.getMemberName());
		
		// 현재 시간을 LocalDateTime 객체로 가져오기
        LocalDateTime now = LocalDateTime.now();

        // 날짜 및 시간 형식 지정
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        
        System.out.println(html.contains("<span class=\"signature\">[" + a.getErApproverKey() + " 일시]</span>"));
        // 형식에 맞춘 문자열로 변환
        String formattedNow = now.format(formatter);
		newhtml = newhtml.replace("<span class=\"signature\">[" + a.getErApproverKey() + " 일시]</span>", 
				formattedNow);
		log.debug(a.getMemberName() + " " + a.getCategory() + ", "+ formattedNow + " -> html 결재라인 업데이트 완료");
		return newhtml;
	}
	//html 파일 읽기
	public static String readHtmlFile(String dir, String title, String uploadDir) {
        String path = uploadDir + dir + "/" + title;
        log.debug("문서 읽기 경로 : " + path);
        File file = new File(path);
        StringBuilder content = new StringBuilder();

        try (BufferedReader br = new BufferedReader(
              new InputStreamReader(
                    new FileInputStream(file), StandardCharsets.UTF_8))) {
            String line;
            while ((line = br.readLine()) != null) {
                content.append(line).append("\n");
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return content.toString();
  }
	
}
