<template lang="pug">
#home
	section.hero.is-warning.is-fullheight: .hero-body: .container.has-text-centered
		h1.title.is-1 mysticonfig
		h2.subtitle.is-2 🔮 The configuration loader for wizard.
		.buttons.is-centered
			router-link(to='/start').button.is-primary
				b-icon(icon='play-circle')
				span Get started
			a.button(href='https://github.com/gluons/mysticonfig', target='_blank')
				b-icon(icon='github', pack='fab')
				span View on GitHub
</template>

<script lang="ts">
import Vue from 'vue';

export default Vue.extend({
	name: 'Home'
});
</script>
