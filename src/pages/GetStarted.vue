<template lang="pug">
#start
	section.section: .container
		h1.title Installation
		.content
			pre: code gem install mysticonfig
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

export default Vue.extend({
	name: 'GetStarted'
});
</script>
