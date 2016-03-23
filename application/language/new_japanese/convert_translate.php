<?php

function translate($str){

$command = <<<'EOF'

curl -s 'https://translate.google.com/?hl=en&ie=UTF8&langpair=en%7Cja&text=__URL_ENCODED_TEXT_HERE__'  -H 'Host: translate.google.com' -H 'User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101 Firefox/38.0 Iceweasel/38.7.1' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed  -H 'Connection: keep-alive' -H 'Cache-Control: max-age=0'  | grep 'TTS_TEXT_SIZE_LIMIT=200' | grep 'TRANSLATED_TEXT' | grep 'INPUT_TOOL_PATH' | sed -e 's/^.*TTS_TEXT_SIZE_LIMIT=200;TRANSLATED_TEXT='"'"'\(.*\)'"'"';INPUT_TOOL_PATH=.*$/\1/'

EOF;

$command = str_replace('__URL_ENCODED_TEXT_HERE__', urlencode($str),$command);

return exec($command);
}

// echo translate("Hello, world! Today's news is big.");

$files = glob('../japanese/*_lang.php');

foreach($files as $file){
    $str = "<?php\n";
    $lang = [];
    include($file);
    foreach($lang as $key => $value){
        $translated = escapeshellcmd(translate($value));
        $str .= "\$lang['$key'] = '$translated';\n";
    }
    file_put_contents('./'.basename($file), $str);
}
