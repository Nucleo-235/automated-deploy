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
  $composerConfig['scripts']['post-update-cmd'][(int)$index] = 'cghooks update > /dev/null 2>&1';
}

// Add the deploy script
$command = 'export $(cat .env | xargs) && . \\"$PWD/deploy/laravel/scripts/on-update.sh\\"';
$index = array_search($command, $composerConfig['scripts']['post-update-cmd'], false);
if (false === $index) {
  $composerConfig['scripts']['post-update-cmd'][] = $command;
}

file_put_contents('composer.json', json_encode($composerConfig, JSON_PRETTY_PRINT));

?>
