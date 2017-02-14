<%-- 
    Document   : order
    Created on : Feb 7, 2017, 3:13:05 PM
    Author     : John Phillips
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lucas's JSP Pizza Order</title>
    </head>
    <body>
        <h1>Order Results</h1>

<!--    We could use <%= request.getParameter("email")%> here but the 
        JSP EL Expression Language has a nicer syntax
        -->
        <p>Email = ${param.email}</p>
        <p>Size = ${param.size}</p>
        <p>Crust = ${param.crust}</p>
        
        <!-- 
            The following starts the jsp integration into html. jsp uses special syntax to denote whether it should be compiled and ran as java or html.
        it uses the left angle bracket and a percent sign to initiate the block and a percent right angle bracket to close it. The following code defines
        a double variable so that the cost can include a decimal point. I then initiate two string variables so I don't have to keep typing in 
        request.getParameter for the crust and size. Next I use if statements to check if the string is equal to the text "hand", "small", and "medium" etc.
        It's good to note that you must use .equals instead of == because java will be trying to see if the crust object is equal to the "crust" string.
        I use the built in += to increment the cost variable (same as cost = cost + N).I then output the total cost after the final bracket for the topping
        check to display the total cost even if there aren't any toppings.
        -->
        <p>Total Cost: <%
            double cost = 0;
            String crust = request.getParameter("crust");
            String size = request.getParameter("size");
            if (crust.equals("pan")) {
                cost += 1.0;
            }else if(crust.equals("hand")){
                cost += 0.5;
            }
            
            if(size.equals("small")){
                cost += 5.0;
            }else if(size.equals("medium")){
                cost+=6.0;
            }else if(size.equals("large")){
                cost+=7.0;
            }
            
            // Checkboxes from a form may or may not be checked. We can use the
            // following code to get an array of the values that are checked.
            String toppings[] = request.getParameterValues("toppings");
            if (toppings != null && toppings.length != 0) {
                out.println("<p>Toppings: ");
                for (String myTopping : toppings) {
                    out.println(myTopping + ", ");
                    cost+= 0.75;
                }
                out.println("</p>");
                
            }
            out.println("<p>Total Cost: $"+cost+"</p");
        %>
    </body>
</html>
