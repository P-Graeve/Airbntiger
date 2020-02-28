export const calculateCost = () => {
  const starting = localStorage.getItem('start-date');
  const ending = localStorage.getItem('end-date');
  const startingDay = new Date(starting);
  const endingDay = new Date(ending);

  const day = -1 * (((startingDay - endingDay) /  86400000) + 1);
  const inject = document.querySelector("#calc");
  if (inject) {
    inject.innerHTML = `${day} days`;
    const total = document.querySelector("#calc-total");
    const thePrice = document.querySelector("#actual-price");
    const price = parseInt(total.dataset.price);
    total.innerHTML = `${day * price } Euros in total`;
  }
}
