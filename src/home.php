<?php

declare(strict_types = 1);
require_once __DIR__ . '/../vendor/autoload.php';
/*
 * MaryBoyeShow
 *
 * 2017 (c) Olaolu Akinsete <oa01@ledebe.com>
 *
 * This is video service for MaryBoyeShow.
 *
 * @author Olaolu Akinsete
 */

// framework/index.php
require_once __DIR__ . '/bootstrap.php';

$response->setContent("Homepage");

$response->send();

