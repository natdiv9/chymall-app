<?php

function array_to_hsc($array)
{
    $array2 = array_map('strip_tags', $array);
    return array_map('htmlspecialchars', $array2);
}