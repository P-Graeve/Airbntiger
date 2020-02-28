const refreshRates = () => {
  const startYear = document.querySelector('#booking_start_date_1i').value || '2020';
  const startMonth = document.querySelector('#booking_start_date_2i').value;
  const startDay = document.querySelector('#booking_start_date_3i').value;
  const endYear = document.querySelector('#booking_end_date_1i').value || '2020';
  const endMonth = document.querySelector('#booking_end_date_2i').value;
  const endDay = document.querySelector('#booking_end_date_3i').value;
  console.log(startYear, startMonth, startDay, endYear, endMonth, endDay);
  const startD = new Date(startYear, parseInt(startMonth) - 1, startDay);
  const endD = new Date(endYear, parseInt(endMonth) - 1, endDay);
  const days = ((endD - startD) / 86400000) + 1;

  const p = document.querySelector('#calc').innerText = `${days} days`;
  const price = parseInt(document.querySelector("#calc-total").dataset.price);
  const totalP = document.querySelector("#calc-total").innerText = `${days * price} Euros in total`;
}

const initChangeListener = () => {
  const inputs = document.querySelectorAll('select.date');
  console.log('we');
  inputs.forEach(input => {
    input.addEventListener('change', refreshRates);
  })
}

export const calculateCost = () => {
  const starting = localStorage.getItem('start-date');
  const ending = localStorage.getItem('end-date');
  const startingDay = new Date(starting);
  const endingDay = new Date(ending);

  const day = ((endingDay - startingDay) / 86400000) + 1;
  const inject = document.querySelector("#calc");
  if (inject) {
    inject.innerHTML = `${day} days`;
    const total = document.querySelector("#calc-total");
    const thePrice = document.querySelector("#actual-price");
    const price = parseInt(total.dataset.price);
    total.innerHTML = `${day * price } Euros in total`;
    initChangeListener();
  }
}
