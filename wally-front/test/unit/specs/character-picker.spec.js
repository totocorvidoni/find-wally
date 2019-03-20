import { mount } from '@vue/test-utils';
import picker from '@/components/character-picker';

const wrapper = mount(picker, {
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

const wally = wrapper.find('#wally');

test('No event was emitted when pick was wrong', async () => {
  wrapper.setMethods({ askToAPI: jest.fn().mockReturnValue(false) });
  await wally.trigger('click');
  expect(wrapper.emitted('found-it')).toBeFalsy();
});

test('"found-it" event was emitted when pick was right', async () => {
  wrapper.setMethods({ askToAPI: jest.fn().mockReturnValue(true) });
  await wally.trigger('click');
  expect(wrapper.emitted('found-it')).toBeTruthy();
});
