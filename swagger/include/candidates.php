<?php

return [
    'paths' => [
        "/gigs-request" => [
            "get" => [
                "tags" => [
                    "candidates"
                ],
                "summary" => "get all gigs request",
                "description" => "get all gigs request",
                "consumes" => [
                    "application/json"
                ],
                "produces" => [
                    "application/json"
                ],
                "parameters" => [
                    [
                        "name" => "Authorization",
                        "in" => "header",
                        "description" => "token",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64"
                    ],
                ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/gigs_request_v1" => [
            "post" => [
                "tags" => [
                    "candidates"
                ],
                "summary" => "get all gigs request",
                "description" => "get all gigs request",
                "consumes" => [
                    "application/json"
                ],
                "produces" => [
                    "application/json"
                ],
                "parameters" => [
                    [
                        "name" => "Authorization",
                        "in" => "header",
                        "description" => "token",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64"
                    ],
                    [
                        "in" => "body",
                        "name" => "body",
                        "description" => "git request",
                        "required" => true,
                        "schema" => [
                                '$ref' => "#/definitions/gig-request"
                        ]
                    ],
                    
                ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/gigs-request" => [
            "post" => [
                "tags" => [
                    "candidates"
                ],
                "summary" => "get all gigs request",
                "description" => "get all gigs request",
                "consumes" => [
                    "application/json"
                ],
                "produces" => [
                    "application/json"
                ],
                "parameters" => [
                    [
                        "name" => "Authorization",
                        "in" => "header",
                        "description" => "token",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64"
                    ],
                    [
                        "in" => "body",
                        "name" => "body",
                        "description" => "git request",
                        "required" => true,
                        "schema" => [
                                '$ref' => "#/definitions/gig-request"
                        ]
                    ],
                    
                ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/gigs-accepted" => [
            "get" => [
                "tags" => [
                    "candidates"
                ],
                "summary" => "get all gigs accepted",
                "description" => "get all gigs accepted",
                "consumes" => [
                    "application/json"
                ],
                "produces" => [
                    "application/json"
                ],
                "parameters" => [
                    [
                        "name" => "Authorization",
                        "in" => "header",
                        "description" => "token",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64"
                    ],
                ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/accept-gigs-request" => [
            "get" => [
                "tags" => [
                    "candidates"
                ],
                "summary" => "accept gigs request",
                "description" => "accept gigs request",
                "consumes" => [
                    "application/json"
                ],
                "produces" => [
                    "application/json"
                ],
                "parameters" => [
                    [
                        "name" => "Authorization",
                        "in" => "header",
                        "description" => "token",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64"
                    ],
                    [
                        "name" => "gigs_id",
                        "in" => "query",
                        "description" => "gigs id",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64"
                    ],
                ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/candidates/my-gigs" => [
            "get" => [
                "tags" => [
                    "candidates"
                ],
                "summary" => "get candidates all gigs",
                "description" => "get candidates all gigs",
                "consumes" => [
                    "application/json"
                ],
                "produces" => [
                    "application/json"
                ],
                "parameters" => [
                    [
                        "name" => "Authorization",
                        "in" => "header",
                        "description" => "token",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64"
                    ],
                ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/candidates/my-roster-gigs" => [
            "get" => [
                "tags" => [
                    "candidates"
                ],
                "summary" => "get my roster gigs",
                "description" => "get my roster gigs",
                "consumes" => [
                    "application/json"
                ],
                "produces" => [
                    "application/json"
                ],
                "parameters" => [
                    [
                        "name" => "Authorization",
                        "in" => "header",
                        "description" => "token",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64"
                    ],
                ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/candidates/get-profile" => [
            "get" => [
                "tags" => [
                    "candidates"
                ],
                "summary" => "get candidates profile",
                "description" => "get candidates profile",
                "consumes" => [
                    "application/json"
                ],
                "produces" => [
                    "application/json"
                ],
                "parameters" => [
                    [
                        "name" => "Authorization",
                        "in" => "header",
                        "description" => "token",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64"
                    ],
                ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/candidates/bank-info" => [
            "get" => [
                "tags" => [
                    "candidates"
                ],
                "summary" => "get candidates bank info",
                "description" => "get candidates bank info",
                "consumes" => [
                    "application/json"
                ],
                "produces" => [
                    "application/json"
                ],
                "parameters" => [
                    [
                        "name" => "Authorization",
                        "in" => "header",
                        "description" => "token",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64"
                    ],
                ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/candidates/profile" => [
            "post" => [
                "tags" => [
                    "candidates"
                ],
                "summary" => "Update Candidte profile",
                "description" => "Update Candidte profile",
                "consumes" => [
                    "application/json"
                 ],
                 "produces" => [
                     "application/json"
                 ],
                 "parameters" => [
                    [
                        "name" => "Authorization",
                        "in" => "header",
                        "description" => "token",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64"
                    ],
                     [
                         "in" => "body",
                         "name" => "body",
                         "description" => "Candidte profile",
                         "required" => true,
                         "schema" => [
                                 '$ref' => "#/definitions/update-profile"
                         ]
                     ],
                 ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/candidates/save-bank-account" => [
            "post" => [
                "tags" => [
                    "candidates"
                ],
                "summary" => "Update Candidte Bank Account Info",
                "description" => "Update Candidte Bank Account Info",
                "consumes" => [
                    "application/json"
                 ],
                 "produces" => [
                     "application/json"
                 ],
                 "parameters" => [
                    [
                        "name" => "Authorization",
                        "in" => "header",
                        "description" => "token",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64"
                    ],
                     [
                         "in" => "body",
                         "name" => "body",
                         "description" => "Update Candidte Bank Account Info",
                         "required" => true,
                         "schema" => [
                                 '$ref' => "#/definitions/saveBankInfo"
                         ]
                     ],
                 ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/candidates/update-kyc" => [
            "post" => [
                "tags" => [
                    "candidates"
                ],
                "summary" => "Update Candidte KYC Details",
                "description" => "Update Candidte KYC Details",
                "consumes" => [
                    "application/json"
                 ],
                 "produces" => [
                     "application/json"
                 ],
                 "parameters" => [
                    [
                        "name" => "Authorization",
                        "in" => "header",
                        "description" => "token",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64"
                    ],
                     [
                         "in" => "body",
                         "name" => "body",
                         "description" => "Candidte profile",
                         "required" => true,
                         "schema" => [
                                 '$ref' => "#/definitions/update-kyc"
                         ]
                     ],
                 ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/candidates/gigs-offer-accepted" => [
            "post" => [
                "tags" => [
                    "candidates"
                ],
                "summary" => "Accpet/Reject gig's offer",
                "description" => "Accpet/Reject gig's offer",
                "consumes" => [
                    "application/json"
                ],
                "produces" => [
                    "application/json"
                ],
                "parameters" => [
                    [
                        "name" => "Authorization",
                        "in" => "header",
                        "description" => "token",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64"
                    ],
                    [
                        "in" => "body",
                        "name" => "body",
                        "description" => "Gigs Booking",
                        "required" => true,
                        "schema" => [
                                '$ref' => "#/definitions/accepted-offer"
                        ]
                    ]
                ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/candidates/update_job_status" => [
            "post" => [
                "tags" => [
                    "candidates"
                ],
                "summary" => "Update job start/end",
                "description" => "Update job start/end",
                "consumes" => [
                    "application/json"
                 ],
                 "produces" => [
                     "application/json"
                 ],
                 "parameters" => [
                    [
                        "name" => "Authorization",
                        "in" => "header",
                        "description" => "token",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64"
                    ],
                     [
                         "in" => "body",
                         "name" => "body",
                         "description" => "update job start",
                         "required" => true,
                         "schema" => [
                                 '$ref' => "#/definitions/update-job-status"
                         ]
                     ],
                 ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/candidates/gigs_verify_otp" => [
            "post" => [
                "tags" => [
                    "candidates"
                ],
                "summary" => "Update job start/end",
                "description" => "Update job start/end",
                "consumes" => [
                    "application/json"
                 ],
                 "produces" => [
                     "application/json"
                 ],
                 "parameters" => [
                    [
                        "name" => "Authorization",
                        "in" => "header",
                        "description" => "token",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64"
                    ],
                     [
                         "in" => "body",
                         "name" => "body",
                         "description" => "update job start",
                         "required" => true,
                         "schema" => [
                                 '$ref' => "#/definitions/gigs-verify-otp"
                         ]
                     ],
                 ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/candidates/login-logout" => [
            "post" => [
                "tags" => [
                    "candidates"
                ],
                "summary" => "Update login logout time",
                "description" => "Update login logout time",
                "consumes" => [
                    "application/json"
                 ],
                 "produces" => [
                     "application/json"
                 ],
                 "parameters" => [
                    [
                        "name" => "Authorization",
                        "in" => "header",
                        "description" => "token",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64"
                    ],
                     [
                         "in" => "body",
                         "name" => "body",
                         "description" => "update login logout time",
                         "required" => true,
                         "schema" => [
                                 '$ref' => "#/definitions/login_logout"
                         ]
                     ],
                 ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/candidates/payment_history" => [
            "post" => [
                "tags" => [
                    "candidates"
                ],
                "summary" => "Payment History",
                "description" => "Payment History",
                "consumes" => [
                    "application/json"
                 ],
                 "produces" => [
                     "application/json"
                 ],
                 "parameters" => [
                    [
                        "name" => "Authorization",
                        "in" => "header",
                        "description" => "token",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64"
                    ],
                     [
                         "in" => "body",
                         "name" => "body",
                         "description" => "Payment History",
                         "required" => true,
                         "schema" => [
                                 '$ref' => "#/definitions/payment-history"
                         ]
                     ],
                 ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
    ],
    'definitions' => [
        "gig-request"=>[
            "type" => "object",
            'properties' => [   
                "gigs_id" => [
                    "type" => "integer"
                ],            
               "address" => [
                    "type" => "string"
                ],
                "latitude" => [
                    "type" => "string"
                ],
                "longitude" => [
                    "type" => "string"
                ],
                "distance" => [
                    "type" => "string",
                ],
                "pay-range-from" => [
                    "type" => "string",
                ],
                "pay-range-to" => [
                    "type" => "string",
                ],
                "avaliable-from" => [
                    "type" => "string",
                    'example'=>'Y-m-d'
                ],
                "avaliable-to" => [
                    "type" => "string",
                    'example'=>'Y-m-d'
                ],
                'shift'=> [
                    'type' => 'string',
                    'example'=>'day/evening/night',
                    
                ],
                "skills"=>[
                    'type' => 'string',
                ],
               
            ],
        ],
        'gigs-verify-otp' => [
            "type" => "object",
            'properties' => [               
               "gigs_id" => [
                    "type" => "integer"
                ],
                "status" => [
                    "type" => "string",
                    'example'=>'start/complete'
                ],
                "otp" => [
                    "type" => "string"
                ],
               
            ],
        ],
        'update-job-status' => [
            "type" => "object",
            'properties' => [               
               "gigs_id" => [
                    "type" => "integer"
                ],
                "status" => [
                    "type" => "string",
                    'example'=>'start/complete'
                ]
               
            ],
        ],
        'accepted-offer' => [
            "type" => "object",
            'properties' => [               
               "gigs_id" => [
                    "type" => "integer"
                ],
                "status" => [
                    "type" => "string",
                    'example'=>'accept/cancel'
                ]
               
            ],
        ],
        'update-profile'=>[
            "type" => "object",
            'properties' => [               
                "full_name" => [
                    "type" => "string"
                ],
                "profile_image" => [
                    "type" => "string"
                ],
                 'country_code' => [
                    'type' => 'string'
                ],
                'mobile_no' => [
                    'type' => 'string'
                ],
                'email' => [
                    'type' => 'string'
                ],
                'address' => [
                    'type' => 'string'
                ],
                'latitude' => [
                    'type' => 'string'
                ],
                'longitude' => [
                    'type' => 'string'
                ],
                'gender'=> [
                    'type' => 'string',
                    'example'=>'male/female/other'
                ],
                'dob'=> [
                    'type' => 'string',
                    'example'=>'1991/03/13'
                ],
                'experience_year'=> [
                    'type' => 'integer'
                ],
                'experience_month'=> [
                    'type' => 'integer'
                ],
                'price_from'=> [
                    'type' => 'string'
                ],
                'price_to'=> [
                    'type' => 'string'
                ],
                'price_criteria'=>[
                    'type' => 'string',
                    'example'=>'hourly/daily/weekly/monthly'
                ],
                'skills'=> [
                    'type' => 'string'
                ],
                'avaliblity'=> [
                    'type' => 'string',
                    'example'=>'weekends/weekdays'
                ],
                'shift'=> [
                    'type' => 'string',
                    'example'=>'day/evening/night'
                ],
                'images' => [
                    'type' => 'string',
                    'example'=>'image1.jpg,image2.jpg,image3.jpg'
                ],
                'upi_id'=> [
                    'type' => 'string'
                ],
               
            ],
        ],
        'update-kyc'=>[
            "type" => "object",
            'properties' => [       
                'aadhar_no'=> [
                    'type' => 'string'
                ],
                'aadhar_front_image'=> [
                    'type' => 'string'
                ],
                'aadhar_back_image'=> [
                    'type' => 'string'
                ],
                'vaccine_certificate'=>[
                    'type' => 'string'
                ],
                'upi_id'=> [
                    'type' => 'string'
                ],
            ],
        ],
        'saveBankInfo'=>[
            "type" => "object",
            'properties' => [   
                'account_holder_name'=> [
                    'type' => 'string'
                ],    
                'bank_name'=> [
                    'type' => 'string'
                ],
                'account_number'=> [
                    'type' => 'string'
                ],
                'account_type'=> [
                    'type' => 'string'
                ],
                'ifsc_code'=>[
                    'type' => 'string'
                ]
            ],
        ],
        
        'login_logout'=>[
            "type" => "object",
            'properties' => [       
                'gigs_id'=> [
                    'type' => 'string'
                ],
                'status'=> [
                    'type' => 'string',
                    'example'=>'login/logout',
                ]
            ],
        ],
        'payment-history'=>[
            "type" => "object",
            'properties' => [       
                'start_date'=> [
                    'type' => 'string'
                ],
                'end_date'=> [
                    'type' => 'string'
                ]
            ],
        ],
   ]
];
