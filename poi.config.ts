import { Options } from 'poi';

const options: Options = {
	entry: './src/main.ts',
	html: {
		title: 'mysticonfig',
		description: 'The configuration loader for wizard.'
	},
	presets: ['typescript']
};

export default options;
