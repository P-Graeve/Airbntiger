const displayAvatar = (input, label) => {
  // add an image preview provided in e to the label element provided in the params
  if (input.files && input.files[0]) {
     const reader = new FileReader();
    reader.onload = (e) => {
      // add to the label
      label.innerHTML = `
        <img src="${e.target.result}" width="30" height="30" class="avatar-preview" />
        <span>Upload Avatar</span>
      `;
    }
    reader.readAsDataURL(input.files[0]);
  }
}

export const initAvatarUploadBtn = () => {
  const input = document.querySelector("#user_avatar");
  const label = document.querySelector("label.file");

  // set innertext to 'upload avatar' with icon
  label.innerHTML = `
    <i class="fas fa-upload"></i>
    <span>Upload Avatar</span>
  `;

  // add an event listener to the input, for when an avatar is uploaded, change the label
  input.addEventListener('change', e => {
    displayAvatar(input, label);
  });
}