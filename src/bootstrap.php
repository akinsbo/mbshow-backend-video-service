<?php

declare(strict_types = 1);

/*
 * MaryBoyeShow
 *
 * 2017 (c) Olaolu Akinsete <oa01@ledebe.com>
 *
 * This is video service for MaryBoyeShow.
 *
 * @author Olaolu Akinsete
 */

$input = $_GET['name'] ?? 'World';

printf('Hello %s', htmlspecialchars($input, ENT_QUOTES, 'UTF-8'));


