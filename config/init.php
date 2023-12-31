<?php
//ini_set('memory_limit', '2048M');
include_once 'Configuration.php';
include_once __DIR__ . '/../vendor/autoload.php';

spl_autoload_register(function($class){
    $file = __DIR__ . '/../Engine/'. $class.'.php';

    if (file_exists($file)){
        include_once $file;
    }

});

$auth = new Authentication();
$db = Database::getInstance();

Session::startSession();