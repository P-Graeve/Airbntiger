const injectOccupiedInCalendar = (periods, selectedMonth) => {
  // for each cell in our table, check if it is in between the 2 periods
  const tds = document.querySelectorAll('.selected-month td');
  const year = 2020; // TODO: make this dynamic
  const month = selectedMonth - 1;
  // console.log(periods);
  tds.forEach(td => {
    // create a new date with the infos
    if (td.innerText) {
      const thisDate = new Date(year, month, td.innerText);

      periods.forEach((period, i) => {
        if (i % 2 === 0) {
          // these are start dates
          const startDate = period;
          const endDate = periods[i + 1];
          // check if it is in between dates
          if (startDate <= thisDate && endDate >= thisDate) {
            // pet is occupied!
            td.classList.add('occupied');
          }
        }
      });
    }
  });
}

export const refreshOccupied = (selectedMonth) => {
  // we need to get all of the start and end dates of this pet
  const dateStr = document.querySelector("#calendar").dataset.dates;
  const datePeriods = dateStr.split('|').map(str => {
    const arr = str.split('-');
    arr[0] = parseInt(arr[0]) + 2000;
    console.log(arr);
    return new Date(arr[0], arr[1] - 1, arr[2]);
  });
  injectOccupiedInCalendar(datePeriods, selectedMonth);
}