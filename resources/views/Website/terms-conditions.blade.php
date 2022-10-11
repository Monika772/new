<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{env('APP_NAME')}}</title>
    <meta name="description" content="{{env('APP_NAME')}}">
    <meta name="keywords" content="{{env('APP_NAME')}}">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Pinyon+Script" rel="stylesheet">
    </hrad>
    <style>
    .headingClass {padding-left:20px;padding-right:20px;font-size:18px}
    .lebelHeading {padding-left:20px}
    </style>
    <body>
    <div class="privacy-policy container">
      <h1 style="text-align: center">{!!$terms->title!!}</h1>
      {!!$terms->content!!}
   </div>

</body>
</html>
