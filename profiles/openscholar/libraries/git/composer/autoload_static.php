<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticIniteede5e01eb40ccdc215e240b2ca05cda
{
    public static $prefixLengthsPsr4 = array (
        'S' => 
        array (
            'Symfony\\Component\\Process\\' => 26,
            'Symfony\\Component\\EventDispatcher\\' => 34,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Symfony\\Component\\Process\\' => 
        array (
            0 => __DIR__ . '/..' . '/symfony/process',
        ),
        'Symfony\\Component\\EventDispatcher\\' => 
        array (
            0 => __DIR__ . '/..' . '/symfony/event-dispatcher',
        ),
    );

    public static $prefixesPsr0 = array (
        'G' => 
        array (
            'GitWrapper' => 
            array (
                0 => __DIR__ . '/..' . '/cpliakas/git-wrapper/src',
            ),
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticIniteede5e01eb40ccdc215e240b2ca05cda::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticIniteede5e01eb40ccdc215e240b2ca05cda::$prefixDirsPsr4;
            $loader->prefixesPsr0 = ComposerStaticIniteede5e01eb40ccdc215e240b2ca05cda::$prefixesPsr0;

        }, null, ClassLoader::class);
    }
}