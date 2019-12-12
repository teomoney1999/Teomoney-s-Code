<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Job Finder &mdash; Colorlib Website Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700|Work+Sans:300,400,700" rel="stylesheet">
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
  
    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
    
    <link rel="stylesheet" href="css/loginStyle.css">
    
  </head>

  <body>
        <section class='login-form-section'> 
        <div class="container login-form-container"> 
            <div class="row login-form-row">
            <h2 class='login-title'>Login to <a href='#'>QUALK</a></h2>
            <p style='color:red'>${errorString}</p>
            <form action="${pageContext.request.contextPath}/login" method='POST'>
              
                <div class='input-form' id='user'>
                <input class='input'  type='text' placeholder='UserID' name='username'>
                <!-- <button  class='submit-btn'><i class="fa fa-arrow-circle-right" aria-hidden="true"></i></button> -->
                
                </div>
                <div class='input-form' id='pass'>
                <input class='input' id='input-pass' type='password' placeholder='Password' name='password'>
                <button  class='submit-btn' ><i class="fa fa-arrow-circle-right" aria-hidden="true"></i></button>
                </div>
                <div class='remember-btn'>
                <input id='remember-checkbox' type='checkbox' value='rementerMe'><span id='remember-me'>Remember-me</span>
                </div>
            </form>
            <div id='separator'></div>
            <div class='not-sign-in'>
                <a href='#' class='option'>Forgot UserID or Password</a>
                <div class='option'>Don't have a UserID?<span><a href='#' class='option'> Create your now</a></span>
            </div>
    
            </div>
    
    
        </div>
    
    </section>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
    var firstSubmit = $('#firstSubmit');
    var firstForm = $('#user-first'); 
    var user = $('#user');
    var pass = $('#pass');

    $(function(){
        firstSubmit.click(function(){
            firstForm.hide(); 
            user.show(); 
            pass.slideDown(3000);
        });
    });
    console.log("SUCCESS");
</script>
</body>
</html>

