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
            new \Doctrine\Bundle\FixturesBundle\DoctrineFixturesBundle(),
            new \Sensio\Bundle\FrameworkExtraBundle\SensioFrameworkExtraBundle(),

            new \Knp\Bundle\GaufretteBundle\KnpGaufretteBundle(),
            new \Mmoreram\ControllerExtraBundle\ControllerExtraBundle(),
            new \Ornicar\GravatarBundle\OrnicarGravatarBundle(),
            new \PaymentSuite\PaymentCoreBundle\PaymentCoreBundle(),
            new \PaymentSuite\FreePaymentBundle\FreePaymentBundle(),
            new Stof\DoctrineExtensionsBundle\StofDoctrineExtensionsBundle(),

            /**
             * Elcodi core bundles
             */
            new \Elcodi\Bundle\CoreBundle\ElcodiCoreBundle(),
            new \Elcodi\Bundle\LanguageBundle\ElcodiLanguageBundle(),
            new \Elcodi\Bundle\CartBundle\ElcodiCartBundle(),
            new \Elcodi\Bundle\CartCouponBundle\ElcodiCartCouponBundle(),
            new \Elcodi\Bundle\CouponBundle\ElcodiCouponBundle(),
            new \Elcodi\Bundle\BannerBundle\ElcodiBannerBundle(),
            new \Elcodi\Bundle\CurrencyBundle\ElcodiCurrencyBundle(),
            new \Elcodi\Bundle\UserBundle\ElcodiUserBundle(),
            new \Elcodi\Bundle\GeoBundle\ElcodiGeoBundle(),
            new \Elcodi\Bundle\ProductBundle\ElcodiProductBundle(),
            new \Elcodi\Bundle\AttributeBundle\ElcodiAttributeBundle(),
            new \Elcodi\Bundle\MediaBundle\ElcodiMediaBundle(),
            new \Elcodi\Bundle\RuleBundle\ElcodiRuleBundle(),
            new \Elcodi\Bundle\NewsletterBundle\ElcodiNewsletterBundle(),
            new \Elcodi\Bundle\MenuBundle\ElcodiMenuBundle(),

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
            new \Elcodi\AdminAttributeBundle\AdminAttributeBundle(),
            new \Elcodi\AdminProductBundle\AdminProductBundle(),
            new \Elcodi\AdminRuleBundle\AdminRuleBundle(),

            /*
             * Local project bundles
             */

            new Horus\AdminBundle\HorusAdminBundle(),
            new Horus\FrontBundle\HorusFrontBundle(),
        );

        if (in_array($this->getEnvironment(), array('dev', 'test'))) {
            $bundles[] = new Symfony\Bundle\WebProfilerBundle\WebProfilerBundle();
            $bundles[] = new Sensio\Bundle\DistributionBundle\SensioDistributionBundle();
            $bundles[] = new Sensio\Bundle\GeneratorBundle\SensioGeneratorBundle();

        }

        return $bundles;
    }

    public function registerContainerConfiguration(LoaderInterface $loader)
    {
        $loader->load(__DIR__.'/config/config_'.$this->getEnvironment().'.yml');
    }
}
