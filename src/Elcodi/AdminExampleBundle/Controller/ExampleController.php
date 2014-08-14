<?php

/**
 * This file is part of the Elcodi package.
 *
 * Copyright (c) 2014 Elcodi.com
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * Feel free to edit as you please, and have fun.
 *
 * @author Marc Morera <yuhu@mmoreram.com>
 * @author Aldo Chiecchia <zimage@tiscali.it>
 */

namespace Elcodi\AdminExampleBundle\Controller;

use Elcodi\AdminCoreBundle\Controller\Abstracts\AbstractAdminController;
use Elcodi\AdminCoreBundle\Controller\Interfaces\EnableableControllerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

/**
 * Class Controller for Rule
 *
 * @Route(
 *      path = "/example",
 * )
 */
class ExampleController
    extends
    AbstractAdminController
    implements
    EnableableControllerInterface
{
    /**
     * @Route(
     *     path = "s/{page}/{limit}/{orderByField}/{orderByDirection}",
     *     name = "admin_example_list",
     *     requirements = {
     *         "page" = "\d*",
     *         "limit" = "\d*"
     *     },
     *     defaults = {
     *          "page" = "1",
     *          "limit" = "50",
     *          "orderByField" = "id",
     *          "orderByDirection" = "DESC"
     *      }
     * )
     *
     * @Template()
     * @return array
     */
    public function listAction()
    {
        return [];
    }
}