const { environment } = require('@rails/webpacker')
const erb = require('./loaders/erb')
const url = require('./loaders/url')
const modernizr = require('./modernizr')

environment.config.merge(modernizr)
  
environment.loaders.prepend('url', url)
environment.loaders.prepend('erb', erb)
module.exports = environment
