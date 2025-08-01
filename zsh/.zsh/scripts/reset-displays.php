<?php

use function pcov\waiting;

/**
 * This script switches the two external displays in my home setup in position.
 *
 * Why do we need this?
 *
 * For some reason MacOS sometimes runs into race conditions which lead to the
 * screen ids to not be 100% presistent. This leads to both my external displays 
 * being swapped regularly and me needing to switch them back - this is really
 * annoying.
 *
 * How do we solve this?
 *
 * The main idea is to use the displayplacer tool. `displayplacer list` will
 * output the current configuration. I would like to parse this, generate a new
 * displayplacer command string from it that has the two screens swapped, and
 * then running the displayplacer command again.
 */

/**
 * Simple Screen class to get info from config paragraph
 */
final class Screen
{
    /**
     * Constructor
     *
     * @param string $output Outut paragraph from displayplacer
     */
    public function __construct(
        public readonly string $output
    ) {
        //
    }

    /**
     * Filter screen ID from the displayplacer paragraph
     *
     * @return string
     */
    public function getId(): string
    {
        $line = preg_grep(
            pattern: '/^Persistent screen id: ([A-Z0-9-]*)$/',
            array: explode(separator: PHP_EOL, string: $this->output),
        )[0];

        return trim(explode(separator: ':', string: $line)[1]);
    }

    /**
     * Return whether this is an internal screen
     *
     * @return bool
     */
    public function isInternalScreen(): bool 
    {
        return str_contains(
            haystack: $this->output,
            needle: 'MacBook built in screen'
        );
    }

    /**
     * Return whether this is an external screen
     *
     * @return bool
     */
    public function isExternalScreen(): bool 
    {
        return ! $this->isInternalScreen();
    }
}

/**
 * Get current displayplacer config split into paragraphs
 *
 * @return list<string>
 */
function getExplodedConfig(): array 
{
    $currentConfig = `displayplacer list`;
    $currentConfigScreens = explode(
        separator: PHP_EOL . PHP_EOL,
        string: $currentConfig
    );

    return $currentConfigScreens;
}

/**
 * Get all available screens
 *
 * @return list<Screen>
 */
function getScreens(): array
{
    $currentConfigScreens =getExplodedConfig();

    $screens = [
        new Screen($currentConfigScreens[0]),
        new Screen($currentConfigScreens[1]),
        new Screen($currentConfigScreens[2]),
    ];

    return $screens;
}

/**
 * Get external screens
 *
 * @return list<Screen>
 */
function getExternalScreens(): array
{
    return array_values(
        array_filter(
            array: getScreens(),
            callback: fn (Screen $screen) => $screen->isExternalScreen()
        )
    );
}

/**
 * Swap screen IDs in current displayplacer output
 *
 * @return string 
 */
function getCommandWithSwappedScreens(): string
{
    $currentConfig = getExplodedConfig();
    $configString = end($currentConfig);

    foreach (getExternalScreens() as $idx => $screen) {
        $configString = str_replace(
            search: $screen->getId(),
            replace: "SCREEN{$idx}",
            subject: $configString
        );
    }

    foreach (array_reverse(getExternalScreens()) as $idx => $screen) {
        $configString = str_replace(
            search: "SCREEN{$idx}",
            replace: $screen->getId(),
            subject: $configString
        );
    }

    return $configString;
}

/**
 * Swap external displays
 *
 * @return void
 */
function swapScreens(): void 
{
    $newCommand = getCommandWithSwappedScreens();

    shell_exec($newCommand);
}

swapScreens();
