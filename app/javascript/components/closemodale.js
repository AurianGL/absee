const closeModale = () => {

  const modale = document.querySelector("#colorSwatchEdit");
  const btnValidate = document.querySelector(".btn-circle-save");

if (modale && btnValidate) {
  btnValidate.addEventListener("click", (event) => {
    modale.modal('hide');
  })
}

}

export { closeModale };

const showModale = () => {
  const welcome = document.querySelector("#welcome");

  window.addEventListener('load', (event) => {

      $(welcome).modal('show');
  });
}

export { showModale };
