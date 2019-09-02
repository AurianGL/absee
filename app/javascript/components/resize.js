  const resizeIcons = document.querySelectorAll('.resizeIcon')

let currentCommentToResize;

const resize = (event) => {
  const e = event.currentTarget
  console.log(e)
  const sizeToApply = e.dataset.size
  currentCommentToResize = e.parentElement;
  console.log(currentCommentToResize);
  currentCommentToResize.classList.remove('big', 'small', 'medium')
  currentCommentToResize.classList.add(`${sizeToApply}`);
}

const initResize = () => {
  resizeIcons.forEach((resizeIcon) => {
    resizeIcon.addEventListener('click', resize);
  })
}

export {initResize}



