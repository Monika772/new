<?php

return [
    'paths' => [
        "/find-gigrr" => [
            "post" => [
                "tags" => [
                    "gigs"
                ],
                "summary" => "Find gigrr",
                "description" => "find gigrr",
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
                        "description" => "Find gigrr",
                        "required" => true,
                        "schema" => [
                                '$ref' => "#/definitions/find-gigrr"
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
       
        "/search-candidate-via-gigs" => [
            "post" => [
                "tags" => [
                    "gigs"
                ],
                "summary" => "search candidate via gigs wise",
                "description" => "search candidate via gigs wise",
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
                        "description" => "Search Candidate via gig",
                        "required" => true,
                        "schema" => [
                                '$ref' => "#/definitions/search-candidate-gigs"
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
        "/send-gig-request" => [
            "post" => [
                "tags" => [
                    "gigs"
                ],
                "summary" => "Find gigrr",
                "description" => "find gigrr",
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
                        "description" => "Find gigrr",
                        "required" => true,
                        "schema" => [
                                '$ref' => "#/definitions/send-gig-request"
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
        "/gigs-booking" => [
            "post" => [
                "tags" => [
                    "gigs"
                ],
                "summary" => "Add New Gig",
                "description" => "create a new gig",
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
                                '$ref' => "#/definitions/new-gigs"
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
        "/my-gigs" => [
            "get" => [
                "tags" => [
                    "gigs"
                ],
                "summary" => "get all gigs",
                "description" => "get all gigs",
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
        "/sent-offer-gigs" => [
            "get" => [
                "tags" => [
                    "gigs"
                ],
                "summary" => "get all sent offer gigs ",
                "description" => "get all sent offer gigs",
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
        "/my-roster-via-gigs" => [
            "get" => [
                "tags" => [
                    "gigs"
                ],
                "summary" => "get selected candidates via gigs wise",
                "description" => "get selected candidates via gigs wise",
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
                    [
                        "name" => "candidate_id",
                        "in" => "query",
                        "description" => "Candidate id",
                        "required" => false,
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
        "/my-roster-gigs" => [
            "get" => [
                "tags" => [
                    "gigs"
                ],
                "summary" => "get all my roster gigs",
                "description" => "get my roster all gigs",
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
        "/gigs-accepted-candidates" => [
            "get" => [
                "tags" => [
                    "gigs"
                ],
                "summary" => "get gigs accepted candidates",
                "description" => "get gigs accepted candidates",
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
        "/gigs-candidate-offer" => [
            "post" => [
                "tags" => [
                    "gigs"
                ],
                "summary" => "sent gigs offer to candidate",
                "description" => "sent gigs offer to candidate",
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
                                '$ref' => "#/definitions/sent-offer"
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
        "/gigs-candidate-payment" => [
            "post" => [
                "tags" => [
                    "gigs"
                ],
                "summary" => "Transfer payment to candidate via gig",
                "description" => "Transfer payment to candidate via gig",
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
                        "description" => "Transfer payment to candidate via gig",
                        "required" => true,
                        "schema" => [
                                '$ref' => "#/definitions/gigs-payment"
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
        "/gigs-payment-history" => [
            "post" => [
                "tags" => [
                    "gigs"
                ],
                "summary" => "Gigs Payment History",
                "description" => "Gigs Payment History",
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
                        "description" => "Gigs Payment History",
                        "required" => true,
                        "schema" => [
                                '$ref' => "#/definitions/gigs-payment-history"
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
        "/add-candidate-roster" => [
            "post" => [
                "tags" => [
                    "gigs"
                ],
                "summary" => "Add Candidate to Roster",
                "description" => "Add Candidate to Roster",
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
                        "description" => "Add Candidate to Roster",
                        "required" => true,
                        "schema" => [
                                '$ref' => "#/definitions/add-candidate-roster"
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
        "/gigs-calender-wise" => [
            "get" => [
                "tags" => [
                    "gigs"
                ],
                "summary" => "get gigs calender wise",
                "description" => "get gigs calender wise",
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
                        "name" => "start_date",
                        "in" => "query",
                        "description" => "start date",
                        "required" => false,
                        "type" => "string",
                        "format" => "int64"
                    ],
                    [
                        "name" => "end_date",
                        "in" => "query",
                        "description" => "end date",
                        "required" => false,
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
    ],
    'definitions' => [
        'gigs-payment-history' => [
            "type" => "object",
            'properties' => [               
               "candidate_id" => [
                    "type" => "integer"
                ],
                 "start_date" => [
                    "type" => "string"
                ],
                "end_date" => [
                    "type" => "string",
                ]
            ],
        ],
        'gigs-payment' => [
            "type" => "object",
            'properties' => [               
               "gigs_id" => [
                    "type" => "integer"
                ],
                 "candidate_id" => [
                    "type" => "integer"
                ],
                "amount" => [
                    "type" => "string",
                ],
                "payment_mode" => [
                    "type" => "string",
                    "example"=>"cash/online"
                ],
                "transaction_response" => [
                    "type" => "string",
                ],
                "transaction_id" => [
                    "type" => "string",
                ]
            ],
        ],
        'add-candidate-roster' => [
            "type" => "object",
            'properties' => [               
               "gigs_id" => [
                    "type" => "integer"
                ],
                 "candidate_id" => [
                    "type" => "integer"
                ],
                "status" => [
                    "type" => "string",
                    'example'=>'roster/cancel'
                ]
            ],
        ],
        'sent-offer' => [
            "type" => "object",
            'properties' => [               
               "gigs_id" => [
                    "type" => "integer"
                ],
                 "candidate_id" => [
                    "type" => "integer"
                ],
                "offer_amount" => [
                    "type" => "string"
                ]
               
            ],
        ],
        'new-gigs' => [
            "type" => "object",
            'properties' => [               
               "business_id" => [
                    "type" => "integer"
                ],
                 "gigrr_type" => [
                    "type" => "string"
                ],
                 'gig_name' => [
                    'type' => 'string'
                ],
                'start_date' => [
                    'type' => 'string',
                    'example'=>"Y-m-d"
                ],
                'end_date' => [
                    'type' => 'string',
                    'example'=>"Y-m-d"
                ],
                'start_time' => [
                    'type' => 'string',
                    'example'=>"H:i a"
                ],
                'end_time' => [
                    'type' => 'string',
                    'example'=>"H:i a"
                ],
                'from_amount' => [
                    'type' => 'string',
                    'example'=>"300"
                ],
                'to_amount' => [
                    'type' => 'string',
                    'example'=>"400"
                ],
                'price_criteria' => [
                    'type' => 'string',
                    'example'=>'hourly/daily/weekly/monthly/total'
                ]
            ],
        ],
        'find-gigrr' => [
            "type" => "object",
            'properties' => [ 
              "gig_name"=>[
                "type" => "string"
              ],
              "business_id"=>[
                "type" => "integer"
               ],             
               "address" => [
                    "type" => "string"
                ],
                 "latitude" => [
                    "type" => "string"
                ],
                 'longitude' => [
                    'type' => 'string'
                ],
                'start_date' => [
                    'type' => 'string',
                    'example'=>"Y-m-d"
                ],
                'end_date' => [
                    'type' => 'string',
                    'example'=>"Y-m-d"
                ],
                'gender' => [
                    'type' => 'string',
                    'example'=>'male/female/other'
                ],
                'skills' => [
                    'type' => 'string',
                    'example'=>'1,3'
                ],
            ],
        ],
        
        'search-candidate-gigs' => [
            "type" => "object",
            'properties' => [               
                "gigs_id" => [
                    "type" => "integer"
                ],
                "radius" => [
                    "type" => "string"
                ]
            ],
        ],
        'send-gig-request' => [
            "type" => "object",
            'properties' => [               
                "gigs_id" => [
                    "type" => "integer"
                ],
                "candidate_id" => [
                    "type" => "integer"
                ],
                "offer_amount" => [
                    "type" => "string",
                    "example"=>"500.00"
                ]
            ],
        ],
        'search-gigs' => [
            "type" => "object",
            'properties' => [               
                "address" => [
                    "type" => "string"
                ],
                "latitude" => [
                    "type" => "string"
                ],
                 'longitude' => [
                    'type' => 'string'
                ],
                'distence' => [
                    'type' => 'string'
                ],
                'gender' => [
                    'type' => 'string'
                ],
                'available_from' => [
                    'type' => 'string'
                ],
                'available_to' => [
                    'type' => 'string'
                ],
                'shift_availability' => [
                    'type' => 'string',
                    'example'=>'weekends,day,night,morning'
                ],
                'gigrr_type' => [
                    'type' => 'string'
                ],
            ],
        ],
   ]
];
