<?php

namespace Horus\AdminBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use FOS\UserBundle\Model\User as BaseUser;

/**
 * @ORM\Table(name="user")
 * @ORM\Entity
 */
class User extends BaseUser
{
    /**
     * @var $id
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;



    /**
     *
     */
    public function __construct()
    {
        parent::__construct();
        $this->createdAt = new \Datetime('now');
        $this->updatedAt = new \Datetime('now');
        $this->lastActivity = new \Datetime('now');

    }

    /**
     * @return string
     */
    public function __toString(){
        return $this->email." ".$this->username;
    }



    /**
     * Set online datetime
     * @return bool
     */
    public function isOnline()
    {
        $delay = new \DateTime();
        $delay->setTimestamp(strtotime('5 minutes ago'));
        if($this->getLastActivity() < $delay)
            return false;
        return true;
    }

    /**
     * is Active
     * @return bool
     */
    public function isActive(){
        $delay = new \DateTime();
        $delay->setTimestamp(strtotime('5 minutes ago'));
        if($this->getLastActivity() >= $delay )
            return true;
        else
            return false;
    }

    /**
     * is Active Now
     */
    public function isActiveNow()
    {
        $this->setLastActivity(new \DateTime());

        return $this;
    }

    /**
     * Get lastActivity
     *
     * @return \DateTime
     */
    public function getLastActivity()
    {
        return $this->lastActivity;
    }

    /**
     * Set lastActivity
     * @param \DateTime $dateupdate
     */
    public function setLastActivity(\DateTime $dateupdate)
    {
        $this->lastActivity = $dateupdate;
    }
}
