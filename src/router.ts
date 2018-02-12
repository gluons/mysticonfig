import VueRouter, { RouteConfig } from 'vue-router';

import API from './pages/API.vue';
import GetStarted from './pages/GetStarted.vue';
import Home from './pages/Home.vue';

const routes: RouteConfig[] = [
	{
		path: '/',
		component: Home
	},
	{
		path: '/start',
		component: GetStarted
	},
	{
		path: '/api',
		component: API
	}
];

const router = new VueRouter({
	routes,
	linkExactActiveClass: 'is-active'
});

export default router;
