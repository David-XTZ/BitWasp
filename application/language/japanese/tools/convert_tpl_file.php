<?php

if(!isset($argv[1]) || !is_file($argv[1])){
    echo "usage: $argv[0] targetfile";
    exit -1;
}

$lang = [];

$include_target = glob('*_lang.php');
foreach($include_target as $file){
    include($file);
}


$lang2 = array_filter($lang, function($e){return is_string($e) && strlen($e) > 15;});


$lang2_replaces = array_map(function($e){ return "{lang('".$e."')}";},array_keys($lang2));
$lang2_patterns = array_values($lang2);

ksort($lang2_replaces);
ksort($lang2_patterns);

$result =  str_replace($lang2_patterns, $lang2_replaces, file_get_contents($argv[1]));

if(isset($argv[2]) && is_file($argv[2])){
    file_put_contents($argv[2], $result);
}else{
    echo $result;
}
