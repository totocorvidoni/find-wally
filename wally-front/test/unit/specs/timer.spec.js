import { mount } from '@vue/test-utils';
import timer from '@/components/timer';

beforeEach(() => {
  jest.useFakeTimers();
});

test('Will add one second ', () => {
  const wrapper = mount(timer);
  jest.advanceTimersByTime(1000);
  expect(wrapper.vm.sec).toBe(1);
});

test('Will add one minute ', () => {
  const wrapper = mount(timer);
  wrapper.setData({ sec: 59 });
  jest.advanceTimersByTime(1000);
  expect(wrapper.vm.sec).toBe(0);
  expect(wrapper.vm.min).toBe(1);
});

test('Will add one hour ', () => {
  const wrapper = mount(timer);
  wrapper.setData({ sec: 59 });
  wrapper.setData({ min: 59 });
  jest.advanceTimersByTime(1000);
  expect(wrapper.vm.sec).toBe(0);
  expect(wrapper.vm.min).toBe(0);
  expect(wrapper.vm.hour).toBe(1);
});
