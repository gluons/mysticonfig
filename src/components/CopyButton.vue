<template lang="pug">
span.copy-button
	button.button(
		type='button'
		title='Copy to clipboard'
		v-clipboard:copy='text'
		v-clipboard:success='onSuccess'
		v-clipboard:error='onError'
	): b-icon(icon='copy')
</template>

<script lang="ts">
import Vue from 'vue';

export default Vue.extend({
	name: 'CopyButton',
	props: {
		text: {
			type: String,
			required: true
		}
	},
	methods: {
		onSuccess(e) {
			this.$emit('success', e);
		},
		onError(e) {
			this.$emit('error', e);
		}
	}
});
</script>
