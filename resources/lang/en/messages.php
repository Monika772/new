<?php

return[
    'admin'=>[

    ],
    'api'=>[
        'success'=>[
            'login_success'=>'Login successfully',
            'profile_incomplete'=>'Your account created successfully. Please complete your profile',
            'otp_verified'=>'OTP Verified successfully',
            'register_successfully'=>'Your registration is successfully done.',
            'logout_success'=>'Logout Successfully.',
            'candidate_profile_update'=>'Your profile update successfully',
            'candidate_profile_otp_send'=>'OTP sent to your number. Please verify your number.',
            'candidate_kyc_complete'=>'Please complete your kyc details',
            'kyc_details_updated'=>'Your Kyc details updated successfully',
            'otp_send'=>'OTP sent to your register number',
            'notification_status_on'=>'Notification status on update successfully',
            'notification_status_off'=>'Notification status off update successfully',
            'business_profile_update_success'=>'Business profile update successfully',
            'gigs_created_success'=>'Gigs created successfully.',
            'gig_request_accepted'=>'Gigs request accepted successfully',
            'gigs_sent_offer_candidate'=>'Gigs offer sent to candidate successfully',
            'gigrr_searched_request_sent'=>'Gigrr searched request sent.',
            'login_time_added'=>'Login Time added successfully',
            'logout_time_added'=>'Logout Time added successfully'
            
        ],
        'error'=>[
            'something_went_wrong'=>'Somthing went wrong. Please try again...',
            'register_with_different_role'=>'Your account is registerd with other role.',
            'account_inactive'=>'Your account is inactive by admin. Please contact to admin.',
            'incomplete_profile'=>'Please complete your profile',
            'verify_mobile_number'=>'Please verify your Mobile number',
            'invalid_otp'=>'Invalid OTP code',
            'no_record_found'=>'No record found',
            'phone_already_exist'=>'These phone number already exist',
            'invalid_id_or_profile_not_found'=>'Invalid id or no profile found',
            'invalid_business_id'=>'Invalid business id or business not found',
            'invalid_gig_id'=>'Invalid Gigs ID or not in your scope',
            'invalid_candidate_id'=>'invalid id or no candidate found',
            'already_serve_gigs'=>'Already serving job. Please complete running serving job'
        ],
        'notification'=>[
            'RECIEVED_NEW_GIG_REQUEST'=>'Recieved a new gig request',
            'GIGS_SENT_OFFER'=>'Gigs Sent Offer'

        ]
    ]
];

?>