const draggables = document.querySelectorAll(".draggable");

const initSetSize = () => {
  draggables.forEach((draggable) => {
    draggable.querySelector("img", findSize)
  })
}






const drawables = document.querySelectorAll('.drawable');


const initPaint = () => {
 drawables.forEach((drawable) => {
    // au chargement
    const draw = () => {
      context.drawImage(img)
    }

    img.src = drawable.dataset.canvas;
    let img = new Image;
    img.onload = draw()

 })
}
