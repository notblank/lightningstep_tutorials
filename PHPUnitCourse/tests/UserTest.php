<?php

use PHPUnit\Framework\TestCase;
#require 'User.php';

class UserTest extends TestCase
{
    public function testReturnFullName()
    {

        $user = new User;

        $user->first_name = 'Teresa';
        $user->surname = 'Green';


        $this->assertEquals('Teresa Green', $user->getFullName());

    }

    public function testFullNameEmptyByDefault()
    {
        $user = new User;
        
        $this->assertEquals('', $user->getFullName());

    }

}


