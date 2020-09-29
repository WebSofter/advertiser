const fs = require('fs')
const path = require('path')
//const HtmlWebpackPlugin = require('html-webpack-plugin')
//const HtmlWebpackInlineSourcePlugin = require('html-webpack-inline-source-plugin')

module.exports = {
    runtimeCompiler: true,
    productionSourceMap: false,
    outputDir: 'public',
    lintOnSave: true,
    publicPath: process.env.NODE_ENV === 'production' ? '/' : '/',
    /*
    filenameHashing: false,
    css: {
      extract: {
        cacheGroups: {
          default: false,
          // Merge all the CSS into one file
          styles: {
            name: 'styles',
            test: m => m.constructor.name === 'CssModule',
            chunks: 'all',
            minChunks: 1,
            enforce: true
          },
        },
      },
    },
    configureWebpack: {
      mode: 'production',
      optimization: {
        splitChunks: false // makes there only be 1 js file - leftover from earlier attempts but doesn't hurt
      },
      plugins: [
        new HtmlWebpackPlugin({
          filename: 'index.html', // the output file name that will be created
          template: 'src/template.html', // this is important - a template file to use for insertion
          //inlineSource: '.(js|css)$' // embed all javascript and css inline
        }),
        new HtmlWebpackInlineSourcePlugin()
      ]
    },
    */
    // Configure the webpack dev server behavior.
    devServer: {
        //open: process.platform === 'darwin',
        host: 'wsofter.ru',
        port: 4545, 
        public: '0.0.0.0:4545',
        //https: true,
        //hotOnly: true,
        // See https://github.com/vuejs/vue-docs-zh-cn/blob/master/vue-cli/cli-service.md#Configuration agent
        //https: {
        //    key: fs.readFileSync('/etc/letsencrypt/live/crm.wsofter.ru/privkey.pem'),
        //    cert: fs.readFileSync('/etc/letsencrypt/live/crm.wsofter.ru/cert.pem'),
        //    ca: fs.readFileSync('/etc/letsencrypt/live/crm.wsofter.ru/chain.pem')
        //},
        proxy: {
            '/api': {
                target: `locallhost:8280`,
                changeOrigin: true,
                secure: false,
                pathRewrite: {
                    "^/api": ""
                }
            }
        },
        disableHostCheck: true,
    },
}