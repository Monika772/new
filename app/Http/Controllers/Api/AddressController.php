<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\User_address;
use App\Models\Notification;
use App\Repository\AddressRepository;
use App\Helpers\CommonHelper;
use Carbon\Carbon;
use Validator;
use DB; 

use App\Mail\Forgetpassword;
use Illuminate\Support\Facades\Mail;

class AddressController extends Controller
{
    
    public function __construct(AddressRepository $user_address){
        $this->user_address = $user_address;
    }
    /**
     * Function : getAddress
     * Desc : get address data
     */
    
        public function address(Request $request){
            try {
                return $this->user_address->addressdata($request);
            } catch (\Exception $e) {
                return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 403);
            }
        }

        public function updateAddress(Request $request){
            try {
                return $this->user_address->updateAddress($request);
            } catch (\Exception $e) {
                return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 403);
            }
        }

}