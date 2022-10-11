<?php

return [
    'paths' => [
        // "/upload-image" => [
        //     "post" => [
        //         "tags" => [
        //             "account"
        //         ],
        //         "summary" => "Upload Image",
        //         "description" => "Upload Image",
        //         "consumes" => [
        //             "multipart/form-data"
        //         ],
        //         "produces" => [
        //             "application/json"
        //         ],
        //         "parameters" => [
        //             [
        //                 "name" => "image[]",
        //                 "in" => "formData",
        //                 "description" => "Upload Images",
        //                 "required" => false,
        //                 "type" => "file",
        //                 "format" => "int64"
        //             ],
                  
        //         ],
        //         "responses" => [
        //             "default" => [
        //                 "description" => "successful operation"
        //             ]
        //         ]
        //     ]
        // ],
        // "/upload-file" => [
        //     "post" => [
        //         "tags" => [
        //             "account"
        //         ],
        //         "summary" => "Upload File",
        //         "description" => "Upload File",
        //         "consumes" => [
        //             "multipart/form-data"
        //         ],
        //         "produces" => [
        //             "application/json"
        //         ],
        //         "parameters" => [
        //             [
        //                 "name" => "file",
        //                 "in" => "formData",
        //                 "description" => "Upload File",
        //                 "required" => true,
        //                 "type" => "file",
        //                 "format" => "int64"
        //             ],
                  
        //         ],
        //         "responses" => [
        //             "default" => [
        //                 "description" => "successful operation"
        //             ]
        //         ]
        //     ]

        // ],
        // "/delete-temp-image" => [
        //     "post" => [
        //         "tags" => [
        //             "account"
        //         ],
        //         "summary" => "Delete Image",
        //         "description" => "Delete Image",
        //         "consumes" => [
        //             "application/json"
        //          ],
        //          "produces" => [
        //              "application/json"
        //          ],
        //          "parameters" => [
        //             [
        //                  "in" => "body",
        //                  "name" => "body",
        //                  "description" => "Image name",
        //                  "required" => true,
        //                  "schema" => [
        //                          '$ref' => "#/definitions/delete-image"
        //                  ]
        //              ],
        //          ],
        //         "responses" => [
        //             "default" => [
        //                 "description" => "successful operation"
        //             ]
        //         ]
        //     ]
        // ],
        // "/delete-image" => [
        //     "post" => [
        //         "tags" => [
        //             "account"
        //         ],
        //         "summary" => "Delete Image",
        //         "description" => "Delete Image",
        //         "consumes" => [
        //             "application/json"
        //          ],
        //          "produces" => [
        //              "application/json"
        //          ],
        //          "parameters" => [
        //             [
        //                 "name" => "Authorization",
        //                 "in" => "header",
        //                 "description" => "token",
        //                 "required" => true,
        //                 "type" => "string",
        //                 "format" => "int64"
        //             ],
        //              [
        //                  "in" => "body",
        //                  "name" => "body",
        //                  "description" => "Image name",
        //                  "required" => true,
        //                  "schema" => [
        //                          '$ref' => "#/definitions/delete-image"
        //                  ]
        //              ],
        //          ],
        //         "responses" => [
        //             "default" => [
        //                 "description" => "successful operation"
        //             ]
        //         ]
        //     ]
        // ],
       "/verify_otp" => [
           "post" => [
               "tags" => [
                   "account"
               ],
               "summary" => "Verify OTP",
               "description" => "Verify OTP",
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
                        "description" => "Verify OTP",
                        "required" => true,
                        "schema" => [
                                '$ref' => "#/definitions/verifyotp"
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
    //    "/register" => [
    //     "post" => [
    //             "tags" => [
    //                 "account"
    //             ],
    //             "summary" => "Register",
    //             "description" => "Register",
    //             "consumes" => [
    //             "application/json"
    //             ],
    //             "produces" => [
    //                 "application/json"
    //             ],
    //             "parameters" => [
    //                 [
    //                     "name" => "Authorization",
    //                     "in" => "header",
    //                     "description" => "token",
    //                     "required" => true,
    //                     "type" => "string",
    //                     "format" => "int64"
    //                 ],
    //                 [
    //                     "in" => "body",
    //                     "name" => "body",
    //                     "description" => "Register",
    //                     "required" => true,
    //                     "schema" => [
    //                             '$ref' => "#/definitions/register"
    //                     ]
    //                 ],
    //             ],
    //             "responses" => [
    //                 "default" => [
    //                     "description" => "successful operation"
    //                 ]
    //             ]
    //         ]
    //     ],
      
   
        "/send_otp" => [
            "post" => [
                "tags" => [
                    "account"
                ],
                "summary" => "Send OTP",
                "description" => "Send OTP",
                "consumes" => [
                    "application/json"
                ],
                "produces" => [
                    "application/json"
                ],
                "parameters" => [
                    [
                        "in" => "body",
                        "name" => "body",
                        "description" => "Send OTP on register number",
                        "required" => true,
                        "schema" => [
                                '$ref' => "#/definitions/sendotp"
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
        // "/resend-otp" => [
        //     "get" => [
        //         "tags" => [
        //             "account"
        //         ],
        //         "summary" => "Resend OTP",
        //         "description" => "Resend OTP",
        //         "consumes" => [
        //             "application/json"
        //         ],
        //         "produces" => [
        //             "application/json"
        //         ],
        //         "parameters" => [
        //             [
        //                 "name" => "Authorization",
        //                 "in" => "header",
        //                 "description" => "token",
        //                 "required" => true,
        //                 "type" => "string",
        //                 "format" => "int64"
        //             ],
        //         ],
        //         "responses" => [
        //             "default" => [
        //                 "description" => "successful operation"
        //             ]
        //         ]
        //     ]
        // ],
             
    ],
    'definitions' => [
        // 'delete-image'=>[
        //     "type" => "object",
        //     'properties' => [               
        //         "image" => [
        //             "type" => "string"
        //         ],
        //     ]
        // ],
       
        // 'login' => [
        //     "type" => "object",
        //     'properties' => [               
        //         "social_id" => [
        //             "type" => "string"
        //         ],
        //         "social_type" => [
        //             "type" => "string",
        //             "example"=>"facebook/google/apple"
        //         ],
        //          'device_token' => [
        //             'type' => 'string'
        //         ],
        //         'device_type' => [
        //             'type' => 'string'
        //         ],
        //         'role' => [
        //             'type' => 'string',
        //             'example'=>'3-employers,4-employees'
        //         ],
        //         'full_name'=>[
        //             'type' => 'string'
        //         ],
        //         'email'=>[
        //             'type' => 'string'
        //         ],
        //         'country_code' => [
        //             'type' => 'string'
        //         ],
        //         'mobile_no' => [
        //             'type' => 'string'
        //         ],
        //     ],
        // ],
        // 'register'=>[
        //     "type" => "object",
        //     'properties' => [               
        //         "name" => [
        //             "type" => "string"
        //         ],
        //         'email' => [
        //             'type' => 'string'
        //         ],
        //         'shop_name' => [
        //             'type' => 'string'
        //         ],
        //         'gst_number' => [
        //             'type' => 'string'
        //         ],
        //         'address' => [
        //             'type' => 'string'
        //         ],
        //         'pincode' => [
        //             'type' => 'string'
        //         ],
        //         'latitude' => [
        //             'type' => 'string'
        //         ],
        //         'longitude' => [
        //             'type' => 'string'
        //         ]
        //     ],
        // ],
       
        'sendotp'=>[
            "type" => "object",
            'properties' => [ 
                "mobile_no" => [
                    "type" => "string"
                ]                       
                                       
            ], 
        ],
      
        'verifyotp'=>[
            "type" => "object",
            'properties' => [   
               "mobile_no" => [
                    "type" => "string"
                ],    
                "otp" => [
                    "type" => "number"
                ],  
                 'device_token' => [
                    'type' => 'string'
                ],
                'device_type' => [
                    'type' => 'string'
                ],
                'certification_type' => [
                    'type' => 'string'
                ],  
               
            ],
        ],
        'verify_otp'=>[
            "type" => "object",
            'properties' => [   
                "country_code" => [
                    "type" => "string"
                ],            
               "mobile_no" => [
                    "type" => "string"
                ],    
                'device_token' => [
                    'type' => 'string'
                ],
                'device_type' => [
                    'type' => 'string'
                ],
                'certification_type' => [
                    'type' => 'string'
                ],  
               
            ],
        ],
        // 'resetPassword'=>[
        //     "type" => "object",
        //     'properties' => [
        //         "code" => [
        //             "type" => "number"
        //         ],
        //         "password" => [
        //             "type" => "string"
        //         ],
                         
        //     ],

        // ],
      
    ]
];



