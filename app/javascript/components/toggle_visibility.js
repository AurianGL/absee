

const toggler = document.querySelector(".toggler");

const visibilityToggle = (event) => {
  const e = event.currentTarget
  const divsToHide = document.querySelectorAll(`.${e.dataset.type}`);
 // console.log(event);
 console.log(divsToHide);
    divsToHide.forEach((divToHide) => {
      divToHide.classList.toggle('hideComment');
    });
}


const initToggleVisibility = () => {
  if( toggler ) {
    toggler.addEventListener("change", visibilityToggle);
  }
}

export {initToggleVisibility}
