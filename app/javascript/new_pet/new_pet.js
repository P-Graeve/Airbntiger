const updateImgs = () => {
  const input = document.querySelector("#pet_photos")
  const imgContainer = document.querySelector("#img-container");
  const images = input.files;

  // clear the image container
  imgContainer.innerHTML = "";

  Object.keys(images).forEach(image => {
    const imgObject = images[image];
    const reader = new FileReader();

    reader.onload = (e) => {
      imgContainer.insertAdjacentHTML('afterbegin', `
        <img width="70" src=${e.target.result} />
        `);
    }

    reader.readAsDataURL(imgObject);
  });
}

export const initPhotosChange = () => {
  const input = document.querySelector("#pet_photos");

  input.addEventListener('change', () => {
    updateImgs(input);
  })
}