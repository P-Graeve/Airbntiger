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
    displayAvatar(e, label);
  });
}