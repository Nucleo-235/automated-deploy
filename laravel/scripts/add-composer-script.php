<?php

$composerConfig = json_decode(file_get_contents('composer.json'), true);

if (!array_key_exists('scripts', $composerConfig)) {
  $composerConfig['scripts'] = [];
}

if (!array_key_exists('post-update-cmd', $composerConfig['scripts'])) {
  $composerConfig['post-update-cmd'] = [];
}

// Make the cghooks stop throwing errors
$command = 'cghooks update';
$index = array_search($command, $composerConfig['scripts']['post-update-cmd'], false);
if (false !== $index) {
  unset($composerConfig['scripts']['post-update-cmd'][(int)$index]);
}

// Add the deploy script
$command = 'export $(cat .env | xargs) && . "$PWD/deploy/laravel/scripts/on-update.sh"';
$index = array_search($command, $composerConfig['scripts']['post-update-cmd'], false);
if (false === $index) {
    if (count($composerConfig['scripts']['post-update-cmd']) == 0) {
        $composerConfig['scripts']['post-update-cmd'] = [ $command ];
    } else {
        array_push($composerConfig['scripts']['post-update-cmd'], $command);
    }
}

file_put_contents('composer.json', json_encode($composerConfig, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES));

?>
