const zs = document.querySelectorAll(".draggable")
const moodboard = document.querySelector(".moodboard")
let lastZ = moodboard.dataset.lastz

const setZ = (event) => {
  console.log("lol")
  const t = event.currentTarget;
  t.style.zIndex = `${lastZ}`;
  lastZ++;
}

const initSetZ = () => {
  zs.forEach((z) => {
    if ( z ) {
      z.addEventListener("mousedown", setZ);
    }
  })
}

export {initSetZ}
