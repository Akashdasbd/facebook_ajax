<?php 



function move (array $files , $path = "media/"){
    $tmp_name = $files["tmp_name"];
    $file_name = $files["name"];
   


    // get file extension

    $file_arr = explode(".",$file_name);
    $file_ext = strtolower(end($file_arr));
    
    // file name unique
    
        $file_neme_unique = time()."_". rand(1000,100000) . "_". str_shuffle("1234567890").".". $file_ext ; 

        move_uploaded_file($tmp_name , $path . $file_neme_unique);

    return $file_neme_unique;
} 


/**
 * Summary of careat alert
 * @param mixed $msg
 * @param mixed $type
 * @return string
 */
function careat_alert ($msg , $type = "danger"){
    return "<p class=\" alert alert-{$type} d-flex justify-content-between\">{$msg}<button class=\" btn-close\" data-bs-dismiss =\"alert\"></button></p>";
}



function generateUniqueId($prefix = "USER")
{
    // Step 1: 4-byte timestamp (current time in seconds since the Unix epoch)
    $timestamp = pack('N', time());

    // Step 2: 5-byte random value, using PHP's random_bytes function
    $randomValue = substr(bin2hex(random_bytes(5)), 0, 10);

    // Step 3: 3-byte incrementing counter (static ensures it increments with each call)
    static $counter = 0;
    $counter = ($counter + 1) % 0xFFFFFF;  // Mod 0xFFFFFF to keep it within 3 bytes
    $counterBin = pack('N', $counter);
    $counterBin = substr($counterBin, 1, 3); // We only need the last 3 bytes

    // Combine all parts and convert to hexadecimal
    $uniqueId = $prefix . bin2hex($timestamp) . $randomValue . bin2hex($counterBin);

    return $uniqueId;
}

/**
 * Summary of timeAgo
 * @param mixed $timestamp
 * @return string
 */

function timeAgo($timestamp) {
    $timeDifference = time() - $timestamp;

    if ($timeDifference < 1) {
        return 'just now';
    }

    $timeIntervals = [
        12 * 30 * 24 * 60 * 60 => 'year',
        30 * 24 * 60 * 60      => 'month',
        24 * 60 * 60           => 'day',
        60 * 60                => 'hour',
        60                     => 'minute',
        1                      => 'second'
    ];

    foreach ($timeIntervals as $seconds => $unit) {
        $interval = floor($timeDifference / $seconds);

        if ($interval >= 1) {
            return $interval . ' ' . $unit . ($interval > 1 ? 's' : '') . ' ago';
        }
    }
}


