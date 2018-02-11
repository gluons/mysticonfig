<template lang="pug">
Layout#app
	Header
		Menu(
			mode='horizontal'
			theme='dark'
			:active-name='activeName'
			@on-select='onMenuSelect'
		)
			a.logo(href='./')
				Icon(type='wand', size='30')
				| mysticonfig
			MenuItem(name='home')
				Icon(type='home')
				| Home
	Content
		Row(
			type='flex'
			justify='center'
			align='middle'
		)#container: Col(span='16')
			Alert(show-icon, banner)
				strong Coming soon
				template(slot='desc') Documentation is under construction.
</template>

<script lang="ts">
import Vue from 'vue';

export default Vue.extend({
	name: 'App',
	data() {
		return {
			activeName: 'home'
		};
	},
	methods: {
		onMenuSelect(name) {
			switch (name) {
				case 'home':
					location.href = './';
					break;
			}
		}
	}
});
</script>

<style lang="scss" scoped>
#app, .ivu-layout-content, #container {
	height: 100%;
}
a.logo {
	color: violet;
	font-size: 20px;
	font-weight: bold;
	float: left;
	padding-right: 20px;

	&:hover {
		color: yellow;
	}

	.ivu-icon {
		color: lightgreen;
		margin-right: 6px;
		vertical-align: middle;
	}
}
</style>
