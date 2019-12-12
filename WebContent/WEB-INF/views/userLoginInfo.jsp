<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

   <html>
   <head>
      <meta charset="UTF-8">
      <title>Login Info</title>
   </head>
   <body>
 
    
 
    <h3>Hello: ${loginedUser.userName}</h3>
 
    ID: <b>${loginedUser.iD}</b>
    User Name: <b>${loginedUser.userName}</b><br>
    Password: <b>${loginedUser.password}</b><br>
    Email: <b>${loginedUser.email}</b><br>
    <br />
   
 

 
 </body>
</html>