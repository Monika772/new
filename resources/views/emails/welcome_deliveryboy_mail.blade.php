<h1>Confirmed and active Your account</h1>
<table style="margin-bottom:0.0px;margin-left:auto;margin-right:auto;margin-top:0.0px;" width="100%" cellspacing="0" cellpadding="0" border="0">
    <tbody>
       <tr>
         <td align="center">
           
           <table style="margin-bottom:0.0px;margin-left:auto;margin-right:auto;margin-top:0.0px;max-width:600.0px;min-width:370.0px;width:100.0%; background:url({{url('storage/app/email/OTP')}}/Email-Template.png); height:100%;" cellspacing="0" cellpadding="0" border="0" >
                <tbody >
                    <tr style="height:200px;">
                        
                    </tr>
                   
                    <tr style="text-align:center;height:160px; ">
                      
                            <td style="font-size:40px; font-weight:600; color:#000; font-family: 'Lato', sans-serif;">
                           Welcome to<br> <span style="color:#0096c0;">{{env('APP_NAME')}}  !!!</span>
                            </td>
                         </tr>
                   <tr style="text-align:center;height:90px;">
                      
                    </tr>

                   <tr style="text-align:center;height:70px;">
                        <td style="font-size:16px; font-weight:500; color:#000; font-family: 'Lato', sans-serif; padding:0 40px;">
                         
                         {{$bodyyy}}
                        </td>
                        <td style="font-size:22px; font-weight:500; color:#000; font-family: 'Lato', sans-serif; padding:0 40px;">
                           Email  :{{$email}} <br>
                           Password :{{$password}}
                        </td>
                    </tr>
               
               
                 <tr style="text-align:center;height:40px;font-size:23px; font-weight:500; color:#000;">
                    <td style="font-size:22px; font-weight:500; color:#000; font-family: 'Lato', sans-serif; padding:0 40px;">
                    </td>
                 </tr>

              
                 <tr style="height:90px;">
                        <td style="text-align:center; color:#fff; font-size:40px; padding-top:50px;">
                               Contact Us
                            </td>
                 </tr>

                 <tr style="height:90px;">
                        <td style="text-align:center;">
                            <img src="{{url('storage/app/email/OTP')}}/facebook.png"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="{{url('storage/app/email/OTP')}}/instagram.png">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<img src="{{url('storage/app/email/OTP')}}/g+.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <img src="{{url('storage/app/email/OTP')}}/linkedin.png">
                        </td>
                 </tr>

                 <tr>
                 <td>
                 Regards,<br>
                     Team {{env('APP_NAME')}} <br> 
                      <!-- <img src="{{url('storage/app')}}/logo.png">   -->
                     </td>
                 </tr>
                
                </tbody>
             </table>
          </td>
       </tr>
    </tbody>
 </table>
