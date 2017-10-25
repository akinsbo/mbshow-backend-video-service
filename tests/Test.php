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

use PHPUnit\Framework\TestCase;

class IndexTest extends TestCase {

    public function testHello() {
        $_GET['name'] = 'Olaolu';

        ob_start();
        include 'src/bootstrap.php';
        $content = ob_get_clean();

        $this->assertEquals('Hello Olaolu', $content);
    }

}
