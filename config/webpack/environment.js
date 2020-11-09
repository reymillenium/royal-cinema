const {environment} = require('@rails/webpacker')

// In order to use bootstrap with jQuery and Popper:
const webpack = require('webpack')
// Original (Not working here)
// environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
//     $: 'jquery',
//     jQuery: 'jquery/src/jquery',
//     jquery: 'jquery',
//     'window.jQuery': 'jquery',
//     Popper: ['popper.js', 'default']
// }))

// Nuevo copiado (pinchan bien muchas cosas)
environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery',
        Popper: ['popper.js', 'default']
    })
)

// Mix
// environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
//     $: 'jquery/src/jquery',
//     jQuery: 'jquery/src/jquery',
//     jquery: 'jquery/src/jquery',
//     'window.jQuery': 'jquery/src/jquery',
//     Popper: ['popper.js', 'default']
// }))

// Mix 2: Algunas cosas no pinchan:
// environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
//         $: 'jquery/src/jquery',
//         jQuery: 'jquery'
//     })
// )


// Nada pincha con esta mierda
// environment.plugins.append('Provide',
//     new webpack.ProvidePlugin({
//         $: 'jquery',
//         jQuery: 'jquery',
//         Popper: ['popper.js', 'default']
//     })
// )

// Another version copiada de la Internet (No funciona):
// environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
//     $: 'jquery',
//     jQuery: 'jquery',
//     jquery: 'jquery',
//     Popper: ['popper.js', 'default']
// }))

module.exports = environment
