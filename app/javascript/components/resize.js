
const resizeIcons = document.querySelectorAll('.resizeIcon')


let currentCommentToResize;

const resize = (event) => {
  const e = event.currentTarget;
  // console.log(e);
  const sizeToApply = e.dataset.size;
  const elementToResize = e.dataset.type;
  console.log(elementToResize);

  currentCommentToResize = document.querySelector(`.${elementToResize}`);
  const canvas = currentCommentToResize.querySelector("canvas");
  const ctx = canvas.getContext("2d");
  const img = currentCommentToResize.querySelector("img");
  // console.log(currentCommentToResize);
  currentCommentToResize.classList.remove('big', 'small', 'medium');
  currentCommentToResize.classList.add(`${sizeToApply}`);
  const newHeight = img.offsetHeight;
  const newWidth = img.offsetWidth;
  console.log(newHeight, newWidth)
  const width = canvas.offsetWidth;
  const height = canvas.offsetHeight;
  const image = new Image();
  const data = canvas.toDataURL();
  canvas.width = newWidth;
  canvas.height = newHeight;
  image.addEventListener("load", () => {
    ctx.clearRect(0, 0, width, height);
    ctx.drawImage(image, 0, 0, width, height, 0, 0, newWidth, newHeight);
  });
  image.src =  data;
  saveSize( `${sizeToApply}` );
}

const saveSize = (size) => {
  const sizeForm = currentCommentToResize.querySelector(".size-form");
  // console.log(sizeForm.querySelector(".size-form-input"));
  sizeForm.querySelector(".size-form-input").value = size;
  sizeForm.querySelector(".size-form-submit").click();
}

const initResize = () => {
  resizeIcons.forEach((resizeIcon) => {
    resizeIcon.addEventListener('click', resize);
  })
}

export {initResize}

