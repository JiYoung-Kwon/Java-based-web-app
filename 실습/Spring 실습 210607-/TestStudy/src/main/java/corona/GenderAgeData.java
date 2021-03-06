package corona;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.io.BufferedReader;
import java.io.IOException;

//업데이트 시간 여유롭게 3시
@Component
public class GenderAgeData {
	@Autowired
	GenderAgeDao dao;

	public void parsingGenderAge() throws IOException {
		List<GenderAgeVo> list = new ArrayList<GenderAgeVo>();

		String key = "CixGmUHaUR%2FsF46havl6Z9WygXCsGidMQt4T59ncgvi5FXE8vGdroGofU4sTFY9Hp6u7ljkB2KKghtFp9mVDxA%3D%3D";

		String parsingURL = "";

		// 현재 날짜, 일주일 전 날짜
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		String curDate = sdf.format(cal.getTime());

		System.out.println(curDate);

		// Data URL
		StringBuilder urlBuilder = new StringBuilder(
				"http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19GenAgeCaseInfJson"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + key); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "="
				+ URLEncoder.encode("-", "UTF-8")); /* 공공데이터포털에서 받은 인증키 */
		urlBuilder
				.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
				+ URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
		urlBuilder.append("&" + URLEncoder.encode("startCreateDt", "UTF-8") + "="
				+ URLEncoder.encode(curDate, "UTF-8")); /* 검색할 생성일 범위의 시작 */
		urlBuilder.append("&" + URLEncoder.encode("endCreateDt", "UTF-8") + "="
				+ URLEncoder.encode(curDate, "UTF-8")); /* 검색할 생성일 범위의 종료 */

		// URL 객체 생성 후, URL 호출
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET"); // 응답 방식 - GET
		conn.setRequestProperty("Content-type", "application/json"); // 응답 헤더 - application/json 방식

		// 응답 코드
		System.out.println("Response code: " + conn.getResponseCode());

		// InputStreamReader 값을 담을 BufferedReader
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}

		// 받은 데이터를 Builder에 담기
		StringBuilder sb = new StringBuilder();
		String line;

		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}

		// BufferedReader 닫기
		rd.close();

		// HttpURLConnection 닫기
		conn.disconnect();

//		System.out.println(sb.toString());

		System.out.println("===================================================");
		// XML -> DATA 파싱
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder;
		try {
			dBuilder = dbFactory.newDocumentBuilder();

			// 파싱할 URL
			parsingURL = url.toString();
			// 페이지에 접근해줄 Document 객체 생성
			// doc 객체로 파싱할 url 요소 읽기
			Document doc = dBuilder.parse(parsingURL);

			// Tree 구조 node 로 변환
			doc.getDocumentElement().normalize();

			// root tag 값 확인
			System.out.println("Root element : " + doc.getDocumentElement().getNodeName());

			// 파싱할 데이터 tag의 리스트 수
			NodeList nList = doc.getElementsByTagName("item"); // <item> 태그요소
			System.out.println("파싱할 리스트 수 : " + nList.getLength());

			for (int i = 0; i < nList.getLength(); i++) {
				Node nNode = nList.item(i); // <item> i 값 nNode에 넣기

				// Element node type 비교
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					GenderAgeVo vo = new GenderAgeVo();
					Element eElement = (Element) nNode;

					System.out.println("========================");
//					System.out.println("구분(성별,연령별) : " + getTagValue("gubun", eElement));
//					System.out.println("확진자 : " + getTagValue("confCase", eElement));
//					System.out.println("확진률 : " + getTagValue("confCaseRate", eElement));
//					System.out.println("사망자 : " + getTagValue("death", eElement));
//					System.out.println("사망률 : " + getTagValue("deathRate", eElement));
//					System.out.println("치명률 : " + getTagValue("criticalRate", eElement));
					
					String stdDate = getTagValue("createDt", eElement);
					vo.setStdDay(stdDate.substring(0,4)+stdDate.substring(5,7)+stdDate.substring(8,10));
					vo.setGubun(getTagValue("gubun", eElement));

					vo.setConfCase(Integer.parseInt(getTagValue("confCase", eElement)));
					vo.setConfCaseRate(Float.parseFloat(getTagValue("confCaseRate", eElement)));
					vo.setDeath(Integer.parseInt(getTagValue("death", eElement)));
					vo.setDeathRate(Float.parseFloat(getTagValue("deathRate", eElement)));
					vo.setCriticalRate(Float.parseFloat(getTagValue("criticalRate", eElement)));

					list.add(vo);
				}

			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 데이터 갱신이 느린 경우가 있어서 데이터가 없으면 갱신을 안함
		if (list.size() != 0) {
			dao.delete();
			String msg = dao.insert(list);
			System.out.println("총 삽입 결과 : " + msg);
		}

	}

	// tag 값의 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement) {

		NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nList.item(0);

		if (nValue == null) {
			return null;
		}

		return nValue.getNodeValue();
	}
}