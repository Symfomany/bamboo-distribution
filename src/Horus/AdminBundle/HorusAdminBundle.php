<?php

namespace Horus\AdminBundle;

use Symfony\Component\HttpKernel\Bundle\Bundle;

class HorusAdminBundle extends Bundle
{
    public function getParent()
    {
        return 'FOSUserBundle';
    }
}
