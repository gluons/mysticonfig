<template lang="pug">
#app
	nav.navbar.is-dark(role='navigation'): .container
		.navbar-brand
			a.navbar-item.has-text-weight-bold#brand-text(href='./')
				span.emoji 🔮
				| mysticonfig
			.navbar-burger(ref='burger', @click='burgerClick'): span(v-for='i in 3')
		.navbar-menu(ref='navmenu', @click='closeNavMobile')
			.navbar-start
				router-link.navbar-item(to='/') Home
				router-link.navbar-item(to='/start') Get started
				router-link.navbar-item(to='/api') API
			.navbar-end
				a.navbar-item(:href='repo', target='_blank')
					b-icon(icon='github', pack='fab')
				a.navbar-item(:href='gplus', target='_blank')
					b-icon(icon='google-plus', pack='fab')
	transition(name='fade', mode='out-in'): router-view
</template>

<script lang="ts">
import Vue from 'vue';

export default Vue.extend({
	name: 'App',
	data() {
		return {
			repo: 'https://github.com/gluons/mysticonfig',
			gplus: 'https://google.com/+SaranTanpituckpong'
		};
	},
	methods: {
		burgerClick(e) {
			let burger: HTMLDivElement = e.target;
			let navmenu:HTMLDivElement = this.$refs.navmenu;
			burger.classList.toggle('is-active');
			// Safe toggle
			if (burger.classList.contains('is-active')) {
				navmenu.classList.add('is-active');
			} else {
				navmenu.classList.remove('is-active');
			}
		},
		closeNavMobile() { // Close navbar on tab in mobile
			let burger: HTMLDivElement = this.$refs.burger;
			let navmenu: HTMLDivElement = this.$refs.navmenu;
			burger.classList.remove('is-active')
			navmenu.classList.remove('is-active');
		}
	}
});
</script>

<style lang="scss" scoped>
#brand-text {
	color: violet;

	&:hover {
		color: yellow;
	}
	.emoji {
		color: initial;
		font-size: 1.5em;
		margin-right: .5rem;
	}
}
</style>
