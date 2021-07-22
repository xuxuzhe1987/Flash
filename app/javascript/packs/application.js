// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import MarkdownIt from 'markdown-it';

const answers = document.querySelectorAll(".answer")

const initMarkdown = (answer) => {

  console.log(answer)
  const markdown = new MarkdownIt();
  const html = markdown.render(answer.querySelector(".flashcard-content").innerText);
  answer.querySelector(".flashcard-content").innerHTML = html;
};
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
// import { initFlashcard } from '../components/flashcard_swiping';

const swiper = new Swiper(".swiper-container", {
    // a11y: {
    //   // still not working
    //   enabled: true,
    //   firstSlideMessage: 'Lets go!!',
    //   lastSlideMessage: "Last one and done!",
    // },
    // effect: 'cube',
    // cubeEffect: {
    //   shadow: true,
    //   slideShadows: true,
    //   shadowOffset: 20,
    //   shadowScale: 0.94,
    // },
      // effect: 'fade',
    loop: false,
    allowSlidePrev: false,
    watchSlidesProgress: true,
      // allowSlideNext: false,
    slidesPerView:1,
    spaceBetween: 15,
    pagination: {
    // el: '.swiper-paginatio n',
    // type: 'progressbar',
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
    let hideHints = document.querySelectorAll(".hint")
    hideHints.forEach((e) => {
      if (!e.classList.contains("hidden")) {
        e.classList.add("hidden")
        console.log("add hidden")
      }
    });
    let hideUserAnswers = document.querySelectorAll(".text-box")
    hideUserAnswers.forEach((e) => {
      if (!e.classList.contains("hidden")) {
        e.classList.add("hidden")
      }
    });
  });

  swiper.on('doubleTap', function () {
  console.log('double tap');
  // let answers = document.querySelectorAll(".answer")
  // answers.forEach(e => e.classList.toggle("hidden"))
  flip()
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

  const hints = document.querySelectorAll(".hint")

  const dontKnowBtn = document.querySelectorAll(".unknow")
  console.log(dontKnowBtn)
    dontKnowBtn.forEach((btn) => {
    btn.addEventListener('click', (e) => {
    console.log(e)
    nextCard()
    })
  })

  const flipBtn = document.querySelectorAll(".flip")
  flipBtn.forEach((btn) => {
    btn.addEventListener('click', (e) => {
    console.log(e)
    flip()
    })
  })


  const answerMeBtn = document.querySelectorAll(".user-answer")
  answerMeBtn.forEach((btn) => {
    btn.addEventListener('click', (e) => {
    console.log(e)
    add()
    })
  })

  const knowBtn = document.querySelectorAll(".know")
  knowBtn.forEach((btn) => {
    btn.addEventListener('click', (e) => {
    console.log(e)
    nextCard()
    })
  })

  const hintBtn = document.querySelectorAll("#hint")
  hintBtn.forEach((btn) => {
    btn.addEventListener('click', (e) => {
      console.log(e)
      hint()
    })
  })

  const instructionBtn = document.querySelector("#instructions")
  console.log(instructionBtn)
  instructionBtn.addEventListener('click', (e) => {
    console.log(e)
      instruction()
    })

  const seeAnswerBtn = document.querySelectorAll("#show-answer")
  seeAnswerBtn.forEach((btn) => {
    btn.addEventListener('click', (e) => {
    flip()
    })
  })

  const nextCard = () => {
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

  const dontKnow = () => {
    console.log('dontKnow')
    nextCard()
    swiper.slideTo(nextIndex)

  }

  const flip = () => {
    answers.forEach(e => {
      e.classList.toggle("hidden")
      initMarkdown(e)
    })
    // swiper.allowSlideNext = true

  }

  const hint = () => {
    hints.forEach(e => e.classList.toggle("hidden"))
  }

  const add = () => {
   const userAnswers = document.querySelectorAll(".text-box")
   userAnswers.forEach(e => e.classList.toggle("hidden"))
  }

  const instruction = () => {
    const instruction = document.getElementById("flash-instructions")
    instruction.classList.toggle("hidden")
  }


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  console.log('helllooo')
  // initFlashcard();
});


