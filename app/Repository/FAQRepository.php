<?php 
namespace App\Repository;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use App\Models\FAQ;
use Illuminate\SuTeamspport\Facades\Storage;
use App\Helpers\CommonHelper;

class FAQRepository {

    public function __construct(FAQ $faq){
        $this->faq = $faq;
    }
    /**
     * Function: getData
     * Desc : get faq all data
     */
    public function getData(){
        return $this->faq->where('status','!=','deleted')->orderBy('id','desc')->get();
    }
    /**
     * Function : getFaq
     * Desc : get faq data
     */
    public function getFaq($request){
     return $this->faq->where('role_type',$request['user']['user_role'])->where('status','active')->orderBy('question','asc')->get();
    }    
    /**
     * Function : store
     * Desc : Store Faq Data
     */
    public function store($request){
        $requestData = ['title_en' => ucfirst($request->title_en),'title_hindi' => ucfirst($request->title_hindi),'description_en' => ucfirst($request->description_en),'description_hindi' => ucfirst($request->description_hindi),'status'=>'active'];
        echo "<pre>";print_r($requestData);die;
        return $this->faq->insert($requestData);
    }
    /**
     * Function : getRecord
     * Desc : get faq details
     * @param : $id
     */
    public function getRecord($id){
        return $this->faq->where('id',$id)->first();
   }
   /**
    * Function : update
    * Desc : udpate faq details
    */
    public function update($request){
        $id                 = $request->id;
        $req['question']    = ucfirst($request->question);
        $req['role_type']   = $request->role_type;
        $req['answer']      = ucfirst($request->answer_msg);
       return $this->faq->where('id',$id)->update($req);
    }
    /**
     * Function : delete
     * Desc : delete faq
     * @param $id
     */
    public function delete($id) {
       return $this->faq->where('id',$id)->update(['status'=>'deleted']);
    }
    /**
     * Function :updateStatus
     * Desc : update faq status
     */
    public function updateStatus($id,$status) {
        return $this->faq->where('id',$id)->update(['status'=>$status]);
     }
}