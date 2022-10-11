<?php

return [
    'paths' => [
    
        "/update_profile" => [
            "post" => [
                "tags" => [
                    "user"
                ],
                "summary" => "Update profile",
                "description" => "Update profile",
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
                         "description" => "User profile",
                         "required" => true,
                         "schema" => [
                                 '$ref' => "#/definitions/updateprofile"
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
        "/address" => [
            "get" => [
                "tags" => [
                    "user"
                ],
                "summary" => "get address",
                "description" => "get address",
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
        "/update_useraddress" => [
            "post" => [
                "tags" => [
                    "user"
                ],
                "summary" => "Update Address",
                "description" => "Update Address",
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
                         "description" => "User address",
                         "required" => true,
                         "schema" => [
                                 '$ref' => "#/definitions/updateaddress"
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
        "/logout" => [
            "post" => [
                "tags" => [
                    "user"
                ],
                "summary" => "logout",
                "description" => "Logout",
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
        "/profile" => [
            "get" => [
                "tags" => [
                    "user"
                ],
                "summary" => "get profile",
                "description" => "get profile",
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
        "/dashboard" => [
            "get" => [
                "tags" => [
                    "user"
                ],
                "summary" => "get dashboard",
                "description" => "get dashboard",
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
                        "name" => "language",
                        "in" => "header",
                        "description" => "language",
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
        "/category" => [
            "get" => [
                "tags" => [
                    "user"
                ],
                "summary" => "get category data",
                "description" => "get category data",
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
                        "name" => "language",
                        "in" => "header",
                        "description" => "language",
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
                    "user"
                ],
                "summary" => "Get notification",
                "description" => "Get notification",
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
                        "name" => "page",
                        "in" => "query",
                        "description" => "Page",
                        "required" => false,
                        "type" => "integer",
                        "format" => "int64",
                    ],
                ],
                "responses" => [
                    "default" => [
                        "description" => "successful operation"
                    ]
                ]
            ]

        ],
      
    ],//updateaddress
    'definitions' => [
        'updateprofile'=>[
            "type" => "object",
            'properties' => [               
                "name" => [
                    "type" => "string"
                ],
                "profile_image" => [
                    "type" => "string"
                ],
                'email' => [
                    'type' => 'string'
                ],
                'shop_name' => [
                    'type' => 'string'
                ],
                'gst_number' => [
                    'type' => 'string'
                ]
            ],
        ],
        'updateaddress'=>[
            "type" => "object",
            'properties' => [               
                "id" => [
                    "type" => "string"
                ],
                "address" => [
                    "type" => "string"
                ],
                'pincode' => [
                    'type' => 'string'
                ],
                'latitude' => [
                    'type' => 'string'
                ],
                'longitude' => [
                    'type' => 'string'
                ]
            ],
        ],
        'changePassword' => [
            "type" => "object",
            'properties' => [
                "current_password" => [
                    "type" => "string"
                ],
                "new_password" => [
                    "type" => "string"
                ],
                "confirm_password" => [
                    "type" => "string"
                ],
            ],
        ],
       
    ]
];
