<%-- 
    Document   : get_order_summ.jsp
    Created on : Aug 7, 2017, 4:12:10 PM
    Author     : S53788
--%>


<%@page import="javax.json.Json"%>
<%@page import="javax.json.JsonObject"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>

<%

  response.setContentType("application/json");
  response.addHeader("Content-Disposition", "inline");
  response.addHeader("Access-Control-Allow-Origin", "*");

  String ordernum = request.getParameter("ordernum");
  
  JsonObject accInfo = Json.createObjectBuilder()
          .add("name", "Siti Pelanggan Binti Abahnye")
          .add("mobileno", "")
          .add("billmedia", "")
          .add("bp", "")
          .add("address", "")
          .add("toemail", "")
          .add("ccemail", "")
          .add("outstanding", 315.50)
          .build();
  

  response.getWriter().print(accInfo.toString());

%>