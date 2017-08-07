<%-- 
    Document   : get_order_s_svc
    Created on : Aug 7, 2017, 11:53:58 PM
    Author     : JackS
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

    dbHandler dbh = new dbHandler();

    JsonObjectBuilder accInfo = Json.createObjectBuilder();

    // get the list of services
    String sql = "select * from order_s_svc where order_num = '" + ordernum + "'";
    ResultSet rs = dbh.execSelect(sql);

    JsonArrayBuilder svcList = Json.createArrayBuilder();
    int svcCount = 0;

    while (rs.next()) {
        svcCount++;
        JsonObject svcs = Json.createObjectBuilder()
                .add("svc_id", dbHandler.getStr(rs, "svc_id"))
                .add("product_name", dbHandler.getStr(rs, "product_name"))
                .add("product_code", dbHandler.getStr(rs, "product_code"))
                .add("product_desc", dbHandler.getStr(rs, "product_desc"))
                .build();

        svcList.add(svcs);
    }

    if(svcCount > 0){
        accInfo.add("services", svcList.build());
    } else {
        accInfo.add("error", "Not Found");
    }
    
    dbh.close();

    response.getWriter().print(accInfo.build().toString());

%>
