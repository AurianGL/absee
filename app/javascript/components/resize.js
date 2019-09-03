
const resizeIcons = document.querySelectorAll('.resizeIcon')


let currentCommentToResize;

const resize = (event) => {
  const e = event.currentTarget;
  console.log(e);
  const sizeToApply = e.dataset.size;
  const elementToResize = e.dataset.type;
  console.log(elementToResize)
  currentCommentToResize = document.querySelector(`.${elementToResize}`);
  console.log(currentCommentToResize);
  currentCommentToResize.classList.remove('big', 'small', 'medium')
  currentCommentToResize.classList.add(`${sizeToApply}`);
  saveSize( `${sizeToApply}` );
}

const saveSize = (size) => {
  const sizeForm = currentCommentToResize.querySelector(".size-form");
  console.log(sizeForm.querySelector(".size-form-input"));
  sizeForm.querySelector(".size-form-input").value = size;
  sizeForm.querySelector(".size-form-submit").click();
}

const initResize = () => {
  resizeIcons.forEach((resizeIcon) => {
    resizeIcon.addEventListener('click', resize);
  })
}

export {initResize}

