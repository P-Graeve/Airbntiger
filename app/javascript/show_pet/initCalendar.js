import Calendar from 'js-year-calendar';

export const initCalendar = () => {
  const container = document.querySelector('#calendar');
  if (container) {
    // create a new calendar
    new Calendar(container, {
      style: 'background'
    });
  }
}