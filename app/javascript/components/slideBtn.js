// add color/comment buttons //

const slideBtn = () => {

  const btn = document.querySelector(".btn-circle-plus");
  const swatch = document.querySelector(".swatch-menu")
  const comment = document.querySelector(".comment-menu")

  if ( btn ) {
    btn.addEventListener("click", (event) => {
      swatch.classList.toggle("slide");
      comment.classList.toggle("slide");
    })
  }
}

export { slideBtn }


// comments display buttons //

// const popBtn = () => {

//   const btnCom = document.querySelector(".btn-circle-view-big");
//   const allComment = document.querySelector(".comment-view-all")

//   btnCom.addEventListener("click", (event) => {
//     allComment.classList.toggle("pop");
//   })
// }

// export { popBtn }


// versions display buttons //

const displayBtn = () => {

  const btnDis = document.querySelector(".btn-circle-versions");
  const newVersion = document.querySelector(".version-add")
  const allVersion = document.querySelector(".version-history")

  if ( btnDis ) {
    btnDis.addEventListener("click", (event) => {
      btnDis.classList.toggle("display");
      newVersion.classList.toggle("display");
      allVersion.classList.toggle("display");
    })
  }
}

export { displayBtn }
