# Instrucciones para creación de proyecto con Webpack + Eslint

1- Inicializar un package.json ejecutando:

```bash
npm init -y
```

2- Instalar webpack

```bash
npm i webpack --save-dev
```

3- Se necesita webpack-cli, que es un paquete a parte de webpack:

```bash
npm i webpack-cli --save-dev
```

4- babel-loader es el loader de webpack para realizar transpiling     de código ES6 y superior, y poder ejecutarlo como ES5. Se instalarán estos 3 paquetes.

```bash
npm i @babel/core babel-loader @babel/preset-env --save-dev
```

5- Si se quiere configurar webpack 4 con React

```bash
npm i @babel/preset-react --save-dev
```

6- Webpack no sabe como extraer código CSS en un fichero. Para eso usaremos mini-css-extract-plugin

```bash
npm i mini-css-extract-plugin css-loader --save-dev
```

* 6.1 - Minify for production

  ```bash
  npm install --save-dev optimize-css-assets-webpack-plugin
  ```

  ```js  
  const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');

  optimization: {
    minimizer: [new OptimizeCSSAssetsPlugin({})],
  },
  ```

* 6.2 - When using this component, JS files are not minified anymore. Add UglifyJS to solve it.

  ```bash
  npm install uglifyjs-webpack-plugin --save-dev
  ```

  > [webpack.config.js]

  ```js
  const UglifyJsPlugin = require('uglifyjs-webpack-plugin');

  optimization: {
      minimizer: [new UglifyJsPlugin()],
  },
  ```

7- Instalación de servidor web webpacak => webpack dev server. Útil para desarrollo.

```bash
npm i webpack-dev-server --save-dev
```

8- opcional: añadir file-loader (Util para añadir fuentes de google)

```bash
npm install file-loader --save-dev
```

9- obligatorio con ES6 => instalar este plugin para soporte funciones aaa = () => {}

```bash
npm install --save-dev @babel/plugin-proposal-class-properties
```

* Es necesario añadir lo siguiente al webpack.config.js

  > [webpack.config.js]

  ```js
  options: {
      presets: [
          '@babel/preset-env',
          {
              'plugins': ['@babel/plugin-proposal-class-properties']
          }
      ]
  }
  ```

* Y también es necesario instalar el paquete eslint-babel para que el loader no de problemas.

  ```bash
  npm install eslint babel-eslint --save-dev
  ```

* Una vez hecho esto, abrá que añadir lo siguiente al fichero .eslintrc.json

  > [.eslintrc.json]

  ```js
  "parser": "babel-eslint",
  ```

10- Inicar eslint

```bash
eslint --init
```

* Habrá que responder preguntas sobre qué quieres hacer con eslint

* Para ejecutar eslint => eslint [file_name]  => src/index.js

  ```bash
  eslint src/index.js
  ```

11- Opcional => añadir soporte para imágenes

```bash
npm install url-loader file-loader --save-dev
```

> [webpack.config.js]

```js
{
    test: /\.(png|jp(e*)g|svg)$/,
    use: [
        {
            loader: 'url-loader',
            options: {
                limit: 8000, // Convert images < 8kb to base64 strings
                name: 'images/[hash]-[name].[ext]',
            },
        },
    ],
},
```

12- Opcional => Añadir soporte para fuentes

```bash
npm install file-loader --save-dev
```

> [webpack.config.js]

```js
{
    test: /\.(eot|woff|woff2|ttf|svg)$/,
    use: [
        {
            loader: 'file-loader',
            options: {
                name: '[name].[ext]',
                outputPath: 'fonts/',
                publicPath: '../fonts/',
            },
        },
    ],
},
```

13- Instalar webpack-merge

```bash
npm i webpack-merge
```

14- Instalar clean-webpack-plugin

```bash
npm i clean-webpack-plugin
```

## TIPS

* Si tratas de ejecutar cualquier comando npm y no hace nada, sacando errores recurrentes, prueba a limpiar caché

```bash
npm cache verify
```

## Ejemplo webpack.config.js

```js
const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const webpack = require('webpack');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');

/**
 * PATHS defines the folders involved on the different processes.
 *
 * @src is the folder with the library sources.
 * @build is the folder for build's output.
*/
const PATHS = {
    src:   path.join(__dirname, 'src'),
    build: path.join(__dirname, 'dist'),
 };

module.exports = {
    entry: PATHS.src,
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'main.js',    // nombre del fichero que se generará como output
        libraryTarget: 'var', // para indicar que queremos usar la librería como variable, se puede usar window como variable asociada a este scope.
        library: 'test', // nombre de la variable que usaremos para instanciar nuestra libreria
    },
    module: {
        rules: [
            {
                test: /\.txt$/,
                use: 'raw-loader'
            },
            // The configuration above has defined a rules property for a single module with two required properties: test and use.
            // This tells webpack's compiler the following:
            // "Hey webpack compiler, when you come across a path that resolves to a '.txt' file inside of a require()/import statement,
            // use the raw-loader to transform it before you add it to the bundle."
            {
                test: /\.js$/,
                exclude: /node_modules/,
                use: {
                    loader: 'babel-loader',
                    options: {
                        presets: ['@babel/preset-env',
                            {
                                'plugins': ['@babel/plugin-proposal-class-properties']
                            }
                        ]
                    }
                },
            },
            {
                test: /\.css$/,
                use: [
                    {
                        loader: MiniCssExtractPlugin.loader,
                        options: {
                            publicPath: '../'
                        }
                    },
                    "css-loader"
                ]
            },
            { // for images
                test: /\.(png|jp(e*)g|svg)$/,
                use: [
                    {
                        loader: 'url-loader',
                        options: {
                            limit: 8000, // Convert images < 8kb to base64 strings
                            name: 'images/[hash]-[name].[ext]',
                        },
                    },
                ],
            },
            { // for fonts
                test: /\.(eot|woff|woff2|ttf|svg)$/,
                use: [
                    {
                        loader: 'file-loader',
                        options: {
                            name: '[name].[ext]',
                            outputPath: 'fonts/',
                            publicPath: '../fonts/',
                        },
                    },
                ],
            },
        ]
    },
    devServer: {
        contentBase: PATHS.build,
        compress: true,
        port: 9500
    },
    plugins: [
        new MiniCssExtractPlugin({
            filename: '[name].css',
            chunkFilename: '[id].css'
        }),
        new webpack.ProvidePlugin({
            $: 'jquery',
            jQuery: 'jquery',
            landing_commander: path.resolve(__dirname, './node_modules/landing_commander/dist/main.js'), // adding landing-commander local repo
        }),
    ],
    optimization: {
        minimizer: [new UglifyJsPlugin(), new OptimizeCSSAssetsPlugin({})],
    },
};
```

## Entornos de compilación

Añade esta configuración en la sección script en package.json. Para ejecutar npm en diferentes entornos

``` js
"scripts": {
    "start": "webpack-dev-server --mode development --open",
    "dev": "webpack --mode development --progress --watch",
    "build": "webpack --mode production",
    "test": "echo \"Error: no test specified\" && exit 1"
},
```

Para ejecutar con npm:

```bash
npm run dev
```

## Añadir landing_commader

```bash
npm install @josedelrio85/landing_commander@1.0.26
```