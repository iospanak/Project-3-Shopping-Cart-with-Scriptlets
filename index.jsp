<!-- 
    Document   : index
    Created on : 11 Δεκ 2011, 4:36:38 μμ
    Author     : Ioannis
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%! double coffeorder= 0.0;%>
        <%! double coffeprice= 0.0;%>
        <%! double sugarorder= 0.0;%>
        <%! double sugarprice= 0.0;%>
        <%! double waterorder= 0.0;%>
        <%! double waterprice= 0.0;%>
        <%! String coffetemp="0.0" ;%>
        <%! String sugartemp="0.0" ;%>
        <%! String watertemp="0.0" ;%> 
        <% coffeprice = Double.parseDouble(application.getInitParameter("CoffePrice")); %>
        <% sugarprice = Double.parseDouble(application.getInitParameter("SugarPrice")); %>
        <% waterprice = Double.parseDouble(application.getInitParameter("WaterPrice")); %>
        
       
        <%HttpSession ses = request.getSession();%>
        <% if((request.getParameter("Coffe")) != null) coffeorder = Double.parseDouble(request.getParameter("Coffe")); %>    
        <% if((request.getParameter("Sugar")) != null) sugarorder = Double.parseDouble(request.getParameter("Sugar")); %>
        <% if((request.getParameter("Water")) != null) waterorder = Double.parseDouble(request.getParameter("Water")); %>
        
        
        
        <% if(request.getParameter("Coffe")==null){%>
        <% Cookie[] cookies = request.getCookies(); %>
        <% if(cookies != null ){%>
        <% for(int i=0;i<cookies.length;i++){%>
        <% Cookie cookie = cookies[i] ; %>
        <% if(cookie.getName().equals("coffe")) coffetemp = cookie.getValue();%>
        <% if(cookie.getName().equals("sugar")) sugartemp = cookie.getValue();%>
        <% if(cookie.getName().equals("water")) watertemp = cookie.getValue();}}}%>
       
       
        <% if(request.getParameter("Coffe")!=null){%>
        <% coffetemp = request.getParameter("Coffe");%>
        <% sugartemp = request.getParameter("Sugar");%>
        <% watertemp = request.getParameter("Water");}%>
         
       
        <%Cookie coffeck = new Cookie("coffe",coffetemp);%>
        <%Cookie sugarck = new Cookie("sugar",sugartemp);%>
        <%Cookie waterck = new Cookie("water",watertemp);%>
        <%coffeck.setMaxAge(12*60*60);%>
        <%sugarck.setMaxAge(12*60*60);%>
        <%waterck.setMaxAge(12*60*60);%>
        <%response.addCookie(coffeck);%>
        <%response.addCookie(sugarck);%>
        <%response.addCookie(waterck);%>
       
        
     <form action="index.jsp" method="POST">
       
         <table border="1" cellpadding="1" width="1">
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Coffe</td>
                    <td><%= coffeprice %></td>
                    <td><input type="text" value="<%= coffetemp %>" name="Coffe"/></td>
                    <td><%= (coffeorder*coffeprice) %></td>
                </tr>
                <tr>
                    <td>Sugar</td>
                    <td><%= sugarprice %></td>
                    <td><input type="text" value="<%= sugartemp %>" name="Sugar"/></td>
                    <td><%= (sugarprice*sugarorder) %></td>
                </tr>
                <tr>
                    <td>Water</td>
                    <td><%= waterprice%></td>
                    <td><input type="text" value="<%= watertemp %>" name="Water"/></td>
                    <td><%= (waterprice*waterorder) %></td>
                </tr>
                <tr>
                    <td>Grand Total</td>
                    <td></td>
                    <td></td>
                    <td><%= (coffeorder*coffeprice)+(sugarprice*sugarorder)+(waterprice*waterorder)%> </td>
                </tr>
            </tbody>
        </table>
                <input type="submit" value="CASHIER" />
        </form>
                
                <form action="http://iospanak.wordpress.com/2011/12/14/project-3-shopping-cart-report-with-scriptlets/" method="GET">
                    <input type="submit" value="Report" />
                </form>
                <form>
                        <input type="submit" value="CODE" />
                </form>   
    </body>
</html>
