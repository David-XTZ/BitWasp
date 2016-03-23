<?php
$jp_files = glob('./*_lang.php');

$count = 0;
foreach($jp_files as $jp_file){
    $lang = [];
    $filename = basename($jp_file);
    $en_file = '../english/'.$filename;
    include($jp_file);
    $jp_lang = $lang;
    $php = str_replace('<?php', '', file_get_contents($en_file));
    eval($php);
    $en_lang = $lang;
    foreach($jp_lang as $key => $jp_value){
        if(!$jp_value){
            $jp_lang[$key] = $en_lang[$key];
        }
    }
    $lang = $jp_lang;

    $str = "<?php\n";
    foreach($lang as $key => $value){
        $str .= "\$lang['$key'] = '$value';\n";
    }
    file_put_contents('./'.$jp_file, $str);
    $count ++;
    if($count == 10){
        // die;
    }
}
