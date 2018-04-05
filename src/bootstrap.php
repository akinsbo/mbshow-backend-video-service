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

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

$request = Request::createFromGlobals();

$name = $request->get('name', 'World');

$response = new Response(sprintf('Hello %s', htmlspecialchars($name, ENT_QUOTES, 'UTF-8')));

$response->send();

