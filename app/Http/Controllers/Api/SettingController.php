<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Models\Settings;
use Carbon\Carbon;
use Validator;

class SettingController extends Controller
{
    private $setting;
    public function __construct(Settings $setting){
        $this->setting  = $setting;
    }
    public function setting(){
        try {
            $setting = $this->setting->get();
            return response()->json(['success'=>true,'message' => '','data'=> $setting], 200);
        } catch (\Exception $e) {
            return response()->json(['success'=>false,'message' => $e->getMessage(),'data'=> []], 200);
        }
    }
}