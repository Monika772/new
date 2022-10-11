<?php

return [
    'paths' => [
        "/setting" => [
            "get" => [
                "tags" => [
                    "common"
                ],
                "summary" => "Setting",
                "description" => "get setting",
                "consumes" => [
                    "application/json"
                ],
                "produces" => [
                    "application/json"
                ],
                "parameters" => [],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/contact-subject" => [
            "get" => [
                "tags" => [
                    "common"
                ],
                "summary" => "Contact subjects",
                "description" => "Contact subjects",
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
                    ]
                ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/send-contactus" => [
            "post" => [
                "tags" => [
                    "common"
                ],
                "summary" => "Send Contact request to admin",
                "description" => "Send Contact request to admin",
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
                        "description" => "Send Contact request to admin",
                        "required" => true,
                        "schema" => [
                                '$ref' => "#/definitions/save-contactus"
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
        
        "/privacy-policy" => [
            "get" => [
                "tags" => [
                    "common"
                ],
                "summary" => "Privacy Policy",
                "description" => "Privacy Policy",
                "consumes" => [
                    "application/json"
                ],
                "produces" => [
                    "application/json"
                ],
                "parameters" => [
                   
                ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/terms-condition" => [
            "get" => [
                "tags" => [
                    "common"
                ],
                "summary" => "Terms Conditions",
                "description" => "Terms Conditions",
                "consumes" => [
                    "application/json"
                ],
                "produces" => [
                    "application/json"
                ],
                "parameters" => [
                   
                ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/about-us" => [
            "get" => [
                "tags" => [
                    "common"
                ],
                "summary" => "About us",
                "description" => "About us",
                "consumes" => [
                    "application/json"
                ],
                "produces" => [
                    "application/json"
                ],
                "parameters" => [
                  
                ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/faq" => [
            "get" => [
                "tags" => [
                    "common"
                ],
                "summary" => "FAQ",
                "description" => "FAQ",
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
        "/notifications" => [
            "get" => [
                "tags" => [
                    "common"
                ],
                "summary" => "Notifications",
                "description" => "get notifications",
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
        "/delete-notification" => [
            "get" => [
                "tags" => [
                    "common"
                ],
                "summary" => "Delete All Notifications",
                "description" => "Delete All user notifications",
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
        "/notification-switch" => [
            "get" => [
                "tags" => [
                    "common"
                ],
                "summary" => "Switch Notification On/Off",
                "description" => "Switch Notification On/Off",
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
                        "name" => "status",
                        "in" => "query",
                        "description" => "status",
                        "required" => true,
                        "type" => "string",
                        "format" => "int64",
                        "example"=>"on/off"
                    ],
                ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]
        ],
        "/rating-review" => [
            "post" => [
                "tags" => [
                    "common"
                ],
                "summary" => "Rating/Review",
                "description" => "Rating/Review",
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
                         "description" => "Rating/Review",
                         "required" => true,
                         "schema" => [
                                 '$ref' => "#/definitions/rating-review"
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
        "/save-chat" => [
            "post" => [
                "tags" => [
                    "common"
                ],
                "summary" => "Save Chat",
                "description" => "Save Chat",
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
                        "description" => "Save Chat",
                        "required" => true,
                        "schema" => [
                                '$ref' => "#/definitions/save-chat"
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
        "/get-chat" => [
            "get" => [
                "tags" => [
                    "common"
                ],
                "summary" => "get Chat",
                "description" => "get Chat",
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
                    ]
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
        'save-chat'=> [
            "type" => "object",
            'properties' => [               
                "message" => [
                    "type" => "string"
                ],
            ],
        ],
        'get-chat'=> [
            "type" => "object",
            'properties' => [               
               "to_user" => [
                    "type" => "integer"
                ]
            ],
        ],
        'save-contactus'=> [
            "type" => "object",
            'properties' => [               
               "subject_id" => [
                    "type" => "integer"
                ],
                "message" => [
                    "type" => "string"
                ],
               
            ],
        ],
        'rating-review' => [
            "type" => "object",
            'properties' => [               
               "gigs_id" => [
                    "type" => "integer"
                ],
                "candidate_id" => [
                    "type" => "integer"
                ],
                "rating" => [
                    "type" => "string",
                    "example"=>"1/2/3/4/5"
               ],
                "comments" => [
                    "type" => "string"
                ],
               
            ],
        ],
   ]
];
