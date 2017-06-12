const { mix } = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.styles([
    'resources/assets/sass/bootstrap.min.css',
    'resources/assets/sass/main.css',
    'resources/assets/sass/font-awesome.min.css',
    'resources/assets/sass/flat-admin.css',
    'resources/assets/sass/blue-sky.css',
    'resources/assets/sass/blue.css',
    'resources/assets/sass/red.css',
    'resources/assets/sass/yellow.css',
    'resources/assets/sass/sweetalert.css'
], 'public/css/all.css');

mix.scripts([
    'resources/assets/js/jquery-3.2.1.min.js',
    'resources/assets/js/bootstrap.min.js',
    'resources/assets/js/sweetalert-dev.js',
    //'resources/assets/js/tinymce.min.js',
    'resources/assets/js/custom.js'
], 'public/js/all.js');

mix.js('resources/assets/js/app.js', 'public/js')
    .sass('resources/assets/sass/app.scss', 'public/css');