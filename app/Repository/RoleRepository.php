<?php 
namespace App\Repository;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\Transaction;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use App\Helpers\CommonHelper;
use Illuminate\Support\Facades\Log;

class RoleRepository   {

    public function __construct(RoleRepository $role)
    {
        $this->role = $role;
       
    }

                       
}