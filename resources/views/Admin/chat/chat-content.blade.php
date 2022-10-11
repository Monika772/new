
            @if(!empty($chatDetails))
               @foreach($chatDetails as $content)
                  @if($content->from_user_id==$userId)
                  <div class="media">
                     <div class="media-body text-right">
                        <p class="msg-reply mbg-primary">
                            {{$content->message}} 
                        </p>
                        <p class="time_font" > 
                           <em class="icofont icofont-wall-clock f-12"></em>  
                              <small>{{$content->created_at}}  </small>
                        </p>
                     </p>

                     </div>
                     
                     <div class="media-right friend-box">
                        <a href="#">
                        <img  id="profile_image" src="{{Auth()->user()->profile_image}}" width="50" height="50" class="img-circle ml-2" alt="User Image">
                        </a>
                     </div>
                     
                  </div>
                  @else

                     <div class="media">
                     <div class="media-left friend-box">
                        <a href="#">
                        <img class="media-object rounded-circle" src="{{$userDetails->image_url}} " alt="admin" width="50" height="50" >
                        
                        </a>
                     </div>
                     <div class="media-body">
                         <p class="msg-send">
                           {{$content->message}} 

                        <p class="time_font" >
                           <em class="icofont icofont-wall-clock f-12"></em> 
                           <small>{{$content->created_at}} </small>
                       </p>
                     </div>
                  </div>
                  @endif
                  @endforeach
                  @endif