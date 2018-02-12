<template lang="pug">
#start
	section.section: .container
		h1.title Installation
		.content
			pre.copiable
				copy-button(:text='installCode', @success='onCopy', @error='onCopyError')
				code {{ installCode }}
	section.section: .container
		h1.title Usage
		h2.title.is-4 Automatically detect and load config
		.content
			prism(language='ruby').
				require 'mysticonfig'

				loader = Mysticonfig::Loader.new 'appname'
				config = loader.load
		h2.title.is-4 Load config from only JSON file
		.content
			prism(language='ruby').
				require 'mysticonfig'

				loader = Mysticonfig::Loader.new 'appname'
				config = loader.load_json
		h2.title.is-4 Load config from only YAML file
		.content
			prism(language='ruby').
				require 'mysticonfig'

				loader = Mysticonfig::Loader.new 'appname'
				config = loader.load_yaml
</template>

<script lang="ts">
import Vue from 'vue';

const installCode = `gem install mysticonfig`;

export default Vue.extend({
	name: 'GetStarted',
	data() {
		return {
			installCode
		};
	},
	methods: {
		onCopy() {
			this.$toast.open({
				message: 'Copied.',
				type: 'is-success'
			});
		},
		onCopyError() {
			this.$toast.open({
				message: 'Copy fail.',
				type: 'is-danger'
			});
		}
	}
});
</script>
