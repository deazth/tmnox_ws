<%-- 
    Document   : get_acc_info
    Created on : Jun 5, 2017, 2:17:23 PM
    Author     : S53788
--%>

<%@page import="javax.json.Json"%>
<%@page import="javax.json.JsonObject"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>

<%

  response.setContentType("application/json");
  response.setHeader("Content-Disposition", "inline");

  String bano = request.getParameter("bano");
  
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