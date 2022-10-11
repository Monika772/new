<?php
use Illuminate\Support\Facades\Log;

if (! function_exists('include_route_files')) {
    /**
     * Loops through a folder and requires all PHP files
     * Searches sub-directories as well.
     *
     * @param $folder
     */
    function include_route_files($folder)
    {
        try {
            $rdi = new recursiveDirectoryIterator($folder);
            $it = new recursiveIteratorIterator($rdi);

            while ($it->valid()) {
                if (! $it->isDot() && $it->isFile() && $it->isReadable() && $it->current()->getExtension() === 'php') {
                    require $it->key();
                }

                $it->next();
            }
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }
}


if (! function_exists('otp_genrater')) {
    /**
     * this code genrate rendom number to given digits.
     *
     * @param $digits
     */
    function otp_genrater($digits)
    {
        return "1212";
        return rand(1111,9999);
    }
}



if (! function_exists('send_sms')) {
    function send_sms($mobileNumber,$message){
    
        $senderId   = "TXTALR";
        $route      = "4";
        $message    = str_replace(" ","%20",$message);
        $authKey     = "61dfdcd40dccbbab0f02a11506c34b7c";
        if(!empty($mobileNumber)){
            $postData = array(
                'authkey' => $authKey,
                'mobiles' => $mobileNumber,
                'message' => $message,
                'sender' => $senderId,
                'route' => $route
            );
          
            Log::debug('postData check', ['postData' => $postData]);
            $url = "http://sms.bulksmsserviceproviders.com/api/send_http.php";
            $ch = curl_init();
            curl_setopt_array($ch, array(
                CURLOPT_URL => $url,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_POST => true,
                CURLOPT_POSTFIELDS => $postData
                //,CURLOPT_FOLLOWLOCATION => true
            ));
            //Ignore SSL certificate verification
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
            //get response
            $output = curl_exec($ch);
            //Print error if any
            if (curl_errno($ch)) {
                echo 'error:' . curl_error($ch);
            }
            curl_close($ch);
            Log::debug('smsapi check', ['output' => $output]);
            $res = true;
        }else{
            $res = false;
        }
        return $res;
    }



}


 
if (! function_exists('push_notification')) {
    function push_notification($token="",$type="",$body="")
    {
        $fcmUrl = 'https://fcm.googleapis.com/fcm/send';

       /*$token='eDwpnjFVcbU:APA91bFqK1ddmO9GgHcC51xJG1MjkCSHOw_UZDlp095ULyR8Gh9GbIN-XAw1khy7JPyi5wbZktRburbRb7uNqfyMI6BIzVp0VHhzRNuKeG5_lMAucBNRo5yzktKg-kLrITqERsWKpmnz';
        $notification = [
            'body' => 'this is test',
            'sound' => true,
        ];*/

        $data = [
            'body' => $body,
            'notification_type' => $type
            
        ];
        
        $extraNotificationData = ["bundle_data" => json_encode($data)];

        $fcmNotification = [
            //'registration_ids' => $tokenList, //multple token array
            'to'        => $token, //single token
            //'notification' => $notification,
            'data' => $extraNotificationData
        ];

        $headers = [
            'Authorization: key=AAAAqmqhTBA:APA91bF5h_YLa8py7350xg6dNUu9b7VkwyZge_DtxzqHOwKYETcrVJpqd4tRZ9mX0WQJ5xleilWR5bk1CigIsKKsF3fFgOI5TQiUqgt2NJ_yGwHS50cZQPFBlc8y2Si8SN0b0qj-u4oM',
            'Content-Type: application/json'
        ];


        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,$fcmUrl);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fcmNotification));
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
        // print_r(json_decode($result));die;
       
        
    }

}

 function getNextOrderNumber()
{
    $lastOrder = App/Models/Order::orderBy('created_at', 'desc')->first();
     if ( ! $lastOrder )
       $number = 0;
    else 
        $number = substr($lastOrder->order_id, 3);
    return 'ORD' . sprintf('%06d', intval($number) + 1);
}
function ConvertTimeToAmPmTime($time)
 {
    $Time = date('h:i A', strtotime($time));
    return $Time;
 }