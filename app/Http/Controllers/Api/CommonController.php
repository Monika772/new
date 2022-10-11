<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Repository\CategoryRepository;
use App\Repository\ProductRepository;

// use App\Repository\CommonRepository;
// use App\Repository\FAQRepository;
// use App\Models\BusinessImages;
// use App\Models\EmployeeImages;
// use App\Models\CMS;
use Carbon\Carbon;
// use Intervention\Image\ImageManagerStatic as Image;
use Validator;
use Illuminate\Support\Facades\Log;
use App\Helpers\CommonHelper;
class CommonController extends Controller
{
    public function __construct(){
        $this->categpryRepository   = new CategoryRepository();
        $this->productRepository    = new ProductRepository();
    }

    /**
     * Function : category
     * Desc: get categpry listing
     */
   public function category(Request $request){
        try {
            $category = $this->categpryRepository->getCategoryListApi($request);
            return response()->json(['success'=>true,'message' => '','data'=> $category], 200);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
   public function products(Request $request){
        try {
            $category = $this->productRepository->getProductsListApi($request);
            return response()->json(['success'=>true,'message' => '','data'=> $category], 200);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
   }
  
   /**
    * Function : privacyPolicy
    * Desc : get privacy policy
    */
   public function privacyPolicy(){
    try {
        $privacy_policy = $this->cms->where('slug','privacy-policy')->first();
        return response()->json(['success'=>true,'message' => '','data'=> $privacy_policy], 200);
    } catch (\Exception $e) {
        return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
    }
   }
   /**
    * Function : termsCondition
    * Desc : get terms conditions
    */
   public function termsCondition(){
    try {
        $terms_condition = $this->cms->where('slug','terms-conditions')->first();
        return response()->json(['success'=>true,'message' => '','data'=> $terms_condition], 200);
    } catch (\Exception $e) {
        return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
    }
   }
   /**
    * Function : FAQ
    * Desc : get faq via role wise
    */
   public function faq(Request $request){
    try {
        $faq = $this->faqRepository->getFaq($request);
        return response()->json(['success'=>true,'message' => '','data'=> $faq], 200);
    } catch (\Exception $e) {
        return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
    }
   }
   /**
    * Function : About us
    * Desc : get about us content
    */
    public function aboutUs(Request $request){
        try {
            $about = $this->cms->where('slug','about-us')->first();
            return response()->json(['success'=>true,'message' => '','data'=> $about], 200);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
       }
   /**
    * Function :uploadImage
    * Desc :upload image
    * @return $image path
    */
    public function uploadImage(Request $request){
        try {
            $data = [];
            if($request->hasfile('image'))
            {
                foreach($request->file('image') as $key=>$file)
                {
                    $uploadImg = time().rand(111111,999999).'.'.$file->getClientOriginalExtension();
                    $destinationPath = storage_path('app/temp');
                    $img = Image::make($file->getRealPath());
                    $img->resize(200, 200, function ($constraint) {
                        $constraint->aspectRatio();
                    })->save($destinationPath.'/'.$uploadImg);
                    $file->move($destinationPath, $uploadImg);
                    $data = url('storage/app').'/temp/'.$uploadImg;
                
                }
            }
            if(!empty($data)){
                $image =  explode(",",$data);
                return response()->json(['success'=>true,'message' => '','data'=> ['image'=>$image]], 200);
            }
            //    $file_name = CommonHelper::imageCompressUploads($request,'temp');
            //    if(!empty($file_name)){
            //        $image = url('storage/app').'/'.$file_name;
            //        return response()->json(['success'=>true,'message' => '','data'=> ['image'=>$image]], 200);
            //    }
        
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
    }

    public function uploadFile(Request $request){
        if($request->hasfile('file'))
        {
            $file = $request->file('file');
            $filename = time() . '.' . $request->file('file')->extension();
            $destinationPath = storage_path('app/temp');
            $file->move($destinationPath, $filename);
            $uploadFile = url('storage/app').'/temp/'.$filename;
            return response()->json(['success'=>true,'message' => '','data'=> ['file'=>$uploadFile]], 200);
        }
        return response()->json(['success'=>false,'message' => 'File upload process is failed','data'=> []], 200);
    }
    /**
     * Function : deleteTempImage
     * Desc : delete temp image
     */
    public function deleteTempImage(Request $request){
        $destinationPath = storage_path('app/temp/');
        $imageName = CommonHelper::getImageName($request->image);
        CommonHelper::removeImage($destinationPath,$imageName);
        return response()->json(['success'=>true,'message' => 'Image deleted successfully','data'=> []], 200);
    }

    /**
     * Function : deleteImage
     * Desc : delete image
     */
    public function deleteImage(Request $request){
        $userId = $request['user']['id'];
        $roleId = $request['user']['role_id'];
        $imageName = CommonHelper::getImageName($request->image);
        if($roleId==3){
            $data = $this->businessImages->where('user_id',$userId)->where('image',$imageName)->first();
            if(!empty($data)){
                $this->businessImages->where('user_id',$userId)->where('image',$imageName)->delete();
                $destinationPath = storage_path('app/business_profile/');
                CommonHelper::removeImage($destinationPath,$imageName);
                return response()->json(['success'=>true,'message' => 'Image deleted successfully','data'=> []], 200);
            }
        }else if($roleId==4){
            $data = $this->employeeImages->where('user_id',$userId)->where('image',$imageName)->first();
            if(!empty($data)){
                $this->employeeImages->where('user_id',$userId)->where('image',$imageName)->delete();
                $destinationPath = storage_path('app/employee_profile/');
                CommonHelper::removeImage($destinationPath,$imageName);
                return response()->json(['success'=>true,'message' => 'Image deleted successfully','data'=> []], 200);
            }
        }
        
        
        return response()->json(['success'=>false,'message' => 'No Image found','data'=> []], 200);
    }
    /**
     * Function : ratingReview
     * Desc : rating review
     */
    public function ratingReview(Request $request){
        try {
            return  $this->commonRepoistory->userRatingReview($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
    }
    /**
     * Function : contactSubjects
     * Desc : contact subjects
     */
    public function contactSubjects(Request $request){
        try {
            return  $this->commonRepoistory->contactSubjects($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
    }
   
    public function sendContactUsAdmin(Request $request){
        try {
            return  $this->commonRepoistory->sendContactUsAdmin($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
    } 
    
    public function saveChat(Request $request){
        try {
            return  $this->commonRepoistory->saveChat($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
    }
    public function getChat(Request $request){
        try {
            return  $this->commonRepoistory->getChat($request);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
    }
   

    public function testFCM(){
        $url = 'https://fcm.googleapis.com/fcm/send';
        $deviceId = ['cH0NZQaqQceh4i8Pb03fU3:APA91bH7ZGDrhptBRn-KbeHFftNXc2CUHrQU1C0GYrpa0frkbhsoKdu2EdOp4_X_Z36B-A2G9eaYtCvm-rTYY8KmcBvCIJYKqRmcI3K4LGwe74eVkfXtDF9acYB75OBY-VlC4G8wouvd','eO7s-GTLSESn29uQUewnCc:APA91bHD2JH8OkPSlfWGKJK6qxXucM6MI2r4mK8oOO6VDLVK4pre1nkARc19ccw4djtzmhPRFLZqdDOKXVF92rGkXn7P7XvYbxYHgXsB3h7_IZu9JMuMxLiZvuGugDTBbKz2kBQ62ZwC','c1_OKGLOQhyvTD3STdMbfA:APA91bEqKyScjqwO1_gBHyf7bQjU39X545dD36JnPKOuzl73cOvI46sICKeMmCf0cUYfJePbzHcaPrGvKlrqqo6oSAdjGUmqRCDyJ7Dk1GUme0yZIoL_ex23WBw69fNccfZrfhoNB40U'];
        $fields = array (
        'registration_ids' => $deviceId,
         // fix new json format
        'notification' => array('message' => 'testnotification', 'type' => 'Test','title' => 'Test','gigs_id' => $gigsId,'type'=>'Test'));
        $fields = json_encode($fields);
        $API_ACCESS_KEY = config('app.FCM_API_KEY');
        if (!isset($API_ACCESS_KEY)) {
            return false;
        }
        // inherited key

        $headers = array(
            'Content-Type:application/json',
            'Authorization:key='.$API_ACCESS_KEY
        );

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
        $result = curl_exec($ch);

        var_dump($result);

        if ($result === FALSE) {
            die('Oops! FCM Send Error: ' . curl_error($ch));
        }

        curl_close($ch);
            }
}