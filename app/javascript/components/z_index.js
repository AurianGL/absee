const zs = document.querySelectorAll(".draggable")
const moodboard = document.querySelector(".moodboard")
let lastZ = moodboard.dataset.lastz
let t

const setZ = (event) => {
  lastZ++;
  t = event.currentTarget;
  t.style.zIndex = `${lastZ}`;
  saveZ(lastZ);
}

const saveZ = (z) => {
  // console.log(t);
  const zForm = t.querySelector(".z-form");
  const zFormInput = t.querySelector(".z-form-input");
  // console.log(zForm)
  // console.log(zFormInput);
  zForm.querySelector(".z-form-input").value = z;
  zForm.querySelector(".z-form-submit").click();
}

const initSetZ = () => {
  zs.forEach((z) => {
    if ( z ) {
      z.addEventListener("mousedown", setZ);
    }
  })
}

export {initSetZ}
