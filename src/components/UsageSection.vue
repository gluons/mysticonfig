<template lang="pug">
.usage-section
	h2.title.is-4 {{ title }}
	.content: prism(language='ruby'): slot
</template>

<script lang="ts">
import Vue from 'vue';

export default Vue.extend({
	name: 'UsageSection',
	props: {
		title: {
			type: String,
			required: true
		}
	}
});
</script>

