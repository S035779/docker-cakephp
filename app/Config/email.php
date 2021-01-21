<?php

class EmailConfig {

  public $smtp = array(
    'transport' => 'Smtp',
    'from' => array('site@localhost' => 'My Site'),
    'host' => 'crawler_mailhog_1',
    'port' => 1025,
    'timeout' => 30,
    'username' => 'user',
    'password' => 'secret',
    'client' => null,
    'log' => false,
    //'charset' => 'utf-8',
    //'headerCharset' => 'utf-8',
  );

}

