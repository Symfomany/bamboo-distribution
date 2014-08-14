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

namespace Elcodi\AdminExampleBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;

use Elcodi\CoreBundle\DataFixtures\ORM\Abstracts\AbstractFixture;
use Elcodi\MenuBundle\Entity\Menu\Node;

/**
 * Class AdminMenuData
 */
class AdminMenuData extends AbstractFixture
{
    /**
     * Factors a new menu Node
     *
     * Alias for elcodi.factory.menu service create() method
     *
     * @return Node
     */
    private function createNewNode()
    {
        return $this
            ->container
            ->get('elcodi.factory.menu_node')
            ->create();
    }

    /**
     * Load data fixtures with the passed EntityManager
     *
     * @param ObjectManager $manager
     */
    public function load(ObjectManager $manager)
    {

        $adminMenu = $this
            ->container
            ->get('elcodi.factory.menu')
            ->create();

        $adminMenu
            ->setCode('admin')
            ->enable();

        $manager->persist($adminMenu);
        $this->addReference('menu-admin', $adminMenu);

        $adminUsersNode = $this
            ->createNewNode()
            ->setName('Admin users')
            ->setUrl('/admin/user/admins')
            ->enable();

        $manager->persist($adminUsersNode);

        $customersNode = $this
            ->createNewNode()
            ->setName('Admin users')
            ->setUrl('/admin/user/admins')
            ->enable();

        $manager->persist($customersNode);

        $userNode = $this
            ->createNewNode()
            ->setName('User')
            ->setUrl('')
            ->addSubnode($adminUsersNode)
            ->addSubnode($customersNode)
            ->enable();

        $manager->persist($userNode);

        $manager->flush();
    }
}
