import Calendar from 'js-year-calendar';

const displayCurrentMonth = () => {
  const monthContainers = document.querySelectorAll('.month-container');
  monthContainers.forEach(container => {
    if (container.dataset.monthId !== '0') {
      // add none class
      container.classList.add('none');
    }
  })
}

export const initCalendar = () => {
  const container = document.querySelector('#calendar');
  if (container) {
    // create a new calendar
    new Calendar(container, {
      style: 'background'
    });

    // hide the headers
    document.querySelector('.calendar-header').classList.add('none')

    displayCurrentMonth();
  }
}