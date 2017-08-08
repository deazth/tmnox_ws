<%-- 
    Document   : get_order_sw_summ
    Created on : Aug 8, 2017, 3:51:59 PM
    Author     : S53788
--%>


<%@page import="javax.json.JsonArrayBuilder"%>
<%@page import="javax.json.JsonObjectBuilder"%>
<%@page import="javax.json.JsonArray"%>
<%@page import="java.sql.ResultSet"%>
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
                .add("install_date_start", "7/10/2017  2:30:00 PM")
                .add("install_date_end", "7/10/2017  7:30:00 PM")
                .add("install_status", "Not Started")
                .add("order_status", "Pending Processing");
    
//        accInfo.add("error", "Not Found");
    

    response.getWriter().print(accInfo.build().toString());

%>