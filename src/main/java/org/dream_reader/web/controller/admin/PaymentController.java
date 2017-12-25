/*
 * Created on 22 thg 8 2016 ( Time 15:01:35 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.dream_reader.web.controller.admin;

import java.io.IOException;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.dream_reader.bean.PaymentHistory;
import org.dream_reader.bean.User;
import org.dream_reader.bean.UserItem;
import org.dream_reader.business.service.PaymentHistoryService;
import org.dream_reader.business.service.UserService;
import org.dream_reader.web.common.AbstractController;
import org.dream_reader.web.common.ApplicationDefine;
import org.dream_reader.web.common.Login;
import org.dream_reader.web.common.utils.ConstantUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.inicis.std.util.HttpUtil;
import com.inicis.std.util.ParseUtil;
import com.inicis.std.util.SignatureUtil;

@Controller
@RequestMapping("/auth")
public class PaymentController extends AbstractController {

	// --- Variables names ( to be used in JSP with Expression Language )
	private static final String MAIN_ENTITY_NAME = "main";

	// --- JSP pages names ( View name in the MVC model )



	private static final String JSP_PAY = "auth/pay";
	private static final String JSP_MAIN = "index";

	private static final String MID = "dreammm645"; 

	private static final int PAYMENT_FINISH = 0;
	private static final int PAYMENT_IN_PROGRESS = 1;
	private static final int PAYMENT_NEED_MONEY_TRANSFER = 2;

	// Resource
	@Resource
	private UserService userService;

	@Resource
	private PaymentHistoryService paymentHistoryService;

	@RequestMapping(value = "/pay")
	public String pay(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		// 인증
		UserItem u = Login.getUserLogin(session);
		User user = userService.findById(u.getId());

		String domain = ConstantUtils.getConfig("domain");
		if (domain.equals("not found")) {
			domain = "http://localhost:8080";
		}else {
			domain ="http://"+domain;
		}
		model.addAttribute("siteDomain", domain);
		model.addAttribute("MID", MID);
		model.addAttribute("user", user);

		// mobile
		model.addAttribute("oid", user.getId());
		// web
		// 인증
		String signKey = "cVNReTZMSWhhbkN1clhDNEg0N2M5dz09"; // 가맹점에 제공된 웹 표준 사인키(가맹점 수정후 고정)

		// ###############################################
		// 2. 가맹점 확인을 위한 signKey를 해시값으로 변경 (SHA-256방식 사용)
		// ###############################################
		String mKey = SignatureUtil.hash(signKey, "SHA-256");

		/* 기타 */
		model.addAttribute("buyername", user.getUsername().substring(0, user.getUsername().indexOf("@")));
		model.addAttribute("buyertel", user.getPhone());
		model.addAttribute("buyeremail", user.getUsername());
		model.addAttribute("mKey", mKey);

		return getView();
	}

	@RequestMapping(value = "/paymentMobile/next_card")
	public String paymentNextCard(HttpSession session, HttpServletRequest request, Model model) throws Exception {

		boolean success = false;
		int state = PAYMENT_IN_PROGRESS;

		request.setCharacterEncoding("euc-kr");
		Enumeration<String> paramNames = request.getParameterNames();

		if (paramNames != null) {
			while (paramNames.hasMoreElements()) {
				String paramName = paramNames.nextElement();
				String value = request.getParameter(paramName);
			}
		}
		System.out.println("--------------Start Payment---------------");
		String P_STATUS = request.getParameter("P_STATUS");
		String P_RMESG1 = request.getParameter("P_RMESG1");
		String P_TID = request.getParameter("P_TID");
		String P_REQ_URL = request.getParameter("P_REQ_URL");
		String P_NOTI = request.getParameter("P_NOTI");
		String[] P_NOTI_S = P_NOTI.split("-");
		int money = Integer.parseInt(P_NOTI_S[0]);
		int point = Integer.parseInt(P_NOTI_S[1]);
		String paymethod = String.valueOf(P_NOTI_S[2]);
		String message = P_RMESG1;
		// log("P_NOTI:"+P_NOTI);
		// log("P_OID:"+P_OID);
		// log("phone:"+phone);
		try {
			if (P_STATUS.equals("00")) // success
			{
				P_REQ_URL = P_REQ_URL + "?P_TID=" + P_TID + "&P_MID=" + MID;
				
				
				HttpClient client = new HttpClient();
				GetMethod method = new GetMethod(P_REQ_URL);
				method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(3, false));
				HashMap<String, String> map = new HashMap<String, String>();
				try {
					int statusCode = client.executeMethod(method);

					if (statusCode != HttpStatus.SC_OK) {
					} else {
						// Read the response body.
						byte[] responseBody = method.getResponseBody(); // 승인결과 파싱
						String[] values = new String(responseBody, "EUC-KR").split("&");

						for (int x = 0; x < values.length; x++) {

							// 승인결과를 파싱값 잘라 hashmap에 저장
							int i = values[x].indexOf("=");
							String key1 = values[x].substring(0, i).trim();
							String value1 = values[x].substring(i + 1).trim();

							map.put(key1, value1);
						}
					}
				} catch (HttpException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					// Release the connection.
					method.releaseConnection();
				}
				
				
				
				if (map != null && map.size() > 0) {
					P_STATUS = map.get("P_STATUS");
					if (P_STATUS.equals("00")) {
						P_TID = map.get("P_TID");
						String P_UNAME = map.get("P_UNAME");
						int userId = Integer.parseInt(map.get("P_OID"));
						success = paymentSuccessProcess(userId, P_TID, money, point, paymethod, session);

						System.out.println("userId: " + userId);
						if (!success) {
							System.out.println("Not Success - Message: " + message);
							System.out.println("need cancel payment, tid: " + P_TID);
						} else {
							System.out.println("Success");
							state = PAYMENT_FINISH;
						}
					} else {
						message = map.get("P_RMESG1");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("---------Finish Payment-----------------");
		System.out.println("code: "+ P_STATUS);
		System.out.println("success: "+ success);
		System.out.println("message: "+ message);
		
		model.addAttribute("P_STATUS", P_STATUS);
		model.addAttribute("success", success);
		model.addAttribute("state", state);
		model.addAttribute("message", message);

		return "redirect:/"+JSP_MAIN;
	}

	@RequestMapping(value = "/paymentWeb/returnUrl")
	public String returnUrl(HttpSession session, HttpServletRequest request, Model model) throws Exception {

		boolean success = false;
		UserItem user = Login.getUserLogin(session);
		request.setCharacterEncoding("UTF-8");

		Map<String, String> paramMap = new Hashtable<String, String>();

		Enumeration elems = request.getParameterNames();

		String temp = "";

		while (elems.hasMoreElements()) {
			temp = (String) elems.nextElement();
			paramMap.put(temp, request.getParameter(temp));
		}

		System.out.println("paramMap : " + paramMap.toString());
		// #####################
		// 인증이 성공일 경우만
		// #####################
		if ("0000".equals(paramMap.get("resultCode"))) {
			System.out.println("####인증성공/승인요청####");

			// ############################################
			// 1.전문 필드 값 설정(***가맹점 개발수정***)
			// ############################################

			String mid = paramMap.get("mid"); // 가맹점 ID 수신 받은 데이터로 설정

			String signKey = "SU5JTElURV9UUklQTEVERVNfS0VZU1RS"; // 가맹점에 제공된 키(이니라이트키) (가맹점 수정후 고정) !!!절대!! 전문 데이터로 설정금지

			String timestamp = SignatureUtil.getTimestamp(); // util에 의해서 자동생성

			String charset = "UTF-8"; // 리턴형식[UTF-8,EUC-KR](가맹점 수정후 고정)

			String format = "JSON"; // 리턴형식[XML,JSON,NVP](가맹점 수정후 고정)

			String authToken = paramMap.get("authToken"); // 취소 요청 tid에 따라서 유동적(가맹점 수정후 고정)

			String authUrl = paramMap.get("authUrl"); // 승인요청 API url(수신 받은 값으로 설정, 임의 세팅 금지)

			String netCancel = paramMap.get("netCancelUrl"); // 망취소 API url(수신 받은 값으로 설정, 임의 세팅 금지)

			String ackUrl = paramMap.get("checkAckUrl"); // 가맹점 내부 로직 처리후 최종 확인 API URL(수신 받은 값으로 설정, 임의 세팅 금지)

			String cardnum = paramMap.get("cardnum"); // 갤러리아 카드번호(카드끝자리 '*' 처리) 2016-01-12

			// #####################
			// 2.signature 생성
			// #####################
			Map<String, String> signParam = new HashMap<String, String>();

			signParam.put("authToken", authToken); // 필수
			signParam.put("timestamp", timestamp); // 필수

			// signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
			String signature = SignatureUtil.makeSignature(signParam);

			String price = ""; // 가맹점에서 최종 결제 가격 표기 (필수입력아님)

			// 1. 가맹점에서 승인시 주문번호가 변경될 경우 (선택입력) 하위 연결.
			// String oid = "";

			// #####################
			// 3.API 요청 전문 생성
			// #####################
			Map<String, String> authMap = new Hashtable<String, String>();

			authMap.put("mid", mid); // 필수
			authMap.put("authToken", authToken); // 필수
			authMap.put("signature", signature); // 필수
			authMap.put("timestamp", timestamp); // 필수
			authMap.put("charset", charset); // default=UTF-8
			authMap.put("format", format); // default=XML
			// authMap.put("price" ,price); // 가격위변조체크기능 (선택사용)

			System.out.println("##승인요청 API 요청##");

			HttpUtil httpUtil = new HttpUtil();

			try {

				// #####################
				// 4.API 통신 시작
				// #####################

				String authResultString = "";

				authResultString = httpUtil.processHTTP(authMap, authUrl);

				// ############################################################
				// 5.API 통신결과 처리(***가맹점 개발수정***)
				// ############################################################

				String test = authResultString.replace(",", "&").replace(":", "=").replace("\"", "").replace(" ", "")
						.replace("\n", "").replace("}", "").replace("{", "");

				// out.println("<pre>"+authResultString.replaceAll("<", "&lt;").replaceAll(">",
				// "&gt;")+"</pre>");

				Map<String, String> resultMap = new HashMap<String, String>();

				resultMap = ParseUtil.parseStringToMap(test); // 문자열을 MAP형식으로 파싱

				System.out.println("resultMap == " + resultMap);

				Map<String, String> secureMap = new HashMap<String, String>();
				secureMap.put("mid", mid); // mid
				secureMap.put("tstamp", timestamp); // timestemp
				secureMap.put("MOID", resultMap.get("MOID")); // MOID
				secureMap.put("TotPrice", resultMap.get("TotPrice")); // TotPrice
				
				// signature 데이터 생성
				String secureSignature = SignatureUtil.makeSignatureAuth(secureMap);
				/************************* 결제보안 강화 2016-05-18 END ****************************/
				
				if("0000".equals(resultMap.get("resultCode")) && secureSignature.equals(resultMap.get("authSignature")) ){
					success= true;
					String paymethod =resultMap.get("payMethod");
					int money = Integer.valueOf(resultMap.get("TotPrice"));
					
//					int point  = Integer.parseInt(String.valueOf(resultMap.get("goodName")).replace("?", "").replace(" ", ""));
					int point  = Integer.parseInt(String.valueOf(resultMap.get("goodName")).replace("꿈교환권", "").replace("장", "").replace(" ", ""));
					success = paymentSuccessProcess(user.getId(), resultMap.get("tid"), money, point, paymethod, session);
				}else {
					success= false;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("---------Finish Payment-----------------");
		System.out.println("code: "+ paramMap.get("resultCode"));
		System.out.println("success: "+ success);
		System.out.println("message: "+ paramMap.get("resultMsg"));
		

		return "redirect:/"+JSP_MAIN;
	}

	private boolean paymentSuccessProcess(Integer userId, String tid, Integer money, Integer point, String paymethod,
			HttpSession session) {
		boolean success = false;

		try {
			PaymentHistory p = new PaymentHistory();
			p.setCreateDate(new Date());
			p.setUserId(userId);
			p.setStatus(ApplicationDefine.Payment_Status.Success.getCode());
			p.setPaymentMethod(paymethod);
			p.setMoney(money);
			p.setPoint(point);
			p.setUpdateDate(new Date());
			p.setUserId(userId);
			p.setTid(tid);
			p = paymentHistoryService.create(p);

			User u = userService.findById(userId);
			u.setPoint(u.getPoint() + point);
			u.setUpdateDate(new Date());
			User userUpdate = userService.update(u);

			UserItem userItem = Login.getUserLogin(session);
			userItem.setPoint(userUpdate.getPoint());
			Login.saveUser(userItem, session);

			success = true;

		} catch (Exception e) {
			e.printStackTrace();
			return success;
		}

		return success;
	}

	private HashMap<String, String> requestApproval(String reqUrl) {
		HttpClient client = new HttpClient();
		GetMethod method = new GetMethod(reqUrl);
		method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler(3, false));
		HashMap<String, String> map = new HashMap<String, String>();

		try {
			int statusCode = client.executeMethod(method);

			if (statusCode != HttpStatus.SC_OK) {
			} else {
				// Read the response body.
				byte[] responseBody = method.getResponseBody(); // 승인결과 파싱
				String[] values = new String(responseBody, "EUC-KR").split("&");

				for (int x = 0; x < values.length; x++) {

					// 승인결과를 파싱값 잘라 hashmap에 저장
					int i = values[x].indexOf("=");
					String key1 = values[x].substring(0, i).trim();
					String value1 = values[x].substring(i + 1).trim();

					map.put(key1, value1);
				}
			}
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// Release the connection.
			method.releaseConnection();
		}
		return map;
	}
	
	@RequestMapping(value = "/paymentWeb/close")
	public String close(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return getView();
	}
	
	@RequestMapping(value = "/paymentWeb/popup")
	public String popup(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return getView();
	}
}