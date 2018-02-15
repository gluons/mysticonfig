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
		usage-section(title='Automatically detect and load config').
			require 'mysticonfig'

			loader = Mysticonfig::Loader.new 'appname'
			config = loader.load
		usage-section(title='Automatically detect and load config with default config fallback').
			require 'mysticonfig'

			DEFAULT_CONFIG = {
				'a' =&gt; 'A',
				'b' =&gt; 'B',
				'c' =&gt; 'C'
			}
			loader = Mysticonfig::Loader.new('appname', DEFAULT_CONFIG)
			config = loader.load
		usage-section(title='Load config from only JSON file').
			require 'mysticonfig'

			loader = Mysticonfig::Loader.new 'appname'
			config = loader.load_json
		usage-section(title='Load config from only JSON file with default config fallback').
			require 'mysticonfig'

			DEFAULT_CONFIG = {
				'a' =&gt; 'A',
				'b' =&gt; 'B',
				'c' =&gt; 'C'
			}
			loader = Mysticonfig::Loader.new('appname', DEFAULT_CONFIG)
			config = loader.load_json
		usage-section(title='Load config from only YAML file').
			require 'mysticonfig'

			loader = Mysticonfig::Loader.new 'appname'
			config = loader.load_yaml
		usage-section(title='Load config from only YAML file with default config fallback').
			require 'mysticonfig'

			DEFAULT_CONFIG = {
				'a' =&gt; 'A',
				'b' =&gt; 'B',
				'c' =&gt; 'C'
			}
			loader = Mysticonfig::Loader.new('appname', DEFAULT_CONFIG)
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
