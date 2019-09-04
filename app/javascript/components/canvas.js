const drawables = document.querySelectorAll('.drawable')

let currentDrawable;
let initY;
let initX;
let context

const start = (event) => {
  currentDrawable = event.currentTarget;
  // console.log(currentDrawable);
  initY = event.offsetY;
  initX = event.offsetX;
  context = currentDrawable.getContext('2d');
  currentDrawable.addEventListener("mousemove", draw);
}

const stop = (event) => {
  // console.log(event);
  currentDrawable.removeEventListener("mousemove", draw);
  const data = currentDrawable.toDataURL()
  console.log(data)
  // console.log(currentDrawable);
  save( data );
}

const draw = (event) => {
  // console.log(currentDrawable);
  // console.log(event.offsetX, event.offsetY);

  context.lineCap = 'round';
  context.lineJoin = 'round';
  context.strokeStyle = '#00fff6';
  context.lineWidth = 4;


  context.beginPath();
  context.moveTo(initX, initY);
  context.lineTo(event.offsetX, event.offsetY);
  context.stroke();
  initY = event.offsetY;
  initX = event.offsetX;
}

const save = (data) => {
  const canvasForm = currentDrawable.querySelector(".canvas-form");
  canvasForm.querySelector(".canvas-form-input").value = data;
  console.log(canvasForm.querySelector(".canvas-form-input").value);
  canvasForm.querySelector(".canvas-form-submit").click();
}

const loadCanvas = (drawable) => {
  console.log("lol")
  const ctx = drawable.getContext('2d');
  let img = new Image();
  img.addEventListener("load", () => {
    ctx.drawImage(img, 0, 0)
  });
  img.src = drawable.dataset.canvas;
}

const initCanvas = () => {
  drawables.forEach((drawable) => {
    if ( drawable ){
        loadCanvas(drawable);
        drawable.addEventListener( "mousedown", start);
        drawable.addEventListener( "mouseup", stop);
      }
  });
}

export {initCanvas}
