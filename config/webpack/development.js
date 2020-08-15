process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')
const chokidar = require('chokidar')

module.exports = environment.toWebpackConfig()

environment.config.devServer.before = (app, server) => {
  chokidar.watch([
    'config/locales/**/*.yml',
    'app/views/**/*.html.erb', 
    'app/assets/**/*.scss'
  ]).on('change', () => server.sockWrite(server.sockets, 'content-changed'))
}

