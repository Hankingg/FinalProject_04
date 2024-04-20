<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.Base64"%> 
 <%@ page import="java.util.Base64.Encoder"%> 
 <%@ page import="java.net.HttpURLConnection"%> 
 <%@ page import="java.net.URL" %> <%@ page import="org.json.simple.JSONObject" %> 
 <%@ page import="org.json.simple.parser.JSONParser" %> 
 <%@ page import="org.json.simple.parser.ParseException" %> 
 <%@ page import="java.io.OutputStream" %> 
 <%@ page import="java.io.InputStream" %> 
 <%@ page import="java.io.InputStreamReader" %> 
 <%@ page import="java.io.Reader" %> 
 <%@ page import="java.nio.charset.StandardCharsets" %> 
 <%@ page import="java.net.URLEncoder" %> 
 <% String orderId = request.getParameter("orderId"); String paymentKey = request.getParameter("paymentKey"); String amount = request.getParameter("amount"); 
 String secretKey = "test_sk_5OWRapdA8dbLd7Wal24YVo1zEqZK";
Encoder encoder = Base64.getEncoder(); 
byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8")); 
String authorizations = "Basic "+ new String(encodedBytes, 0, encodedBytes.length); paymentKey = URLEncoder.encode(paymentKey, StandardCharsets.UTF_8); 
URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
HttpURLConnection connection = (HttpURLConnection) url.openConnection();
connection.setRequestProperty("Authorization", authorizations); 
connection.setRequestProperty("Content-Type", "application/json"); 
connection.setRequestMethod("POST"); connection.setDoOutput(true);
JSONObject obj = new JSONObject(); obj.put("paymentKey", paymentKey); 
obj.put("orderId", orderId); obj.put("amount", amount); 
OutputStream outputStream = connection.getOutputStream();
outputStream.write(obj.toString().getBytes("UTF-8")); 
int code = connection.getResponseCode(); boolean isSuccess = code == 200 ? true : false; InputStream responseStream = isSuccess?
connection.getInputStream(): connection.getErrorStream(); Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8); JSONParser parser = new JSONParser(); JSONObject jsonObject =
(JSONObject) parser.parse(reader); responseStream.close(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
</body>
</html>