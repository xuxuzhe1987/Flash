import MarkdownIt from 'markdown-it';

const initFlashcard = () => {

const answers = document.querySelectorAll(".answer")
answers.forEach(e=>{
  e.querySelector(".flashcard-content").innerText = e.querySelector(".flashcard-content").innerText.replace(/bash/g, '')
})
//
const initMarkdown = (answer) => {
  console.log(answer);
  const markdown = new MarkdownIt();
  const html = markdown.render(answer.querySelector(".flashcard-content").innerText);
  answer.querySelector(".flashcard-content").innerHTML = html;
  };
// const swiper = new Swiper(".swiper-container", {
//     // a11y: {
//     //   // still not working
//     //   enabled: true,
//     //   firstSlideMessage: 'Lets go!!',
//     //   lastSlideMessage: "Last one and done!",
//     // },
//     // effect: 'cube',
//     // cubeEffect: {
//     //   shadow: true,
//     //   slideShadows: true,
//     //   shadowOffset: 20,
//     //   shadowScale: 0.94,
//     // },
//       // effect: 'fade',
//     loop: false,
//     allowSlidePrev: false,
//     watchSlidesProgress: true,
//       // allowSlideNext: false,
//     slidesPerView:1,
//     spaceBetween: 15,
//     pagination: {
//     // el: '.swiper-paginatio n',
//     // type: 'progressbar',
//     // type: 'fraction',
//     },
//     allowSlideNext: false,
//     allowTouchMove: true,
//     centeredSlides: true,
//     // breakpoints: {
//     //   640: {
//     //     slidesPerView: 1,
//     //     spaceBetween: 20,
//     //   },
//     //   768: {
//     //     slidesPerView: 1,
//     //     spaceBetween: 40,
//     //   },
//     //     1024: {
//     //       slidesPerView: 1,
//     //       spaceBetween: 50,
//     //     },
//     //   }
//   });

  // swiper.on('slideChange', function(){
  //   let hideAnswers = document.querySelectorAll(".answer")
  //   hideAnswers.forEach((e) => {
  //     if (!e.classList.contains("hidden")) {
  //       e.classList.add("hidden")
  //       console.log("add hidden")
  //     }
  //   });
  //   let hideHints = document.querySelectorAll(".hint")
  //   hideHints.forEach((e) => {
  //     if (!e.classList.contains("hidden")) {
  //       e.classList.add("hidden")
  //       console.log("add hidden")
  //     }
  //   });
  //   let hideUserAnswers = document.querySelectorAll(".text-box")
  //   hideUserAnswers.forEach((e) => {
  //     if (!e.classList.contains("hidden")) {
  //       e.classList.add("hidden")
  //     }
  //   });
  // });

  // swiper.on('doubleTap', function () {
  // console.log('double tap');
  // // let answers = document.querySelectorAll(".answer")
  // // answers.forEach(e => e.classList.toggle("hidden"))
  // flip()
  // });

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
    dontKnowBtn.forEach((btn) => {
    btn.addEventListener('click', (e) => {
    nextCard()
    })
  })

  // const flipBtn = document.querySelectorAll(".flip")
  // flipBtn.forEach((btn) => {
  //   btn.addEventListener('click', (e) => {
  //   console.log(e)
  //   flip()
  //   })
  // })


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
      e.preventDefault()
    nextCard()
    })
  })

  const hintBtn = document.querySelectorAll("#hint")
  hintBtn.forEach((btn) => {
    btn.addEventListener('click', (e) => {
      hint()
    })
  })

  const instructionBtn = document.querySelector("#instructions")
  console.log(instructionBtn)
  instructionBtn.addEventListener('click', (e) => {
      instruction()
    })

  const seeAnswerBtn = document.querySelectorAll("#show-answer")
  seeAnswerBtn.forEach((btn) => {
    btn.addEventListener('click', (e) => {
    flip()
    })
  })

  const nextCard = () => {
    answers.forEach(e => e.classList.add("hidden"))
    questions.forEach(e => e.classList.remove("hidden"))
    current.style.display = "none"
    next.style.display = "block"
    current = next
    nowIndex = nowIndex === (cards.length - 1) ? 0 : nowIndex + 1
    nextIndex = nextIndex === (cards.length - 1) ? 0 : nextIndex + 1
    next = document.getElementById(`card-${nextIndex}`)
    hideAnswers()
    hideHints()
    hideUserAnswers()
  }

  const dontKnow = () => {
    console.log('dontKnow')
    nextCard()
    // swiper.slideTo(nextIndex)
  }

   const flip = () => {
    answers.forEach(e => {
      e.classList.toggle("hidden")
      initMarkdown(e)
    })
    // swiper.allowSlideNext = true
  }

  const mainTitles = document.querySelectorAll('h3')
    mainTitles.forEach((title) => {
    title.addEventListener('click', (e) => {
    console.log(e.currentTarget)
    flip()
    })
  })

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

  const hideAnswers = () => {
    const hideAnswers = document.querySelectorAll(".answer")
    hideAnswers.forEach((e) => {
      if (!e.classList.contains("hidden")) {
        e.classList.add("hidden")
        console.log("add hidden")
      }
    });
  }
  const hideHints = () => {
    let hideHints = document.querySelectorAll(".hint")
    hideHints.forEach((e) => {
      if (!e.classList.contains("hidden")) {
        e.classList.add("hidden")
        console.log("add hidden")
      }
    });
  }
  const hideUserAnswers = () => {
    const hideUserAnswers = document.querySelectorAll(".text-box")
    hideUserAnswers.forEach((e) => {
      if (!e.classList.contains("hidden")) {
        e.classList.add("hidden")
      }
    });
  }
}
export { initFlashcard };
