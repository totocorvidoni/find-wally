import { mount } from '@vue/test-utils';
import Vue from 'vue';
import App from '@/App';
import axios from 'axios';

jest.mock('axios');
axios.get = jest.fn().mockResolvedValue({ data: 'testToken' });
// console.log(axios.get());

test('On mount gets an identifier token from the API', async () => {
  // Vue.prototype.axios = axios;
  // console.log(mount(App).vm)
  // const wrapper = await mount(App);
  // console.log(wrapper.vm.userToken);
  // expect(wrapper.vm.userToken).toBe('testToken');
});
