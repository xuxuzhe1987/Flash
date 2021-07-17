const initFlashcard = () => {

  const swiper = new Swiper(".mySwiper", {
    a11y: {
      // still not working
      enabled: true,
      firstSlideMessage: 'Lets go!!',
      lastSlideMessage: "Last one and done!",
    },
    // effect: 'cube',
    // cubeEffect: {
    //   shadow: true,
    //   slideShadows: true,
    //   shadowOffset: 20,
    //   shadowScale: 0.94,
    // },
      // effect: 'fade',
    loop: true,
    allowSlidePrev: false,
    watchSlidesProgress: true,
      // allowSlideNext: false,
    slidesPerView:1,
    spaceBetween: 30,
    pagination: {
    el: '.swiper-pagination',
    type: 'progressbar',
    // type: 'fraction',
    },
    // breakpoints: {
    //   640: {
    //     slidesPerView: 1,
    //     spaceBetween: 20,
    //   },
    //   768: {
    //     slidesPerView: 1,
    //     spaceBetween: 40,
    //   },
    //     1024: {
    //       slidesPerView: 1,
    //       spaceBetween: 50,
    //     },
    //   }
  });

  swiper.on('slideChange', function(){
    let hideAnswers = document.querySelectorAll(".answer")
    hideAnswers.forEach((e) => {
      if (!e.classList.contains("hidden")) {
        e.classList.add("hidden")
        console.log("add hidden")
      }
    });
  });

  // function to block swipe unless having checked answer
    // swiper.on('slideNextTransitionEnd', function(){
    //   console.log('checking transition')
    //   swiper.allowSlideNext = false
   // })

  let nowIndex = 0
  let nextIndex = 1
  let cards = document.querySelectorAll(".card")

  let current = document.getElementById(`card-${nowIndex}`)
  current.style.display = "block"
  let next = document.getElementById(`card-${nextIndex}`)

  const questions = document.querySelectorAll(".question")
  const answers = document.querySelectorAll(".answer")
  const hints = document.querySelectorAll(".hint")

  let dontKnowBtn = document.getElementById("unknow")
  console.log(dontKnowBtn)
  dontKnowBtn.addEventListener("click", (e) => {
    console.log(e)
    dontKnow()
  })

  let flipBtn = document.getElementById("flip")
  flipBtn.addEventListener("click", (e) => {
    flip()
  })

  let answerMeBtn = document.getElementById("user-answer")
  answerMeBtn.addEventListener('click', (e) => {
    add()
  })

  let knowBtn = document.getElementById("know")
  knowBtn.addEventListener('click', (e) => {
    nextCard()
  })

  function nextCard() {
    console.log('nextCard')
    answers.forEach(e => e.classList.add("hidden"))
    questions.forEach(e => e.classList.remove("hidden"))
    current.style.display = "none"
    next.style.display = "block"
    current = next
    nowIndex = nowIndex === (cards.length - 1) ? 0 : nowIndex + 1
    nextIndex = nextIndex === (cards.length - 1) ? 0 : nextIndex + 1
    next = document.getElementById(`card-${nextIndex}`)
  }

  function dontKnow() {
    console.log('dontKnow')
    nextCard()
    swiper.slideTo(nextIndex)

  }

  function flip() {
    answers.forEach(e => e.classList.toggle("hidden"))
    // swiper.allowSlideNext = true
  }

  function hint() {
    hints.forEach(e => e.classList.toggle("hidden"))
  }

  function add() {
   const userAnswers = document.querySelectorAll(".text-box")
   userAnswers.forEach(e => e.classList.toggle("hidden"))
  }

  function instruction() {
    const instruction = document.getElementById("flash-instructions")
    instruction.classList.toggle("hidden")
  }

}
export { initFlashcard };
