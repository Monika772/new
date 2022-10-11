<!DOCTYPE html>
<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <title>500 Error Page | OkRecharge</title>
       <link rel="stylesheet" href="{{URL::TO('public/css/error-page.css')}}">
   </head>
   <body>
      <div id="error-page">
         <div class="content">
            <h2 class="header" data-text="500">
               500
            </h2>
            <h4 data-text="Opps! Page not found">
               Opps! Somethinhg went wrong
            </h4>
            <p>
               Sorry, Somethinhg is went wrong. Please try after sometime.
            </p>
            <div class="btns">
               <a href="{{url('/')}}">return home</a>
             </div>
         </div>
      </div>
   </body>
</html>