import iView from 'iview';
import Vue from 'vue';

import App from './App.vue';

// Stylesheets
import 'iview/dist/styles/iview.css';
import './scss/main.scss';

// Plugins
Vue.use(iView);

new Vue({
	el: '#app',
	render: h => h(App)
});
