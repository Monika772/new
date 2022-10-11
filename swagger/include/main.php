<?php

$config             = require_once('config.php');

$account            = require_once('account.php');

//$user               = require_once('user.php');

//$common             = require_once('common.php');


$array              = array_merge($account['paths']);

$definitions        = array_merge($account['definitions']);

$json = [

    "swagger" => "2.0",

    "info" => [

        "version" => "2.0.0",

        "title" => "Surakshakadi API"

    ],

    "host" => $config['baseUrl'],

    "basePath" => "/api",

    "schemes" => [

        "http"

    ],

    "tags" => [

       

        [

            "name" => 'account',

            "description" => "All Account api"

        ],

        // [

        //     "name" => 'user',

        //     "description" => "All User Api"

        // ],

        // [

        //     "name" => 'common',

        //     "description" => "All Common Api"

        // ]

    ],

    'paths' => $array,

    'definitions' => $definitions

];

echo json_encode($json);



