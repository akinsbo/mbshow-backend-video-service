<?php

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

$name = $request->get('name', 'World');

$response->setContent(sprintf('Hello %s', htmlspecialchars($name, ENT_QUOTES, 'UTF-8')));

$response->send();
