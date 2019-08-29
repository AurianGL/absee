const drawables = document.querySelectorAll('.drawable')

let currentDrawable;
let initY;
let initX;
let context

const start = (event) => {
  console.log(event);
  currentDrawable = event.currentTarget;
  initY = event.offsetY;
  initX = event.offsetX;
  context = currentDrawable.getContext('2d');
  currentDrawable.addEventListener("mousemove", draw);
}

const stop = (event) => {
  console.log(event);
  currentDrawable.removeEventListener("mousemove", draw);
}

const draw = (event) => {
  console.log(currentDrawable);
  console.log(event.offsetX, event.offsetY);

  context.lineCap = 'round';
  context.lineJoin = 'round';
  context.strokeStyle = 'black';

  context.beginPath();
  context.moveTo(initX, initY);
  context.lineTo(event.offsetX, event.offsetY);
  context.stroke();
  initY = event.offsetY;
  initX = event.offsetX;
}

const initCanvas = () => {
  drawables.forEach((drawable) => {
    drawable.addEventListener( "mousedown", start);
    drawable.addEventListener( "mouseup", stop);
  });
}

export {initCanvas}
