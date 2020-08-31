module.exports = {
  test: [/\.bmp$/, /\.gif$/, /\.jpe?g$/, /\.png$/, /\.woff$/, /\.woff2$/, /\.eot$/, /\.ttf$/, /\.svg$/],
  use: [
    {
      loader: "url-loader",
      options: {
        limit: 10000,
        name: "[name]-[hash].[ext]",
      },
    },
  ],
};
