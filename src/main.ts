import Buefy from 'buefy';
import Vue from 'vue';
import VueClipboard from 'vue-clipboard2';
import Prism from 'vue-prism-component';
import VueRouter from 'vue-router';

import App from './App.vue';
import * as components from './components';
import router from './router';

import 'prismjs';
import 'prismjs/components/prism-bash';
import 'prismjs/components/prism-ruby';

// Stylesheets
import 'buefy/lib/buefy.css';
import 'prismjs/themes/prism.css';
import './scss/main.scss';

// Plugins
Vue.use(VueRouter);
Vue.use(Buefy, {
	defaultIconPack: 'fas'
});
Vue.use(VueClipboard);

// Components
Object.keys(components).forEach(name => {
	Vue.component(name, components[name]);
});
Vue.component('prism', Prism);

new Vue({
	el: '#app',
	render: h => h(App),
	router
});
