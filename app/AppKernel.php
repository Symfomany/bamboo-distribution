<?php

use Symfony\Component\HttpKernel\Kernel;
use Symfony\Component\Config\Loader\LoaderInterface;

class AppKernel extends Kernel
{
    public function registerBundles()
    {
        $bundles = array(

            /**
             * Symfony dependencies
             */
            new \Symfony\Bundle\FrameworkBundle\FrameworkBundle(),
            new \Symfony\Bundle\SecurityBundle\SecurityBundle(),
            new \Symfony\Bundle\TwigBundle\TwigBundle(),
            new \Symfony\Bundle\MonologBundle\MonologBundle(),
            new \Symfony\Bundle\SwiftmailerBundle\SwiftmailerBundle(),
            new \Symfony\Bundle\AsseticBundle\AsseticBundle(),

            /**
             * Third-party dependencies
             */
            new \Doctrine\Bundle\DoctrineCacheBundle\DoctrineCacheBundle(),
            new \Doctrine\Bundle\DoctrineBundle\DoctrineBundle(),
            new Doctrine\Bundle\FixturesBundle\DoctrineFixturesBundle(),
            new \Sensio\Bundle\FrameworkExtraBundle\SensioFrameworkExtraBundle(),
            new \JMS\SerializerBundle\JMSSerializerBundle(),
            new \JMS\AopBundle\JMSAopBundle(),
            new \JMS\SecurityExtraBundle\JMSSecurityExtraBundle(),
            new \Knp\Bundle\GaufretteBundle\KnpGaufretteBundle(),
            new \Mmoreram\ControllerExtraBundle\ControllerExtraBundle(),
            new \Ornicar\GravatarBundle\OrnicarGravatarBundle(),
            new \PaymentSuite\PaymentCoreBundle\PaymentCoreBundle(),
            new \PaymentSuite\FreePaymentBundle\FreePaymentBundle(),

            /**
             * Elcodi core bundles
             */
            new \Elcodi\CoreBundle\ElcodiCoreBundle(),
            new \Elcodi\LanguageBundle\ElcodiLanguageBundle(),
            new \Elcodi\CartBundle\ElcodiCartBundle(),
            new \Elcodi\CartCouponBundle\ElcodiCartCouponBundle(),
            new \Elcodi\CouponBundle\ElcodiCouponBundle(),
            new \Elcodi\BannerBundle\ElcodiBannerBundle(),
            new \Elcodi\CurrencyBundle\ElcodiCurrencyBundle(),
            new \Elcodi\UserBundle\ElcodiUserBundle(),
            new \Elcodi\GeoBundle\ElcodiGeoBundle(),
            new \Elcodi\ProductBundle\ElcodiProductBundle(),
            new \Elcodi\AttributeBundle\ElcodiAttributeBundle(),
            new \Elcodi\MediaBundle\ElcodiMediaBundle(),
            new \Elcodi\RuleBundle\ElcodiRuleBundle(),
            new \Elcodi\NewsletterBundle\ElcodiNewsletterBundle(),

            /**
             * Elcodi store bundle
             */
            new \Elcodi\StoreCoreBundle\StoreCoreBundle(),
            new \Elcodi\StoreProductBundle\StoreProductBundle(),
            new \Elcodi\StoreUserBundle\StoreUserBundle(),
            new \Elcodi\StoreGeoBundle\StoreGeoBundle(),
            new \Elcodi\StoreCartBundle\StoreCartBundle(),
            new \Elcodi\StoreCurrencyBundle\StoreCurrencyBundle,
            new \Elcodi\StoreCartCouponBundle\StoreCartCouponBundle,
            new \Elcodi\PaymentBridgeBundle\PaymentBridgeBundle(),

            /**
             * Elcodi admin bundles
             */
            new \Elcodi\AdminCoreBundle\AdminCoreBundle(),
            new \Elcodi\AdminUserBundle\AdminUserBundle(),
            new \Elcodi\AdminBannerBundle\AdminBannerBundle(),
            new \Elcodi\AdminCartBundle\AdminCartBundle(),
            new \Elcodi\AdminCartCouponBundle\AdminCartCouponBundle(),
            new \Elcodi\AdminCouponBundle\AdminCouponBundle(),
            new \Elcodi\AdminCurrencyBundle\AdminCurrencyBundle(),
            new \Elcodi\AdminMediaBundle\AdminMediaBundle(),
            new \Elcodi\AdminNewsletterBundle\AdminNewsletterBundle(),
            new \Elcodi\AdminProductBundle\AdminProductBundle(),
            new \Elcodi\AdminRuleBundle\AdminRuleBundle(),
        );

        if (in_array($this->getEnvironment(), array('dev', 'test'))) {
            $bundles[] = new Symfony\Bundle\WebProfilerBundle\WebProfilerBundle();
            $bundles[] = new Sensio\Bundle\DistributionBundle\SensioDistributionBundle();
        }

        return $bundles;
    }

    public function registerContainerConfiguration(LoaderInterface $loader)
    {
        $loader->load(__DIR__.'/config/config_'.$this->getEnvironment().'.yml');
    }
}
