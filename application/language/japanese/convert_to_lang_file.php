<?php

if(!isset($argv[1]) || !is_file($argv[1])){
    echo "Usage: $argv[0] input output";
    exit -1;
}

$content = file_get_contents($argv[1]);

// remove html tag
$content = preg_replace('/<[^>]+>/', "\n", $content);
// remove smarty tag
$content = preg_replace('/\{[^\}]+\}/', "\n", $content);
// remove html entity
$content = preg_replace('/&[a-zA-Z0-9]{1,8};/', "\n", $content);

$content_array = explode("\n", $content);
$valid_content_array = [];
foreach($content_array as $key => $line){
    $trimmed_line = trim($line);
    if($trimmed_line){
        if(not_a_link($trimmed_line)){
            $key_str = trim(str_to_key($trimmed_line));
            $normalized_line = trim(normalize_line($trimmed_line));
            if($key_str && $normalized_line ){
                $valid_content_array[$key_str] = $normalized_line;
            }
        }
    }
}


$out = "<?php\n";
foreach($valid_content_array as $key => $line){
    $out .= ('$lang[\''.$key.'\'] = \''.$line."';\n");
}

if(isset($argv[2])){
    file_put_contents($argv[2], $out);
}else{
    echo $out;
}

function normalize_line($line){
    return preg_replace('/[-_:\s]+$/', '', $line);
}

function not_a_link($str){
    return (!preg_match('@/[-_a-zA-Z0-9]+/@', $str) && !preg_match('@/$@', $str) && !preg_match('@^/@', $str))
        || strlen($str) > 30;
}

function str_to_key($str){
    $word_array = preg_split('/[^0-9a-zA-Z]+/', $str);
    $word_array = array_map('strtolower', $word_array);
    $word_array = array_filter($word_array, 'strlen');
    $words = array_slice($word_array, 0, 5);
    return implode('_', $words);
}

