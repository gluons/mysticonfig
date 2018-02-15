<template lang="pug">
#api
	section.section: .container
		h1.title
			| Mysticonfig::Loader
			class-tag
		.content.is-size-5
			p Configuration loader.
	section.section: .container
		h2.title.is-4
			| (Loader) initialize(appname, default_config = {})
			method-tag
			constructor-tag
		.content.is-size-5
			p Returns a new instance of #[strong Loader].
			strong Parameters:
			ul
				li
					p
						strong appname
						|
						| (#[code String]) — App name.
					blockquote It's used to determine config file name.
					prism(language='ruby').
						loader = Mysticonfig::Loader.new 'lolapp'
						# It'll lookup for .lolapprc, .lolapprc.json, .lolapprc.yaml or .lolapprc.yml
				li
					p
						strong default_config
						|
						| (#[code Hash]) #[em (default to #[code {}])] — Default configuration.
	section.section: .container
		h2.title.is-4
			| (Hash) load
			method-tag
		.content.is-size-5
			p Find and load config file. (Automatically detect)
			strong Return:
			ul: li
				p (#[code Hash]) — Configuration.
				blockquote It'll be #[strong empty] #[code Hash] if can't find any config file.
	section.section: .container
		h2.title.is-4
			| (Hash) load_json
			method-tag
		.content.is-size-5
			p Find and load #[strong JSON] config file.
			strong Return:
			ul: li
				p (#[code Hash]) — Configuration.
				blockquote It'll be #[strong empty] #[code Hash] if can't find any config file.
	section.section: .container
		h2.title.is-4
			| (Hash) load_yaml
			method-tag
		.content.is-size-5
			p Find and load #[strong YAML] config file.
			strong Return:
			ul: li
				p (#[code Hash]) — Configuration.
				blockquote It'll be #[strong empty] #[code Hash] if can't find any config file.
</template>

<script lang="ts">
import Vue from 'vue';

export default Vue.extend({
	name: 'API'
});
</script>

<style lang="scss" scoped>
.tag {
	margin: .25em;

	&:first-of-type {
		margin-left: .5em;
	}
}
</style>
