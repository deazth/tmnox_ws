<%-- 
    Document   : template to get data using DB.jsp
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

    dbHandler dbh = new dbHandler();

    // account info
    String sql = "select * from order_s_acc where order_num = '" + ordernum + "'";

    ResultSet rs = dbh.execSelect(sql);

    JsonObjectBuilder accInfo = Json.createObjectBuilder();

    if (rs.next()) {
        accInfo
                .add("order_type", dbHandler.getStr(rs, "order_type"))
                .add("acc_name", dbHandler.getStr(rs, "account_name"))
                .add("order_status", dbHandler.getStr(rs, "order_status"));

        // get the list of services
        sql = "select * from order_s_svc where order_num = '" + ordernum + "'";
        rs = dbh.execSelect(sql);

        JsonArrayBuilder svcList = Json.createArrayBuilder();

        while (rs.next()) {
            JsonObject svcs = Json.createObjectBuilder()
                    .add("svc_id", dbHandler.getStr(rs, "svc_id"))
                    .add("product_name", dbHandler.getStr(rs, "product_name"))
                    .add("product_code", dbHandler.getStr(rs, "product_code"))
                    .add("product_desc", dbHandler.getStr(rs, "product_desc"))
                    .build();

            svcList.add(svcs);
        }

        accInfo.add("services", svcList.build());
    } else {
        accInfo.add("error", "Not Found");
    }

    dbh.close();

    response.getWriter().print(accInfo.build().toString());

%>