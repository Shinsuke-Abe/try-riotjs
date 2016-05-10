var webpack = require('webpack');

module.exports = {
  entry: './apps/entry.js',
  output: {
    path: __dirname + '/public',
    filename: 'bundle.js'
  },
  plugins: [
    new webpack.ProvidePlugin({
      riot: 'riot'
    })
  ],
  module: {
    preLoaders: [
      { test: /\.tag$/, exclude: /node_modules/, loader: 'riotjs-loader', query: { type: 'none' } }
    ],
    loaders: [
      { test: /\.js$|\.tag$/, exclude: /node_modules/, loader: 'babel-loader' },
      { test: /\.css$/, exclude: /node_modules/, loader: 'style-loader!css-loader'},
      { test: /\.scss$/, exclude: /node_modules/, loader: 'style-loader!css-loader!sass-loader'}
    ]
  },
  devServer: {
    contentBase: './public'
  }
};