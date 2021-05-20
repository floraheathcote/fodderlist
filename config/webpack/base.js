const { webpackConfig, merge } = require("@rails/webpacker")
const ForkTSCheckerWebpackPlugin = require("fork-ts-checker-webpack-plugin")
const customConfig = {
plugins: [new ForkTSCheckerWebpackPlugin()],
resolve: {
extensions: [".css"],
},
}
module.exports = merge(webpackConfig, customConfig)