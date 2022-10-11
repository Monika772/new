<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
//use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Http\Request;
use App\Http\Requests\ForgotPasswordRequest;
use App\Repositories\UserRepository;
use App\Http\Requests\ResetPasswordRequest;

class ForgotPasswordController extends Controller {
    /*
      |--------------------------------------------------------------------------
      | Password Reset Controller
      |--------------------------------------------------------------------------
      |
      | This controller is responsible for handling password reset emails and
      | includes a trait which assists in sending these notifications from
      | your application to your users. Feel free to explore this trait.
      |
     */

// use SendsPasswordResetEmails;

    /**
     * Create a new controller instance.
     * return void
     */
    public function __construct(UserRepository $user) {
       $this->user = $user;
    }

    /**
     *
     * Send reset password link
     * @param object
     */
    public function sendResetLinkEmail(ForgotPasswordRequest $request) {
        try {
            if ($request->has('email')) {
                $checkEmail = findEmail($request->email, 'admin');
                if ($checkEmail) {
                    $saveToken = saveTokenLink($request->email);
                    $checkEmail['link']         = url('admin/password/reset/' . $saveToken);
                    $checkEmail['email']        = $request->email;
                    $checkEmail['admin_email']  = $request->email;
                    $checkEmail['admin_phone']  = $checkEmail->phone_number;
                    $checkEmail['user_name']    = $checkEmail['name'];
                    $checkEmail['subject']      = 'Forgot Password';
                    $emailSent = sendMails('emails.forgot-password', $checkEmail);
                    if ($emailSent) {
                     return json_encode(array('success' => 'true', 'message' =>__('auth.sent_email')));

                    } else {
                      return json_encode(array('success' => 'false', 'message' =>  __('auth.mail_not_sent')));
                    }
                } else {
                    return json_encode(array('success' => 'false', 'message' => __('auth.email_not_exist')));
                 
                }
            }
        } catch (\Exception $e) {

            return json_encode(array('success' => 'false', 'message' => $e->getMessage()));
        }
    }

    /**
     * Reset password
     * @param object
     */
    public function reset(ResetPasswordRequest $request) {

        try {
            $checkToken = checkToken($request->token);
            if ($checkToken) {
                $changePassword = $this->user->updatePassword($request->all());
                if ($changePassword) {
                    return json_encode(array('success' => 'true', 'message' =>__('auth.password_set')));

                } else {
                    return json_encode(array('success' => 'false', 'message' =>__('auth.error_set_password')));
               }
            } else {
                return json_encode(array('success' => 'false', 'message' =>__('auth.session_expire')));
            }
        } catch (\Exception $e) {
           return json_encode(array('success' => 'false', 'message' =>$e->getMessage()));
        }
    }

    /**
     * Set password view page
     * @param int
     */
    public function setPassword($token) {
        try {
            $users = checkToken($token);
            $data = $this->user->getAdminDetail($token);
            if ($users) {
                return view('admin::emails/reset-password', compact('users','data'));
            } else {
                return back()->with('error_msg', __("common.invalid_token"));
            }
        } catch (\Exception $e) {
            \Session::flash('error_msg', $e->getMessage());
            return back();
        }
    }

    /**
     * Validate the email for the given request
     * @param object
     */
    protected function validateEmail(Request $request) {
        $this->validate($request, ['email' => 'required|email']);
    }

}
