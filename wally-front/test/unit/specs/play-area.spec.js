import { mount } from '@vue/test-utils';
import playArea from '@/components/play-area';

const wrapper = mount(playArea, {
  propsData: {
    found: {
      wally: false,
      wenda: false,
      woof: false,
      wbeard: false,
      odlaw: false,
    },
  },
});

test('When guessing, character picker should exist', () => {
  wrapper.setData({ guessing: true });
  const picker = wrapper.find('#character-picker');
  expect(picker.exists()).toBeTruthy();
});

test('When not guessing, character picker should not exist', () => {
  const picker = wrapper.find('#character-picker');
  expect(picker.exists()).toBeTruthy();
});
