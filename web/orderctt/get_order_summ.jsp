<%-- 
    Document   : get_order_summ.jsp
    Created on : Aug 7, 2017, 4:12:10 PM
    Author     : S53788
--%>


<%@page import="javax.json.JsonArrayBuilder"%>
<%@page import="javax.json.JsonObjectBuilder"%>
<%@page import="javax.json.JsonArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="noxcore.dbHandler"%>
<%@page import="javax.json.Json"%>
<%@page import="javax.json.JsonObject"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>

<%

  response.setContentType("application/json");
  response.addHeader("Content-Disposition", "inline");
  response.addHeader("Access-Control-Allow-Origin", "*");

  String ordernum = request.getParameter("ordernum");

  JsonObjectBuilder accInfo = Json.createObjectBuilder();

  accInfo
          .add("order_type", "New Install")
          .add("acc_name", "WINNIE HII WEN YAH")
          .add("order_status", "Processing");

        // get the list of services
  JsonArrayBuilder svcList = Json.createArrayBuilder();

  JsonObject svcs = Json.createObjectBuilder()
          .add("svc_id", "winnie1@iptv")
          .add("product_name", "HyppTV Residential")
          .add("product_code", "")
          .add("product_desc", "TM HSBB R2 Product")
          .build();

  svcList.add(svcs);
  
  svcs = Json.createObjectBuilder()
          .add("svc_id", "6084252947")
          .add("product_name", "Residential Voice")
          .add("product_code", "")
          .add("product_desc", "TM HSBB R2 Product")
          .build();

  svcList.add(svcs);
  
  svcs = Json.createObjectBuilder()
          .add("svc_id", "winnie1@unifi")
          .add("product_name", "High Speed Internet - Residential - 30 Mbps")
          .add("product_code", "")
          .add("product_desc", "TM HSBB R3 CR Product")
          .build();

  svcList.add(svcs);
  
  svcs = Json.createObjectBuilder()
          .add("svc_id", "winnie1@iptv")
          .add("product_name", "HyppTV Everywhere")
          .add("product_code", "")
          .add("product_desc", "TM HSBB R3 CR Product")
          .build();

  svcList.add(svcs);

  accInfo.add("services", svcList.build());

  response.getWriter().print(accInfo.build().toString());

%>